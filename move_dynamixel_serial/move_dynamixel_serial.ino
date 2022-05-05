#include <DynamixelSerial1.h> 
#define FREQ 1000000   

const byte numChars = 32; 
char receivedChars[numChars]; 
char tempChars[numChars];     

int theta1 = 0; 
int theta2 = 0; 
int theta3 = 0; 

boolean newData = false; 

void setup(){ 
   Serial.begin(9600);
   Dynamixel.begin(FREQ, 2);
} 

void loop(){ 
  recvWithStartEndMarkers(); 
    if (newData == true) { 
        strcpy(tempChars, receivedChars); 
            // this temporary copy is necessary to protect the original data 
            //   because strtok() used in parseData() replaces the commas with \0 
        parseData(); 
        showParsedData(); 
        moveServo(theta1, theta2, theta3); 
        newData = false; 
    } 
} 

//============ 

void recvWithStartEndMarkers() { 
    static boolean recvInProgress = false; 
    static byte ndx = 0; 
    char startMarker = '<'; 
    char endMarker = '>'; 
    char rc; 

    while (Serial.available() > 0 && newData == false) { 
        rc = Serial.read(); 

        if (recvInProgress == true) { 
            if (rc != endMarker) { 
                receivedChars[ndx] = rc; 
                ndx++; 
                if (ndx >= numChars) { 
                    ndx = numChars - 1; 
                } 
            } 
            else { 
                receivedChars[ndx] = '\0'; // terminate the string 
                recvInProgress = false; 
                ndx = 0; 
                newData = true; 
            } 
        } 

        else if (rc == startMarker) { 
            recvInProgress = true; 
        } 
    } 
} 

//============ 

void parseData() {      // split the data into its parts 
    char * strtokIndx; // this is used by strtok() as an index 
    strtokIndx = strtok(tempChars,",");      // get the first part - theta1 as integer 
    theta1 = atoi(strtokIndx);  // copy it to the theta1 variable 
    strtokIndx = strtok(NULL, ","); // this continues where the previous call left off 
    theta2 = atoi(strtokIndx);     // convert this part to theta2 integer 
    strtokIndx = strtok(NULL, ","); 
    theta3 = atoi(strtokIndx);     // convert this part to theta3 
} 

//============ 

void showParsedData() { 
    Serial.print("theta1: "); 
    Serial.println(theta1); 
    Serial.print("theta2: "); 
    Serial.println(theta2); 
    Serial.print("theta3: "); 
    Serial.println(theta3); 
} 

void moveServo(int theta1, int theta2, int theta3) { 
  Dynamixel.move(1, theta1);  // Move the Servo(ID), to 0° = 0 
  Dynamixel.move(2, theta2);  // Move the Servo(ID), to 0° = 0 
  Dynamixel.move(3, theta3);  // Move the Servo(ID), to 0° = 0 
} 
