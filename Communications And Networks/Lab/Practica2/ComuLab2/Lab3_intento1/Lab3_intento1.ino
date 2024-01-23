#include <Ethernet.h> //Load Ethernet Library
#include <EthernetUdp.h> //Load the Udp Library
#include <SPI.h> //Load SPI Library
 
#include "Wire.h" //imports the wire library
//#include "Adafruit_BMP085.h" // import the Pressure/Temperature sensor library
//Adafruit_BMP085 mySensor; //Create a sensor object
 
//float tempC; //Declare variable for Temp in C
//float tempF; //Declare variable for Temp in F
float Pressure; //Declare a variable for Pressure
 
byte mac[] ={ 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xEE}; //Assign mac address
IPAddress ip(10, 1, 15, 243); //Assign the IP Adress
unsigned int localPort = 5000; // Assign a port to talk over
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //dimensian a char array to hold our data packet
String datReq; //String for our data
int packetSize; //Size of the packet
EthernetUDP Udp; // Create a UDP Object
 
void setup() {
  
  Serial.begin(9600); //Initialize Serial Port 
  Ethernet.begin( mac, ip); //Inialize the Ethernet
  Udp.begin(localPort); //Initialize Udp
  delay(1500); //delay
  //mySensor.begin(); //initialize pressure-temp sensor
  
 
}
 
void loop() {
  
  packetSize =Udp.parsePacket(); //Reads the packet size
  
  if(packetSize>0) { //if packetSize is >0, that means someone has sent a request
    
    Udp.read(packetBuffer, UDP_TX_PACKET_MAX_SIZE); //Read the data request
    String datReq(packetBuffer); //Convert char array packetBuffer into a string called datReq
    
    if (datReq =="Temperature") { //Do the following if Temperature is requested
      float sensorValue = analogRead(A0);
      float sensorValue1 = analogRead(A1);
      //tempC = mySensor.readTemperature(); //Read the temperature
      //tempF = tempC*1.8 + 32; //Convert temp to F
      
      Udp.beginPacket(Udp.remoteIP(), Udp.remotePort()); //Initialize packet send
      Udp.print(sensorValue); //Send the temperature data
      Udp.endPacket(); //End the packet
      
    }
    
    if (datReq== "Pressure") { //Do the following if Pressure is requested
    
      //Pressure=mySensor.readPressure(); //read the pressure
      
        Udp.beginPacket(Udp.remoteIP(), Udp.remotePort()); //Initialize packet send
        //Udp.print(sensorValue1); //Send the Pressure data
        Udp.endPacket(); //End the packet
        
    }
      
  }
  memset(packetBuffer, 0, UDP_TX_PACKET_MAX_SIZE); //clear out the packetBuffer array
}
