#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>

int sensor_pin = A0;
double valor_sensor = 0;

int a;

byte mac[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED}; //Dirección MAC (constante)
IPAddress ip (169,254,41,180);//ir a win+r cmd donde dice adaptador ethernet ethernet copiar ipv4 y cambiarla aqui y en python pappu
unsigned int port = 8000;//puerto asignado
char paqueteBuffer [UDP_TX_PACKET_MAX_SIZE]; //dimensión del char
String dataReq; // cadena para eure String
int paquete_size;// paketgröße
EthernetUDP udp;//crea objeto UDP
char packetBuffer[UDP_TX_PACKET_MAX_SIZE];//


void setup() {
  Serial.begin(9600);
  Ethernet.begin(mac, ip);
  udp.begin(port); //inicializar el udp
  delay (1500);
}

void loop() {

  valor_sensor = analogRead(sensor_pin);
  
  if(udp.parsePacket()>0)
  {
    udp.read(packetBuffer, UDP_TX_PACKET_MAX_SIZE);
    String datReq(packetBuffer);
    Serial.println(packetBuffer);
    udp.beginPacket(udp.remoteIP(), udp.remotePort());
    if(datReq == "1")
    {
      udp.print(valor_sensor); 
      udp.print(1);
    }
    udp.endPacket();
  }
  // put your main code here, to run repeatedly:

}
