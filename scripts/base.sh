#!/bin/sh

set -x #echo on

SRC=workshop/src

cp -f $SRC/blackboxAndClock/assets/MemorySumming.base $SRC/blackboxAndClock/MemorySumming.scala
cp -f $SRC/counter/assets/Counter.base $SRC/counter/Counter.scala
cp -f $SRC/function/assets/FunctionUnit.base $SRC/function/FunctionUnit.scala
cp -f $SRC/prime/assets/Prime.base $SRC/prime/Prime.scala
cp -f $SRC/apb3decoder/assets/Apb3Decoder.base $SRC/apb3decoder/Apb3Decoder.scala
cp -f $SRC/mandelbrot/assets/PixelSolver.base $SRC/mandelbrot/PixelSolver.scala
cp -f $SRC/mandelbrot/assets/PixelSolverMultiCore.base $SRC/mandelbrot/PixelSolverMultiCore.scala
cp -f $SRC/pwm/assets/ApbPwm.base $SRC/pwm/ApbPwm.scala
cp -f $SRC/stream/assets/StreamUnit.base $SRC/stream/StreamUnit.scala
cp -f $SRC/timer/assets/Timer.base $SRC/timer/Timer.scala
cp -f $SRC/uart/assets/UartCtrlRx.halfDone $SRC/uart/UartCtrlRx.scala
cp -f $SRC/udp/assets/UdpApp.baseHalfDone $SRC/udp/UdpApp.scala
cp -f $SRC/waveplayer/assets/WavePlayer.base $SRC/waveplayer/WavePlayer.scala
cp -f $SRC/simCounter/assets/SimCounterTestbench.base $SRC/simCounter/SimCounterTestbench.scala
cp -f $SRC/simStreamJoinFork/assets/SimStreamJoinForkTestbench.base $SRC/simStreamJoinFork/SimStreamJoinForkTestbench.scala
