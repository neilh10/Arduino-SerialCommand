SerialCommand
=============
Standard Example with commands stored in flash, saving RAM and FLASH and more reliable.
Add the -DSerialCommand_inFlash which for IDE PlatformIO is done in platformio.ini

Commands supported
ON
OFF
HELLO
P xx yy   eg P 24 42 - two numbers seperated by space

Tested with Mayfly AVR mega1284 on PlatformIO
 - framework-arduino-avr 5.1.0
 - toolchain-atmelavr 1.70300.191015 (7.3.0)
 
Compiler says
RAM:   [          ]   2.4% (used 389 bytes from 16384 bytes)
Flash: [          ]   2.6% (used 3400 bytes from 130048 bytes)

With no "-DSerialCommand_inFlash" commands are stored in RAM and extra RAM and FLASH
RAM:   [          ]   2.5% (used 413 bytes from 16384 bytes)
Flash: [          ]   3.5% (used 4556 bytes from 130048 bytes)