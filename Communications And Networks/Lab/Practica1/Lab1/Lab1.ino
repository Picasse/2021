const int analogInpin1=A0;
const int analogInpin2=A1;
const int analogInpin3=A2;
char entrada,datoEntrada;
int sensorValue[3];
int voltageValue[3];
void send_float (float arg)
{
  byte * data = (byte *) &arg; 
  Serial.write(data, 11);
}
void setup() {
  Serial.begin(9600);
  pinMode(A0,INPUT);
  pinMode(A1,INPUT);
  pinMode(A2,INPUT);
}

void loop() {
    static float Valor_pot1;
    static float Valor_pot2;
    static float Valor_pot3;
    if(Serial.available() > 0)
  { 
    datoEntrada = Serial.read();
    Valor_pot1=(float)analogRead(analogInpin1);
    Valor_pot2=(float)analogRead(analogInpin2);
    Valor_pot3=(float)analogRead(analogInpin3);
    if(datoEntrada == '1')
    {
      Serial.print(Valor_pot1,2);
    }else if(entrada == '2')
    {
      Serial.print(Valor_pot2,2);
    }else if(entrada == '3')
    {
      Serial.print(Valor_pot3,2);
    }else if(entrada =='4')
    {
      Serial.print(Valor_pot1,2);
      Serial.print(Valor_pot2,2);
      Serial.print(Valor_pot3,2);
    }//if
   }//serial
  }//loop
 
