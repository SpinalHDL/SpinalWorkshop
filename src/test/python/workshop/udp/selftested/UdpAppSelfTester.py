import random
from queue import Queue

import cocotb
from cocotb.scoreboard import Scoreboard
from cocotb.triggers import RisingEdge

from cocotblib.Phase import PhaseManager, Infrastructure, PHASE_SIM
from cocotblib.Scorboard import ScorboardInOrder
from cocotblib.Stream import StreamDriverMaster, Stream, Transaction, StreamDriverSlave, StreamMonitor
from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, randBits, SimulationTimeout


class DriverAgent(Infrastructure):
    def __init__(self,name,parent,dut):
        Infrastructure.__init__(self,name,parent)

        StreamDriverMaster(Stream(dut,"io_rx_cmd"),self.genRxCmd(), dut.clk, dut.reset)
        StreamDriverMaster(Stream(dut, "io_rx_data"), self.genRxData(), dut.clk, dut.reset)
        StreamDriverSlave(Stream(dut, "io_tx_cmd"), dut.clk, dut.reset)
        StreamDriverSlave(Stream(dut, "io_tx_data"), dut.clk, dut.reset)

    def genRxCmd(self):
        while self.getPhase() != PHASE_SIM:
            yield None

        trans = Transaction()
        trans.ip = 0x11223344
        trans.srcPort = 0x1234
        trans.dstPort = 0x1111
        trans.length  = 2
        trans.nextDelay = 6
        yield trans

        trans = Transaction()
        trans.ip = 0x22334455
        trans.srcPort = 0x2345
        trans.dstPort = 37984
        trans.length  = 2
        trans.nextDelay = 3
        yield trans

        trans = Transaction()
        trans.ip = 0x33445566
        trans.srcPort = 0x3456
        trans.dstPort = 37984
        trans.length  = 1
        trans.nextDelay = 6
        yield trans

        trans = Transaction()
        trans.ip = 0x44556677
        trans.srcPort = 0x4567
        trans.dstPort = 37984
        trans.length  = 1
        trans.nextDelay = 6
        yield trans

        while True:
            yield None

    def genRxData(self):
        while self.getPhase() != PHASE_SIM:
            yield None

        for i in range(2):
            trans = Transaction()
            trans.last = 0
            trans.fragment = 0x55
            trans.nextDelay = 4
            yield trans

            trans = Transaction()
            trans.last = 1
            trans.fragment = 0x66
            trans.nextDelay = 10
            yield trans

        trans = Transaction()
        trans.last = 1
        trans.fragment = 0x11
        trans.nextDelay = 0
        yield trans

        trans = Transaction()
        trans.last = 1
        trans.fragment = 0x11
        yield trans

        while True:
            yield None



class MonitorAgent(Infrastructure):
    def __init__(self,name,parent,dut):
        Infrastructure.__init__(self,name,parent)

        self.txCmdScordboard = ScorboardInOrder("txCmdScordboard",self)
        self.txDataScordboard = ScorboardInOrder("txDataScordboard",self)
        StreamMonitor(Stream(dut,"io_tx_cmd"), self.txCmdScordboard.uutPush, dut.clk, dut.reset)
        StreamMonitor(Stream(dut, "io_tx_data"), self.txDataScordboard.uutPush, dut.clk, dut.reset)

        cmd = Transaction()
        cmd.ip = 0x33445566
        cmd.dstPort = 0x3456
        cmd.srcPort = 37984
        cmd.length  = 1+8
        self.txCmdScordboard.refPush(cmd)

        cmd = Transaction()
        cmd.ip = 0x44556677
        cmd.dstPort = 0x4567
        cmd.srcPort = 37984
        cmd.length  = 1+8
        self.txCmdScordboard.refPush(cmd)

        for i in range(2):
            data = Transaction()
            data.fragment = 0x22
            data.last = 0
            self.txDataScordboard.refPush(data)
            message = "test1234"
            for f in range(len(message)):
                data = Transaction()
                data.fragment = ord(message[f])
                data.last = (f == len(message)-1)
                self.txDataScordboard.refPush(data)

    def hasEnoughSim(self):
        return self.txCmdScordboard.refsCounter == self.txCmdScordboard.uutsCounter and self.txDataScordboard.refsCounter == self.txDataScordboard.uutsCounter

@cocotb.test()
def test1(dut):
    random.seed(0)

    cocotb.fork(ClockDomainAsyncReset(dut.clk, dut.reset))
    cocotb.fork(simulationSpeedPrinter(dut.clk))
    cocotb.fork(SimulationTimeout(1000 * 2000))

    phaseManager = PhaseManager()
    phaseManager.setWaitTasksEndTime(1000 * 200)


    DriverAgent("driver",phaseManager,dut)
    MonitorAgent("monitor",phaseManager,dut)


    yield phaseManager.run()