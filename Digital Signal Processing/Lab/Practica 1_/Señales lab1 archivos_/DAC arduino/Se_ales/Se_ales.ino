/*
 Graficador de onda senoidal
 
  El periodo de la onda se puede configurar y se lee de un potenciometro.
 En este caso grafico con este gist https://gist.github.com/electronut/d5e5f68c610821e311b0
 pero cada uno es libre de usar el graficador que desee. Ademas es 
 posible sacar la onda por una salida PWM o incluso conectar un DAC. 
 
 Creado por Lopez Ricardo Ezequiel

 http://lopezezequiel.com
 
 */
 
#define MIN_T 1000                         // minima duracion del periodo de la onda en milisegundos (1 segundo)
#define MAX_T 10000                        // maxima duracion del periodo de la onda en milisegundos (10 segundos)
#define POT A0                             // pin analogico del potenciometro

unsigned long T;                           // periodo de la onda
unsigned long _delay;                      // duracion de un paso
double angulo;                             // angulo en radianes de 0 a 2pi
double deltaAngulo;                        // incremento del angulo en un paso
double pasos;                              // cantidad de particiones de un ciclo de onda

void setup() {
  Serial.begin(115200);                    // iniciamos puerto serie a 115200 baudios
                                           // si utilizan el mismo graficador que yo modificar los baudios en el script python(viene 9600 por defecto)
  while (!Serial) {                        // esperamos que el puerto este listo. Solo es necesario para arduino leonardo
    ; 
  }
}

void loop() {
  angulo = 0;                                             // ponemos el angulo a cero 
  T = map(analogRead(POT), 0, 1023, MIN_T, MAX_T);        // leemos T del potenciometro cambiando al rango definido
  pasos = T/80.0;                                         // ajustamos la cantidad de pasos a T para obtener una mejor grafica
                                                          // en este caso uso un factor de 80.0 pero va a depender del rango de T
  _delay = T / pasos;                                     // calculamos el delay de acuerdo al T medido y a los pasos
  deltaAngulo = 2.0 * PI / pasos;                         // calculamos el angulo incremental  

  while(angulo < 2 * PI) {                                // mientras no haya completado un ciclo
    
    //las siguientes dos lineas deben ser modificadas de acuerdo al graficador que utilicen o si quieren sacar por PWM o un DAC
    Serial.print(int(sin(angulo)*128+127));               // calculamos el seno y lo mapeamos a un valor de 0 a 255
    Serial.print(" 128\n");                               // imprimo una constante de referencia en 128(osea el cruce por cero)
  
    angulo += deltaAngulo;                                // incrementamos el angulo en un delta correspondiente a un paso
    delay(_delay);                                        // esperamos el tiempo que dura un paso
  }
}
