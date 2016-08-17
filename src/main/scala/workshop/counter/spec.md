## Description
Component which increment its output `value` each cycle.

## Component interfaces

| name | direction | type | description |
| ------ | ----------- | ------ |  ------ |
| clear | in | Bool | When set, the internal register is cleared |
| value | out | UInt(width bits) | By default, count up each cycle. Initialized to zero. Can overflow.|
| overflow | out | Bool | Set when all bits of the output `value` are set. |

## RTL parametrization

| name | type | description | 
| ------ | ----------- | ------ |
| width | Int | Specify the width of the `value` output |
