// Demo Code for SerialCommand Library
// Neil Hancock adapted for AVR FlashMemory Aug 2021
// Steven Cogswell
// May 2011

#include <SerialCommand.h>

#if defined ARDUINO_AVR_ENVIRODIY_MAYFLY 
//These are Mayfly LEDs
const int8_t greenLED  = 8;  // MCU pin for the green LED (-1 if not applicable)
const int8_t redLED    = 9;  // MCU pin for the red LED (-1 if not applicable)
#define arduinoLED greenLED  
#else
#define arduinoLED 13   // Standard Arduino LED on board
#endif 

SerialCommand sCmd;     // The demo SerialCommand object

//Prototypes for the commands
void LED_on();
void LED_off();
void sayHello();
void processCommand();

//Command Table
#define SC_COMMAND_NUMBER 4
const static PROGMEM SerialCommand::SerialCommandCallback sc_commandList[SC_COMMAND_NUMBER ] =
{
    //List in search order, 1st match is used
    {"OFF",LED_off},
    {"ON",LED_on},
    {"HELLO",sayHello},
    {"P", processCommand},
};

void setup() {
  pinMode(arduinoLED, OUTPUT);      // Configure the onboard LED for output
  digitalWrite(arduinoLED, LOW);    // default to LED off

  Serial.begin(115200);

  // Setup callbacks for SerialCommand commands
  #if defined SerialCommand_inFlash
  sCmd.setCommandList(sc_commandList,SC_COMMAND_NUMBER);
  #else
  
  sCmd.addCommand("ON",    LED_on);          // Turns LED on
  sCmd.addCommand("OFF",   LED_off);         // Turns LED off
  sCmd.addCommand("HELLO", sayHello);        // Echos the string argument back
  sCmd.addCommand("P",     processCommand);  // Converts two arguments to integers and echos them back

  #endif 
  sCmd.setDefaultHandler(unrecognized);      // Handler for command that isn't matched  (says "What?")
  Serial.println("Ready");
}

void loop() {
  sCmd.readSerial();     // We don't do much, just process serial commands
}


void LED_on() {
  Serial.println("LED on");
  digitalWrite(arduinoLED, HIGH);
}

void LED_off() {
  Serial.println("LED off");
  digitalWrite(arduinoLED, LOW);
}

void sayHello() {
  char *arg;
  arg = sCmd.next();    // Get the next argument from the SerialCommand object buffer
  if (arg != NULL) {    // As long as it existed, take it
    Serial.print("Hello ");
    Serial.println(arg);
  }
  else {
    Serial.println("Hello, whoever you are");
  }
}


void processCommand() {
  int aNumber;
  char *arg;

  Serial.println("We're in processCommand");
  arg = sCmd.next();
  if (arg != NULL) {
    aNumber = atoi(arg);    // Converts a char string to an integer
    Serial.print("First argument was: ");
    Serial.println(aNumber);
  }
  else {
    Serial.println("No arguments");
  }

  arg = sCmd.next();
  if (arg != NULL) {
    aNumber = atol(arg);
    Serial.print("Second argument was: ");
    Serial.println(aNumber);
  }
  else {
    Serial.println("No second argument");
  }
}

// This gets set as the default handler, and gets called when no other command matches.
void unrecognized(const char *command) {
  Serial.println("What?");
}

