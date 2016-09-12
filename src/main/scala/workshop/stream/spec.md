## Introduction
The goal of this lab is to have some practice with Stream (An simple handshake bus) and also memories. The component that will be implemented has no real-world purpose.

## Specification
The functionality to implement is the following :

- The component has an internal memory of 256*32 bits
- This memory can be written by the `memWrite` port
- To each couple of `cmdA`/`cmdB` transactions, one transaction should be emitted on `rsp`
- Transaction on `cmdA` and `cmdB` could come at any time. You have to stall them when necessary
- The payload of each `rsp` transaction should be equals to memory(cmdA.payload) xor cmdB.payload
- The width of `cmdB`/`rsp` payload is 32 bits
- The memory should be read by an synchronous way

There is the diagram of the component to implement :
![](assets/StreamUnit.svg)

There is the specification of IO :

| IO name | direction | type | description |
| ------ | ----------- | ------ | ------ |
| memWrite | slave | Flow(MemoryWrite) | Interface which allow to write the internal memory |
| cmdA | slave | Stream(UInt(8 bits)) | Stream of address used to read the internal memory |
| cmdB | slave | Stream(Bits(32 bits)) | Stream of data used for internal computation with the read value from the memory |
| rsp | master | Stream(Bits(32 bits)) | Stream which return one result for each cmdA/cmdB couple |

The MemoryWrite bundle is composed of one `address : UInt(8 bits)` and one `data : Bits(32 bits)` fields


Note : Hardware design with Stream is similar to software Petri net by many aspects.
