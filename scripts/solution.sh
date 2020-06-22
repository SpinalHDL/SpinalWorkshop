#!/bin/sh

set -x #echo on

SRC=workshop/src

cp -f $SRC/blackboxAndClock/assets/MemorySumming.solution $SRC/blackboxAndClock/MemorySumming.scala
cp -f $SRC/counter/assets/Counter.solution $SRC/counter/Counter.scala
cp -f $SRC/prime/assets/Prime.solution $SRC/prime/Prime.scala
cp -f $SRC/apb3decoder/assets/Apb3Decoder.solution $SRC/apb3decoder/Apb3Decoder.scala
cp -f $SRC/function/assets/FunctionUnit.solution $SRC/function/FunctionUnit.scala
cp -f $SRC/mandelbrot/assets/PixelSolver.solution $SRC/mandelbrot/PixelSolver.scala
cp -f $SRC/mandelbrot/assets/PixelSolverMultiCore.solution $SRC/mandelbrot/PixelSolverMultiCore.scala
cp -f $SRC/pwm/assets/ApbPwm.solution $SRC/pwm/ApbPwm.scala
cp -f $SRC/stream/assets/StreamUnit.solutionByHand $SRC/stream/StreamUnit.scala
cp -f $SRC/timer/assets/Timer.solution $SRC/timer/Timer.scala
cp -f $SRC/uart/assets/UartCtrlRx.solution $SRC/uart/UartCtrlRx.scala
cp -f $SRC/udp/assets/UdpApp.solution $SRC/udp/UdpApp.scala
cp -f $SRC/waveplayer/assets/WavePlayer.solution $SRC/waveplayer/WavePlayer.scala
cp -f $SRC/simCounter/assets/SimCounterTestbench.solution $SRC/simCounter/SimCounterTestbench.scala
cp -f $SRC/simStreamJoinFork/assets/SimStreamJoinForkTestbench.solution $SRC/simStreamJoinFork/SimStreamJoinForkTestbench.scala
