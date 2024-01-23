//entradas
#define cruce_x_01     2 //D2
//salidas 
#define disparo1       7  //D6
#define pot A1
//Variables
int  bandera1=0;
float alpha=0;

void interrupcion1()  //LOS CRUCES POR CERO SON TOMADOS POR MEDIO DE UNA INTERRUPCION
{
  bandera1=1;
  digitalWrite(disparo1,LOW);
}
//Funcion setup
void setup()
{
   pinMode(disparo1,OUTPUT);
   attachInterrupt(digitalPinToInterrupt(cruce_x_01), interrupcion1, FALLING); //SE HABILITA LA INTERRUPCION POR EL PIN D2
   //Serial.begin(9600);
}
void loop()
{
  if(bandera1==1){
    alpha=analogRead(pot)*25000/3;//200000/23
    delayMicroseconds(alpha);
    digitalWrite(disparo1, HIGH);
    delayMicroseconds(1);
    digitalWrite(disparo1, LOW);
    bandera1 = 0;
    }
}                     //ESTO PARA CONTROLAR LA VELOCIDAD DEL MOTOR DC
