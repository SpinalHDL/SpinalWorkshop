import random
from Queue import Queue

import cocotb
from cocotb.triggers import Timer, Edge, RisingEdge, Join, Event, FallingEdge
import Tkinter
import thread
from workshop.common.misc import genClockAndReset, simulationSpeedPrinter

resX = 64
resY = 64

@cocotb.coroutine
def pixelTaskAgent(dut,validRatio):
    startX = -2.0
    startY = -1.5
    endX = 0.8
    endY = 1.5
    stepX = (endX-startX)/resX
    stepY = (endY - startY) / resY

    dut.io_pixelTask_valid <= 0
    yield RisingEdge(dut.clk)

    for y in xrange(resY):
        for x in xrange(resX):
            while random.random() > validRatio:
                yield RisingEdge(dut.clk)
            dut.io_pixelTask_valid <= 1
            dut.io_pixelTask_payload_x <= int((startX + x * stepX) * (1 << 20))
            dut.io_pixelTask_payload_y <= int((startY + y * stepY) * (1 << 20))
            while True:
                yield RisingEdge(dut.clk)
                if int(dut.io_pixelTask_ready) == 1:
                    dut.io_pixelTask_valid <= 0
                    break

@cocotb.coroutine
def pixelResultAgent(dut,resultArray,readyRatio):
    for y in xrange(resY):
        for x in xrange(resX):
            while True:
                dut.io_pixelResult_ready <= (random.random() <= readyRatio)
                yield RisingEdge(dut.clk)
                if int(dut.io_pixelResult_valid) == 1 and int(dut.io_pixelResult_ready) == 1:
                    resultArray[y][x] = int(dut.io_pixelResult_payload_iteration)
                    break

@cocotb.coroutine
def performanceCounterAgent(dut,counter):
    while True:
        yield RisingEdge(dut.clk)
        counter[0] += 1

@cocotb.coroutine
def pixelSolverTester(dut):
    dut.log.info("Cocotb test boot")

    speedBench = True

    cocotb.fork(genClockAndReset(dut))
    cocotb.fork(simulationSpeedPrinter(dut.clk))

    resultArray = [[0 for x in xrange(resX)] for y in xrange(resY)]
    performanceCounter = [0]
    pixelTaskThread = cocotb.fork(pixelTaskAgent(dut,1.0 if speedBench else 0.5))
    pixelResultThread = cocotb.fork(pixelResultAgent(dut,resultArray,1.0 if speedBench else 0.5))
    cocotb.fork(performanceCounterAgent(dut,performanceCounter))

    yield pixelTaskThread.join()
    yield pixelResultThread.join()

    iterationCount = 0
    for y in xrange(resY):
        for x in xrange(resX):
            iterationCount += resultArray[y][x] + 1

    print("Done in %d cycles => %f iteration/cycle" % (performanceCounter[0],1.0*iterationCount/performanceCounter[0]))

    from Tkinter import Tk, Canvas, PhotoImage, mainloop
    from math import sin

    zoomFactor = 4
    pictureWidth, pictureHeight = resX*zoomFactor, resY*zoomFactor
    window = Tk()
    canvas = Canvas(window, width=pictureWidth, height=pictureHeight, bg="#000000")
    canvas.pack()
    img = PhotoImage(width=pictureWidth, height=pictureHeight)
    canvas.create_image((pictureWidth / 2, pictureHeight / 2), image=img, state="normal")

    for y in xrange(resY):
        for x in xrange(resX):
            r,g,b = 0,0,0
            r = resultArray[y][x] << 4
            for zy in xrange(zoomFactor):
                for zx in xrange(zoomFactor):
                    img.put("#%02x%02x%02x" % (r,g,b), (x*zoomFactor +zx, y*zoomFactor +zy))

    window.mainloop()
