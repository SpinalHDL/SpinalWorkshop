## Description
Component that generate a PWM which is controllable by using an APB bus.

## Interfaces

| name | direction | type | 
| ------ | ----------- | ------ |
| apb | slave | APB |
| pwm | out | Bool |

## Register mapping

| name | type | address |  description | 
| ------ | ------ | ----------- | ------ |
| enable | R/W | 0 | Enable the internal timer when the register is set |
| dutyCycle | R/W | 4 | Specify own many cycle the `pwm` output is set in a timer period |

## RTL parametrization

| name | type | description | 
| ------ | ----------- | ------ |
| apbConfig | ApbConfig | Specify the shape of the APB bus |
| timerWidth | Int | Specify how many bits the internal timer has |

