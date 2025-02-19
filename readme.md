SerialCommand
=============
A Wiring/Arduino library to tokenize and parse commands received over a serial port. 
As an option for AVR processors -DSerialCommand_inFlash, commands are forced into flash.
examples>useFlash/useFlash.pde  ~ storing in flash
examples>SerialCommandExample>SerialCommandExample.pde  ~ original version that stores in ram

This fork has been tested with PlatformIO and target mega1284 Mayfly.

Forked from https://github.com/kroimon/Arduino-SerialCommand

The original version of this library was written by [Steven Cogswell](http://husks.wordpress.com) (published May 23, 2011 in his blog post ["A Minimal Arduino Library for Processing Serial Commands"](http://husks.wordpress.com/2011/05/23/a-minimal-arduino-library-for-processing-serial-commands/)).

This is a heavily modified version with smaller footprint and a cleaned up code by Stefan Rado.
