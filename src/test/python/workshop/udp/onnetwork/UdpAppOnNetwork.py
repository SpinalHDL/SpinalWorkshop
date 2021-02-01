import random
from queue import Queue

import cocotb
from cocotb.scoreboard import Scoreboard
from cocotb.triggers import RisingEdge, Timer

from cocotblib.Phase import PhaseManager, Infrastructure, PHASE_SIM
from cocotblib.Scorboard import ScorboardInOrder
from cocotblib.Stream import StreamDriverMaster, Stream, Transaction, StreamDriverSlave, StreamMonitor
from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, randBits

import socket
import thread
from _socket import SOL_SOCKET, SO_REUSEADDR, SO_BROADCAST

SERVER_PORT = 37984


class DriverAgent(Infrastructure):
    def __init__(self, name, parent, dut, sock,clkTocken):
        Infrastructure.__init__(self,name,parent)
        self.clkTocken = clkTocken
        self.rxCmdQueue = Queue()
        self.rxDataQueue = Queue()

        self.sock = sock

        StreamDriverMaster(Stream(dut, "io_rx_cmd"), self.genRxCmd, dut.clk, dut.reset)
        StreamDriverMaster(Stream(dut, "io_rx_data"), self.genRxData, dut.clk, dut.reset)
        StreamDriverSlave(Stream(dut, "io_tx_cmd"), dut.clk, dut.reset)
        StreamDriverSlave(Stream(dut, "io_tx_data"), dut.clk, dut.reset)

        try:
            thread.start_new_thread(self.rxThread, ())
        except Exception as errtxt:
            print errtxt


    def rxThread(self):
        while True:
            data, addr = self.sock.recvfrom(2048)
            print "received message:", data, addr

            cmdTrans = Transaction()
            ipSplit = addr[0].split(".")
            cmdTrans.ip = 0
            for i in range(4):
                cmdTrans.ip |= int(ipSplit[i]) << (i*8)
            cmdTrans.srcPort = addr[1]
            cmdTrans.dstPort = SERVER_PORT
            cmdTrans.length = len(data)
            self.rxCmdQueue.put(cmdTrans)


            for i in range(len(data)):
                dataTrans = Transaction()
                dataTrans.last = (i == len(data)-1)
                dataTrans.fragment = ord(data[i])
                self.rxDataQueue.put(dataTrans)

            self.clkTocken[0] += 1000


    def genRxCmd(self):
        if self.getPhase() != PHASE_SIM:
            return None

        if not self.rxCmdQueue.empty():
            return self.rxCmdQueue.get()

    def genRxData(self):
        if self.getPhase() != PHASE_SIM:
            return None

        if not self.rxDataQueue.empty():
            return self.rxDataQueue.get()



import time
class MonitorAgent(Infrastructure):
    def __init__(self,name,parent,dut,sock):
        Infrastructure.__init__(self,name,parent)

        self.sock = sock

        self.txCmdQueue = Queue()
        self.txDataQueue = Queue()

        StreamMonitor(Stream(dut,"io_tx_cmd"), self.onTxCmd, dut.clk, dut.reset)
        StreamMonitor(Stream(dut, "io_tx_data"), self.onTxData, dut.clk, dut.reset)

        self.bootTime = time.time()


    def onTxCmd(self,trans):
        self.txCmdQueue.put(trans)
        self.update()

    def onTxData(self,trans):
        self.txDataQueue.put(trans)
        self.update()

    def update(self):
        if not self.txCmdQueue.empty():
            cmd = self.txCmdQueue.queue[0]
            if len(self.txDataQueue.queue) == cmd.length:
                self.txCmdQueue.get()
                ip = "%d.%d.%d.%d" % ((cmd.ip >> 0) &0xFF,(cmd.ip >> 8) &0xFF,(cmd.ip >> 16) &0xFF,(cmd.ip >> 24) &0xFF)

                payload = ""
                for i in range(cmd.length):
                    data = self.txDataQueue.get()
                    payload += chr(data.fragment)
                self.sock.sendto(payload, (ip, cmd.dstPort))

    def hasEnoughSim(self):
        return False #time.time() - self.bootTime > 120.0

import time
@cocotb.coroutine
def ClockDomainAsyncResetTokened(clk,reset,token,period = 1000):
    if reset:
        reset <= 1
    clk <= 0
    yield Timer(period)
    if reset:
        reset <= 0
    while True:
        if token[0] == 0:
            time.sleep(0.2);
        else:
            token[0] -= 1
        clk <= 0
        yield Timer(period/2)
        clk <= 1
        yield Timer(period/2)


@cocotb.test()
def test1(dut):
    random.seed(0)



    import time

    clkTocken = [1000]

    sock = socket.socket(socket.AF_INET,  # Internet
                         socket.SOCK_DGRAM)  # UDP
    sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    sock.setsockopt(SOL_SOCKET, SO_BROADCAST, 1)
    sock.bind(('', SERVER_PORT))


    cocotb.fork(ClockDomainAsyncResetTokened(dut.clk, dut.reset,clkTocken))
    cocotb.fork(simulationSpeedPrinter(dut.clk))

    phaseManager = PhaseManager()
    phaseManager.setWaitTasksEndTime(1000 * 200)


    DriverAgent("driver",phaseManager,dut,sock,clkTocken)
    MonitorAgent("monitor",phaseManager,dut,sock)


    yield phaseManager.run()