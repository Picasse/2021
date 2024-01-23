**Consulta 1**

*Sebastián Cáceres - 1803245*

*Santiago Téllez - 1803214*

**1. ¿Cuáles son los tipos de diodos de potencia?**

​	a. *Rectificadores de baja frecuencia:* Soporta corrientes de entre 1A y 6000A, tienen un tiempo de recuperación inverso de 10 us, tensión inversa de pico repetitivo de entre 400V y 3600V. Son empleados como rectificadores para baja frecuencia (50Hz).

​	b. *Diodos rápidos (fast) y ultrarrápidos (ultrafast):* Soporta corrientes de entre 30A y 200A, tienen un tiempo de recuperación inverso de entre 0.10 us y 10us, tensión inversa de pico repetitivo de entre 400V y 1500V. Son empleados en conmutación de alta frecuencia (>20kHz). También son comunmente usados en accionamiento de motores de corriente alterna.

​	c. *Diodos Schotkky:* Soporta corrientes de entre 1A y 120A, tienen un tiempo de recuperación inverso de 5 ns, tensión inversa de pico repetitivo 15V y 150V. Son empleados comúnmente en fuentes conmutadas, cargadores de baterías, diodos de libre circulación, entre otros.

​	d. *Diodos para aplicaciones especiales (alta tensión):* Soporta corrientes de entre 0.45A y 2A, tienen un tiempo de recuperación inverso de 150 ns, tensión inversa de pico repetitivo de entre 20V y 100V y soportan una tensión inversa continua de entre 7.5kV y 18kV. Son empleados comúnmente para aplicaciones de alta tensión.

​	e. *Diodos para aplicaciones especiales (alta corriente):* Soporta corrientes de entre 50A y 7000A, tienen un tiempo de recuperación inverso de 10 us, tensión inversa de pico repetitivo de entre 400V y 2500V. Son empleados para aplicaciones de alta corriente.

**2. ¿Qué es la corriente de fuga de los diodos?**

Cuando el diodo es polarizado de forma inversa (aplicando un voltaje inverso superior a 0V), no se observa una variación en la corriente sobre el diodo, sin embargo se puede observar una pequeña corriente saliendo de este. A esta corriente se le denomina corriente de fuga, con un valor de en los del orden de los microamperios. 

![img](http://www.asifunciona.com/fisica/af_diodos/img_diodos/img-19-dio_300px.gif)

**3. ¿Qué es el tiempo de recuperación inversa de los diodos?**

Debido a que el diodo, para pasar de conducción al de bloqueo en el diodo no realiza el proceso de manera instantánea. Cuando un diodo se encuentra conduciendo una corriente, la unión se encuentra saturada de portadores en función de que tan alta sea esta corriente If. Si mediante la aplicación de una tensión inversa forzamos la anulación de la corriente, resultará que después del paso por cero de la corriente existe cierta cantidad de portadores que cambian su sentido de movimiento y permiten que el diodo conduzca en sentido contrario durante un instante. 

![tiempo de recuperación inversa del diodo](https://riverglennapts.com/images/diode/reverse-recovery-time-of-diode.PNG)

**4. ¿Qué es la corriente de recuperación inversa de los diodos?**

Cuando un diodo pasa de conducción a corte, la corriente en él disminuye y, momentáneamente se hace negativa antes de alcanzar el valor cero. Esta corriente se puede observar también n la imagen anterior, donde al no hacer la conmutación inmediata, se produce esta corriente de recuperación.

**5. ¿Cuál es la causa del tiempo de recuperación inversa de un diodo de unión pn?**

Se causa ya que los portadores que permiten el paso de la corriente a través de este, al pasar al estado de bloqueo, los portadores se separan. Esto genera que algunos de los portadores que ese encuentran en el diodo conduzcan de manera interna. Sin embargo esta corriente no dura demasiado tiempo, haciendo que esta corriente desaparezca y el diodo vuelva a bloquear la corriente en sentido inverso.

**6. ¿Cuál es el efecto del tiempo de recuperación inversa?**

El tiempo de recuperación inversa en un diodo afecta al tiempo que se demora su conmutación. De ser muy grande puede afectar sus diversas aplicaciones. Como vimos en los distintos tipos de diodos, algunos de ellos ven sus aplicaciones condicionadas directamente por su tiempo de conmutación. 

**7. ¿Qué es el tiempo de recuperación directo?**

 Tiempo de recuperación directo se trata del intervalo de tiempo que ocurre entre el instante en que la tensión en un diodo  es aplicada y realmente empieza a conducir.

**8. ¿Cuáles son las diferencias principales entre los diodos de unión pn y los diodos Schottky?**

El diodo PN común tiene la curva en color rojo y el diodo Schottky en color azul. Se observa del diagrama que el diodo Schottky tiene una caída de voltaje cuando está polarizado en directo menor que la que tiene el diodo PN. También se observa que sucede lo mismo cuando los diodos se polarizan en inverso.

![image-20210219080424782](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210219080424782.png)

**9. ¿Cuáles son las limitaciones de los diodos Schottky?**

La limitación más evidente del diodo de Schottky es la dificultad de conseguir resistencias inversas relativamente elevadas cuando se trabaja con altos voltajes inversos.

**10. ¿Cuál es el tiempo de recuperación inversa típico de los diodos de uso general?**

10u Segundos.

**11. ¿Cuál es el tiempo de recuperación inversa típico de los diodos de recuperación rápida?**

450n Segundos.

Referencias 

[1]. Ecured, Diodos de Potencia, URL: https://www.ecured.cu/Diodos_de_potencia. Recuperado el 18 febrero 2021

[2]. Así funciona, ASÍ FUNCIONAN LOS DIODOS, URL: http://www.asifunciona.com/fisica/af_diodos/af_diodos_6.htm. Recuperado el 18 febrero 2021

[3]. Universidad de valencia, DIODOS DE POTENCIA, URL:https://www.uv.es/~marinjl/electro/diodo.html#5. Recuperado el 18 febrero 2021

[3]. Universidad de oviedo, El Diodo, URL:https://www.unioviedo.es/ate/alberto/semiconduc_Telem.pdf

