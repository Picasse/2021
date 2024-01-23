//entradas
#define cruce_x_01     2 //D2
//salidas 
#define disparo1       6  //D6
//Variables
int  bandera1=0;
float tiempo1=0, tiempo=0, voltaje=0;
float t0=0, tactual=0;
int state = 0;
int arranque=0;
int apago=0;
float tiempofinal=0;

//variables apagado 

float tiempo2=0, tiempobajada=0;
float tb=0, tactual2=0;
float voltajeBajada=0;


//Funcion1
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
   Serial.begin(9600);
  
}
void loop()
{
  if(Serial.available() > 0){
             state = Serial.read();
             if (state == "ARRANQUE") {
              
               tiempo= Serial.parseInt()*0.083*1000;
            }
             if (state == 'B') {
              voltaje= 100-Serial.parseInt();
              Serial.print(voltaje);
             }
             if (state == 'C') {
              if(arranque==0){
                
                arranque=1;
                t0=millis();
              }
             }
             if (state == 'D') {
                if (tiempo==830){

                  tiempo =1660;
                }
                voltajeBajada=voltaje+102;
                arranque=3;
                tb=millis();
              
             }
             if (state == "DETENIDA") {
              
               tiempo= Serial.parseInt()*0.093*1000;
            }
             
        }   
  if(bandera1==1)  //SE USA UNA BANDERA PARA SABER EN QUE MOMENTO SE HIZO UN CRUCE POR CERO
  {     //SERVIRA COMO SINCRONISMO PARA DISPARO
      if(arranque==1){
        tactual=millis();
        tactual=tactual-t0;
        if(tactual<(tiempo)){
          tiempo1=(voltaje*10000/120)-((voltaje*10000/120)*(tactual/tiempo));
          delayMicroseconds((int)tiempo1);
          digitalWrite(disparo1,HIGH);   //SE DISPARA POR ESTOS PINES A LOS SCR
        }
        else{
          arranque=2;
        }
      }
      if(arranque==2){
        delayMicroseconds(1);
        digitalWrite(disparo1,HIGH);   //SE DISPARA POR ESTOS PINES A LOS SCR
      }
      if(arranque == 3){ //apagado
       
        tactual=millis();
        tactual=tactual-tb;
        if(tactual<(tiempo)){
          tiempo1=( voltajeBajada*10000/120)+(( voltajeBajada*10000/120)*(tactual/tiempo));
          delayMicroseconds((int)tiempo1);
          digitalWrite(disparo1,HIGH);   //SE DISPARA POR ESTOS PINES A LOS SCR
           }
        
          
      }
      
      
    bandera1=0;    //SE PONE  A 0 LA BANDERA HASTA QUE OCURRA OTRO CRUCE POR CERO
  }
}                     //ESTO PARA CONTROLAR LA VELOCIDAD DEL MOTOR DC
