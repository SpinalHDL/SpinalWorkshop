#!/bin/sh

set -x #echo on

cp -f src/main/scala/workshop/blackboxAndClock/assets/MemorySumming.base src/main/scala/workshop/blackboxAndClock/MemorySumming.scala
cp -f src/main/scala/workshop/counter/assets/Counter.base src/main/scala/workshop/counter/Counter.scala
cp -f src/main/scala/workshop/function/assets/FunctionUnit.base src/main/scala/workshop/function/FunctionUnit.scala
cp -f src/main/scala/workshop/prime/assets/Prime.base src/main/scala/workshop/prime/Prime.scala
cp -f src/main/scala/workshop/apb3decoder/assets/Apb3Decoder.base src/main/scala/workshop/apb3decoder/Apb3Decoder.scala
cp -f src/main/scala/workshop/mandelbrot/assets/PixelSolver.base src/main/scala/workshop/mandelbrot/PixelSolver.scala
cp -f src/main/scala/workshop/mandelbrot/assets/PixelSolverMultiCore.base src/main/scala/workshop/mandelbrot/PixelSolverMultiCore.scala
cp -f src/main/scala/workshop/pwm/assets/ApbPwm.base src/main/scala/workshop/pwm/ApbPwm.scala
cp -f src/main/scala/workshop/stream/assets/StreamUnit.base src/main/scala/workshop/stream/StreamUnit.scala
cp -f src/main/scala/workshop/timer/assets/Timer.base src/main/scala/workshop/timer/Timer.scala
cp -f src/main/scala/workshop/uart/assets/UartCtrlRx.halfDone src/main/scala/workshop/uart/UartCtrlRx.scala
cp -f src/main/scala/workshop/udp/assets/UdpApp.baseHalfDone src/main/scala/workshop/udp/UdpApp.scala
cp -f src/main/scala/workshop/waveplayer/assets/WavePlayer.base src/main/scala/workshop/waveplayer/WavePlayer.scala
cp -f src/main/scala/workshop/simCounter/assets/SimCounterTestbench.base src/main/scala/workshop/simCounter/SimCounterTestbench.scala
cp -f src/main/scala/workshop/simStreamJoinFork/assets/SimStreamJoinForkTestbench.base src/main/scala/workshop/simStreamJoinFork/SimStreamJoinForkTestbench.scala
