## Description
Component which increment its output `value` each cycle.

This lab will introduce :
- Component with it IO definition and a little parameterization
- Combinatorial and Sequential logic (gates and register)
- Conditional statements (when)

## Component interfaces

| name | direction | type | description |
| ------ | ----------- | ------ |  ------ |
| clear | in | Bool | When set, the internal register is cleared |
| value | out | UInt(width bits) | By default, count up each cycle. Initialized to zero. Can overflow.|
| full | out | Bool | Is set when all bits of the output `value` are set. |

## RTL parametrization

| name | type | description | 
| ------ | ----------- | ------ |
| width | Int | Specify the width of the `value` output |

## Tips

There is a SpinalHDL documentation and many examples [there](spinalhdl.github.io/SpinalDoc/)