// Half wave controlled rectifier with Arduino (SCR controller with Arduino)
#define scr_trig 7
#define pot A2
int ZC = 0;
float alpha;
void setup(){
  pinMode(scr_trig, OUTPUT);
  //pinMode(2, INPUT);
  digitalWrite(scr_trig, LOW);
  attachInterrupt(2, ZC_detect, FALLING);       // Enable external interrupt (INT0)
}
void ZC_detect(){ZC = 1;}
void loop(){
  if(ZC==1){
    alpha = analogRead(pot)*25/6138;
    delay(alpha-1);
    digitalWrite(scr_trig, HIGH);
    delayMicroseconds(1)
    digitalWrite(scr_trig, LOW);
    ZC = 0;
  }
}
