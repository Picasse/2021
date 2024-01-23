// Librerias I2C para controlar el mpu6050
// la libreria MPU6050.h necesita I2Cdev.h, I2Cdev.h necesita Wire.h
#include "I2Cdev.h"
#include "MPU6050.h"
#include "Wire.h"

// La dirección del MPU6050 puede ser 0x68 o 0x69, dependiendo 
// del estado de AD0. Si no se especifica, 0x68 estará implicito
MPU6050 sensor;

// Valores RAW (sin procesar) del acelerometro y giroscopio en los ejes x,y,z
int ax, ay, az;
int gx, gy, gz;
String valores;
long tiempo_prev;
float dt;
float ang_x, ang_y;
float ang_x_prev, ang_y_prev;
float Ax_X = 0,Ay_X = 0, Ax_1_X = 0, Ax_2_X = 0, Ay_1_X = 0, Ay_2_X =0;
float Ax_Y = 0,Ay_Y = 0, Ax_1_Y = 0, Ax_2_Y = 0, Ay_1_Y = 0, Ay_2_Y =0;
float Ax_Z = 0,Ay_Z = 0, Ax_1_Z = 0, Ax_2_Z = 0, Ay_1_Z = 0, Ay_2_Z =0;
int A_X_fil = 0, A_Y_fil = 0, A_Z_fil = 0;
float acelSinFil[2];

void setup() {
  Serial.begin(9600);    //Iniciando puerto serial
  Wire.begin();           //Iniciando I2C  
  sensor.initialize();    //Iniciando el sensor
}

void loop() {
  // Leer las aceleraciones y velocidades angulares
  sensor.getAcceleration(&ax, &ay, &az);
  sensor.getRotation(&gx, &gy, &gz);
  
  dt = (millis()-tiempo_prev)/1000.0;
  tiempo_prev=millis();

  //Filtro IIR
  //ACx
  Ax_X = ax;
  Ay_X = 0.02051522*Ax_X + 0.04103045*Ax_1_X + 0.02051522*Ax_2_X + 1.61852*Ay_1_X - 0.7105935*Ay_2_X;
  Ax_2_X = Ax_1_X;
  Ax_1_X = Ax_X;
  Ay_2_X = Ay_1_X;
  Ay_1_X = Ay_X;
  A_X_fil = Ay_X;

  //ACy
  Ax_Y = ay;
  Ay_Y = 0.02051522*Ax_Y + 0.04103045*Ax_1_Y + 0.02051522*Ax_2_Y + 1.61852*Ay_1_Y - 0.7105935*Ay_2_Y;
  Ax_2_Y = Ax_1_Y;
  Ax_1_Y = Ax_Y;
  Ay_2_Y = Ay_1_Y;
  Ay_1_Y = Ay_Y;
  A_Y_fil = Ay_Y;
  
  //ACz
  Ax_Z = az;
  Ay_Z = 0.02051522*Ax_Z + 0.04103045*Ax_1_Z + 0.02051522*Ax_2_Z + 1.61852*Ay_1_Z - 0.7105935*Ay_2_Z;
  Ax_2_Z = Ax_1_Z;
  Ax_1_Z = Ax_Z;
  Ay_2_Z = Ay_1_Z;
  Ay_1_Z = Ay_Z;
  A_Z_fil = Ay_Z;
  
  //Calcular los ángulos con acelerometro
  float accel_ang_x=atan(A_Y_fil/sqrt(pow(A_X_fil,2) + pow(A_Z_fil,2)))*(180.0/3.14);
  float accel_ang_y=atan(-A_X_fil/sqrt(pow(ay,2) + pow(A_Z_fil,2)))*(180.0/3.14);
  
  //Calcular angulo de rotación con giroscopio y filtro complemento  
  ang_x = 0.98*(ang_x_prev+(gx/131)*dt) + 0.02*accel_ang_x;
  ang_y = 0.98*(ang_y_prev+(gy/131)*dt) + 0.02*accel_ang_y;
  
  
  ang_x_prev=ang_x;
  ang_y_prev=ang_y;

  //Mostrar los angulos separadas por un [tab]
  //Serial.println(ax);
  /*Serial.print(" ");
  Serial.print(A_Y_fil);
  Serial.print(" ");
  Serial.print(A_Z_fil);
  Serial.println(" ");*/
  //spliteamos  
  
  //imprimir señales de aceleracion sin filtrar
  //Serial.println(ax);
  //delay(10);
  
  //imprimir señales de aceleracion IIR
  //Serial.println(A_X_fil);
  //delay(10);

  //imprimir señal angulo con filtro complementario
  //valores = String(ang_x) + "*" + String(ang_y)+"*" + String(0);
  //Serial.println(ang_x);
  //delay(10);
  
  //Unity
  valores = String(A_X_fil) + "*" + String(A_Y_fil)+"*" + String(A_Z_fil);
  Serial.println(valores);
  delay(10);
}
