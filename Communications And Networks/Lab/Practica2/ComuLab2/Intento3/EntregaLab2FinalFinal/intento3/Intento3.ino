#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>

int sensor_pin1 = A0;
int sensor_pin2 = A1;
int sensor_pin3 = A2;
double valor_sensor[2];

int a;

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; //Dirección MAC (constante)
IPAddress ip(192,168,0,56);//ir a win+r cmd donde dice adaptador ethernet ethernet copiar ipv4 y cambiarla aqui
unsigned int port = 8000;//puerto asignado
char paqueteBuffer[UDP_TX_PACKET_MAX_SIZE]; //dimensión del char
String dataReq; // cadena para eure String
int paquete_size;// paketgröße
EthernetUDP udp;//crea objeto UDP
char packetBuffer[UDP_TX_PACKET_MAX_SIZE];//


void setup() {
    Serial.begin(9600);
    Ethernet.begin(mac, ip);
    udp.begin(port); //inicializar el udp
    delay(1500);
}

void loop() {

    valor_sensor[0] = analogRead(sensor_pin1);
    valor_sensor[1] = analogRead(sensor_pin2);
    valor_sensor[2] = analogRead(sensor_pin3);

    if (udp.parsePacket() > 0)
    {
        udp.read(packetBuffer, UDP_TX_PACKET_MAX_SIZE);
        String datReq(packetBuffer);
        Serial.println(packetBuffer);
        if (datReq == "1")
        {
            udp.beginPacket(udp.remoteIP(), udp.remotePort());
            udp.print(valor_sensor[0]);
            udp.endPacket();delay(50);
            udp.beginPacket(udp.remoteIP(), udp.remotePort());
            udp.print(valor_sensor[1]);
            udp.endPacket();delay(50);
            udp.beginPacket(udp.remoteIP(), udp.remotePort());
            udp.print(valor_sensor[2]);
            udp.endPacket();delay(50);
        }
    // put your main code here, to run repeatedly:

}
}
