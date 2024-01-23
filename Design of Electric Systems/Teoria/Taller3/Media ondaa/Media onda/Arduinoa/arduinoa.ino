#include <Keypad.h>

const int inputPin = 2;
const int analogPin = A0;
float value=0;      
int pos;  
int cada=0;int digito;
float primerN, segundoN;
float  resultado;
float resl;
float uno=0,dos=0,tres=0,cua=0,cin=0, five, six, siete, ocho, manejoteclado;
bool banderaCambio=false;
bool banderaMas=false, banderaMenos=false, banderaPor=false, banderaDiv=false, banderaOperacion=false, banderaControl=false;
const byte FILAS=4;
bool banderadiv0=false, banderaparadiv=false;
const byte COLUMNAS= 4;
char keys[FILAS][COLUMNAS]={
  {'1','2','3','+'},
  {'4','5','6','-'},
  {'7','8','9','*'},
  {'B','0','C','/'}
  };
  byte pinesFilas[FILAS]={9,8,7,6};
byte pinesColumnas[COLUMNAS]={5,4,13,12};
Keypad teclado = Keypad(makeKeymap(keys), pinesFilas, pinesColumnas, FILAS, COLUMNAS);
char Tecla; 
void setup() {
  Serial.begin(9600);
pinMode(3,OUTPUT);
pinMode(analogPin,INPUT);
pinMode(inputPin, INPUT_PULLUP);
attachInterrupt(digitalPinToInterrupt(inputPin), freqCounterCallback, FALLING);
}
void freqCounterCallback()
{

  delayMicroseconds(value);
  digitalWrite(3, HIGH);    
  delayMicroseconds(40); 
  digitalWrite(3, LOW); 
  
}
void loop() {
  Tecla = teclado.getKey();

if(Tecla=='0'){
  manejoteclado=0;
  banderaCambio=true;
  }
if(Tecla=='1'){
  manejoteclado=1;
  banderaCambio=true;
  }
  if(Tecla=='2'){
  manejoteclado=2;
  banderaCambio=true;
  }
  if(Tecla=='3'){
  manejoteclado=3;
  banderaCambio=true;
  }
  if(Tecla=='4'){
  manejoteclado=4;
  banderaCambio=true;
  }
  if(Tecla=='5'){
  manejoteclado=5;
  banderaCambio=true;
  }
  if(Tecla=='6'){
  manejoteclado=6;
  banderaCambio=true;
  }
  if(Tecla=='7'){
  manejoteclado=7;
  banderaCambio=true;
  }
  if(Tecla=='8'){
  manejoteclado=8;
  banderaCambio=true;
  }
  if(Tecla=='9'){
  manejoteclado=9;
  banderaCambio=true;
  }
  if(Tecla=='B'){
     manejoteclado=10;
    banderaCambio=true;
   } 
  if(Tecla=='C'){
    
    banderaControl=true;
   } 
if(banderaCambio==true){ 
  cin=cua;
   cua=tres;
   tres=dos;
   dos=uno;
   uno=manejoteclado;
   banderaCambio=false;
   delay(50);
    }
 if(banderaControl==true){

  if(dos==10){
    primerN=(cin*100)+(cua*10)+tres+(uno/10);
    }
    if(dos!=10){
      primerN=uno+(dos*10)+(tres*100)+(cua*1000)+(cin*10000);
      }
      Serial.println(primerN);
      value=primerN*44.4444444;
      uno=0;
      dos=0;
      tres=0;
      cua=0;
      cin=0;
      Serial.println(value);
     banderaControl=false;
      }
}
