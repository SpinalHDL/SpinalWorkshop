## Introduction
The goal of this lab is to practice function to abstract stated things, generate hardware and also to give a better feeling of the object oriented nature of SpinalHDL.

The component to implement is a byte flow un-serializer able to load 3 outputs from 3 different commands.

This lab will introduce :
- Function combined with Area (def, Area)
- Some re-usability pattern
- How the scala can be mixed with SpinalHDL

## Interface

The component will have following IO :

| IO Name  | Direction | Type  | Description |
| ------- | ---- | ---- | ---- |
| cmd | in | Flow(Bits(8 Bits)) | Flow which provide commands |
| valueA | out | Bits(8 Bits) | Output port which can be loaded when the 'setValueA' command happen |
| valueB | out | Bits(32 Bits) | Output port which can be loaded when the 'setValueB' command happen |
| valueC | out | Bits(48 Bits) | Output port which can be loaded when the 'setValueC' command happen |


## Commands
Commands comming on the `cmd` port are string based :

| Command pattern | Description |
| ------- | ---- |
| 'setValueAx' | Load the valueA with x |
| 'setValueBxxxx' | Load the valueA with xxxx (big-endian) |
| 'setValueCxxxxxx' | Load the valueA with xxxxxx (big-endian) |

## Implementation
The implementation could be done by many way, but the goal of this lab is to practice functions. The proposal is the following :

1) Define a function which is able to recognise a string pattern on the `cmd` port and which set the `hit` signal to True when that happen.

```scala
def patternDetector(str : String) = new Area{
  val hit = False 
  //..
}
```

2) Define a function which drive a given `Data` from a register buffer and load that register buffer chunk by chunk from the `cmd` port after an `start` pulse :

```scala
def valueLoader(start : Bool,that : Data) = new Area{
    //...
}
```

Then those both function could be used to build the wanted functionality :

```scala
  val setA    = patternDetector("setValueA")
  val loadA   = valueLoader(setA.hit,io.valueA)

  val setB    = patternDetector("setValueB")
  val loadB   = valueLoader(setB.hit,io.valueB)

  val setC    = patternDetector("setValueC")
  val loadC   = valueLoader(setC.hit,io.valueC)

```

## Functions and Area, why
One bad side with function is the fact that all signals defined inside them are unnamed in the generated RTL, which doesn't help the debugging.<br>
 The reason of that is the fact that to name signals, SpinalHDL use the java reflection. This work well for classes attributes, but not for function variables.

But there is some solutions : 

1) The function could return an Area which then will be kept in the Component (this is the solution retained in the 'Implementation' chapter) :

```scala
def counter() = new Area{
  val value = Reg(UInt(8 bits)) init(0)
  val isZero = value === 0
  value := value + 1
}

val myCounter = counter()  //All signal inside the function will be named "myCounter_xxx"
when(myCounter.isZero){
  //...
}
```

2) The function could implement an Area that you directly name in the function before returning what you want :

```scala
def counterIsZero() = new Area{
  val value = Reg(UInt(8 bits)) init(0)
  val isZero = value === 0
  value := value + 1
}.setName("something").isZero

when(counterIsZero()){    //All signal inside the function will be named "something_xxx"
  //...
}
```

3) Same as 2) but you use an signal name as prefix :

```scala
def counterIsZero(inc : Bool) = new Area{
  val value = Reg(UInt(8 bits)) init(0)
  val isZero = value === 0
  when(inc){value := value + 1}
}.setPartialName(inc,"counter").isZero

val cond = True
when(counterIsZero(cond)){  //All signal inside the function will be named "cond_counter_xxx"
  //...
}
```
