**Brian Sebastian Caceres Pinzon 1803245 est.brian.caceres@unimilitar.edu.co **

Tarea 2.

**1)Determinar las constantes de error para una entrada escalón, rampa y parábola de los siguientes
sistemas de control con retroalimentación unitaria. Luego calcular el error de estado estable y
validar en simulación los resultados obtenidos. La función de transferencia en lazo abierto
(trayectoria directa) son:**

Primer G(s):
$$
G(s)_1=\frac{k}{s(1+0.1s)(1+0.5s)}\\
$$
Constantes de error para el primer G(s):
$$
k_p=\displaystyle\lim_{s \to 0}(\frac{k}{s(1+0.1s)(1+0.5s)})=\frac{k}{0}=\infty\\
k_v=\displaystyle\lim_{s \to 0}(\frac{ks}{s(1+0.1s)(1+0.5s)})=\frac{k}{1}=k\\
k_d=\displaystyle\lim_{s \to 0}(\frac{ks^2}{s(1+0.1s)(1+0.5s)})=\frac{k*0}{0}=0\\
$$
Error estado estable para el primer G(s):
$$
Escalón=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s}}{1+\frac{k}{s(1+0.1s)(1+0.5s)}})=0\\
Rampa=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s^2}}{1+\frac{k}{s(1+0.1s)(1+0.5s)}})=\frac{1}{k}\\
Parábola=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s^3}}{1+\frac{k}{s(1+0.1s)(1+0.5s)}})=\infty\\
$$
Grafica de error primer G(s), entrada escalón K=5:

![image-20210218220357637](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218220357637.png)

Grafica de error primer G(s), entrada rampa K=5, error 1/k=1/5=0.2:

![image-20210218220411417](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218220411417.png)

Grafica de error primer G(s), entrada parábola, error infinito:

![image-20210218220423485](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218220423485.png)

Segundo G(s):
$$
G(s)_2=\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)}\\
$$


Constantes de error para el segundo G(s).	
$$
k_p=\displaystyle\lim_{s \to 0}(\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)})=\infty\\
k_v=\displaystyle\lim_{s \to 0}(\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)})=\infty\\
k_d=\displaystyle\lim_{s \to 0}(\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)})=k\\
$$
Error estado estable para el primer G(s).
$$
Escalón=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s}}{1+\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)}})=0\\
Rampa=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s^2}}{1+\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)}})=0\\
Parábola=\displaystyle\lim_{s \to 0}(\frac{s*\frac{1}{s^3}}{1+\frac{k(1+2s)(1+4s)}{s^2(s^2+s+1)}})=\frac{1}{k}\\
$$
Grafica de error segundo G(s), entrada escalón, K=5, error=0.

![image-20210218221719481](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218221719481.png)

Grafica de error segundo G(s), entrada rampa, K=5, error=0.

![image-20210218221732054](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218221732054.png)

Grafica de error segundo G(s), entrada parábola, K=5, error=1/k=1/5=0.2.

![image-20210218221751863](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218221751863.png)

**2)La figura (a) muestra un sistema mecánico. Cuando se aplica una fuerza de 1 N (entrada escalón)
al sistema, la dinámica de la respuesta de la planta es como se muestra en la figura (b)
Considerando lo anterior, determinar La función de transferencia que relaciona la posición lineal
(X(s)) vs. la fuerza (Fa(s)).**

![image-20210218221831125](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218221831125.png)
$$
M_p=e^{-\frac{\zeta}{\sqrt{1-\zeta^2}}\pi}\\
0.46=e^{-\frac{\zeta}{\sqrt{1-\zeta^2}}\pi}\rightarrow \zeta=0.24\\
T_s = \frac{4}{\omega_n \zeta}\\
3.28 = \frac{4}{\omega_n 0.24}\rightarrow \omega_n=\frac{625}{123}\\
Ganancia = 0.9
$$
De lo anterior se determina una función de transferencia:
$$
G(s)=\frac{23.24}{s^2+2.439s+25.82}
$$
**3)Para el siguiente sistema de control determinar la función de transferencia en trayectoria
directa y en lazo cerrado. Hallar los valores K y a del controlador tal que el sistema se
estabilice en 0.5 segundos y tenga un sobre impulso máximo de 7% del valor final.
Simular para comprobar sus resultados. Hallar el error de estado estable para una entrada
escalón.**

![image-20210218221904874](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218221904874.png)

Función de transferencia lazo abierto (Trayectoria directa)
$$
controlador=\frac{k(s+a)}{s}\\
planta=\frac{s+3}{s^2-1}\\
ft=controlador*planta=\frac{k(s+a)}{s}*\frac{s+3}{s^2-1}\\
ft=\frac{k(s^2+as+3s+3a)}{s^3-s}
$$
Función de transferencia realizando lazo cerrado
$$
Ft=\frac{k(s^2+as+3s+3a)}{k(s^2+as+3s+3a)+s^3-s}\\
Ft=\frac{k(s^2+as+3s+3a)}{s^3+s^2k+s(ka+3k-1)+s^0(3ka)}
$$

$$
Polinomio deseado=s^2+2\zeta\omega+\omega^2\\
$$

Nos interesa el denominador, por lo cual observamos que el grado es 2 y necesitamos 3, multiplicamos por un factor agregando un polo no dominante
$$
Polinomio deseado=(s^2+2\zeta\omega+\omega^2)(s+\beta\zeta\omega)\\
Polinomio deseado=s^3+s^2(\beta\zeta\omega+2\zeta\omega)+s(2\zeta^2\omega^2\beta+\omega^2)+s^0(\zeta\omega^3\beta)\\
$$
conociendo el máximo sobre impulso y tiempo de establecimiento hallamos cita y omega
$$
𝜔_n = \frac{\pi}{t_p\sqrt{1 − 𝜁^2}\\}=12.38\\
M_P=e^{\frac{-\zeta\pi}{\sqrt{1-\zeta^2}}}\\despejando\\
\zeta=0.6461
$$
Igualando los coeficientes de los polinomios hallamos a & k.
$$
s^3+s^2(\beta\zeta\omega+2\zeta\omega)+s(2\zeta^2\omega^2\beta+\omega^2)+s^0(\zeta\omega^3\beta)=s^3+s^2k+s(ka+3k-1)+s^0(3ka)\\
a=6.63\\
k=104\\
$$
Implementando el sistema en simulink se obtiene:

![image-20210218234826111](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218234826111.png)

**4)Si se incrementa la frecuencia natural no amortiguada se reducirá el tiempo de asentamiento de
un sistema de segundo orden. Falso o verdadero.**

Falso se puede observar en la ecuación que la relación es inversamente proporcional.

![image-20210218222712384](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218222712384.png)

**5)Para el prototipo de segundo orden si se disminuye la frecuencia natural no amortiguada el sobre
paso máximo a la salida permanece igual. Falso o verdadero.**

Verdadero.

**6)Si un sistema de control con retroalimentación unitaria es tipo 2. El error de estado estable para
una entrada rampa es diferente de cero. Falso o verdadero.**

Falso el error de estado estable para un sistema tipo 2 frente a una entrada rampa es 0.

**7)Realice un el bosquejo de la región en el plano complejo s en donde se ubicarían los polos con
las siguientes especificaciones ζ ≥ 0.707, ωn = 2 rad/s.**

![image-20210218230501466](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218230501466.png)

**8)Demostrar que la respuesta el tiempo y(t) de la siguiente función de transferencia**

![image-20210218222031397](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218222031397.png)

*La transformada de Laplace de respuesta escalón está dada por:*
$$
   Y(s)=H(s)\frac{1}{s}
$$


*Empleando la tabla de las transformadas de Laplace:*
$$
   y(t)=1-e^{-\sigma t}(cos(\omega_d)+\frac{\sigma}{\omega_d}sin(\omega_d))
$$


Despejando:
$$
   sin(\theta)=sin(tan^{-1}(\frac{\sqrt{1-\zeta^2}}{\zeta})) = \frac{\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)\sqrt{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}}{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}
$$
   Resolviendo:
$$
   \frac{\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)\sqrt{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}}{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}=\sqrt{1-\zeta^2}
$$
   Por lo tanto:
$$
   sin(\theta)=\sqrt{1-\zeta^2}
$$
   Despejando:
$$
   cos(\theta)=cos(tan^{-1}(\frac{\sqrt{1-\zeta^2}}{\zeta})) = \frac{\sqrt{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}}{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}
$$
   Resolviendo:
$$
   \frac{\sqrt{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}}{1+\left(\frac{\sqrt{1-\zeta^2}}{\zeta}\right)^2}=\zeta
$$
   Por lo tanto:
$$
   cos(\theta)=\zeta
$$
   **Volviendo al despeje**
$$
   𝜎 = 𝜁\omega_n\\
   𝜔_d = 𝜔_n\sqrt{1 − 𝜁^2}\\
   y(t)=1-(e^{-\sigma t}cos(\omega_d)+e^{-\sigma t}\frac{\sigma}{\omega_d}sin(\omega_d))\\
   y(t)=1-(\frac{\omega_n}{\omega_d}e^{-\sigma t}sin(\omega_d)\zeta+\frac{\omega_n\sqrt{1-\zeta^2}}{\omega_d}e^{-\sigma t}cos(\omega_d))\\
$$
   factorizando
$$
   \frac{\omega_n}{\omega_d}e^{-\sigma t}\\
$$

$$
   y(t)=1-\frac{\omega_n}{\omega_d}e^{-\sigma t}(sin(\omega_d)\zeta+\sqrt{1-\zeta^2}cos(\omega_d))\\
$$

   Reemplazando
$$
   \zeta \,\,\,\,\,\,\,y \, \,\,\,\,\,\sqrt{1-z^2}\\
$$

$$
   \\y(t)=1-\frac{\omega_n}{\omega_d}e^{-\sigma t}(sin(\omega_d)cos(\theta)+sin(\theta)cos(\omega_d))\\
$$

Con la identidad:
$$
   sin(\omega_d+\theta)=(sin(\omega_d)cos(\theta)+sin(\theta)cos(\omega_d))\\
$$
   reemplazando:
$$
\\y(t)=1-\frac{\omega_n}{\omega_d}e^{-\sigma t}sin(\omega_d+\theta)\\
$$

**9)Demuestre que para la respuesta de segundo orden el tiempo pico, el sobre impulso máximo y
el tiempo de levantamiento son.**

![image-20210218222050828](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210218222050828.png)


$$
c(t_r)=1=1-e^{-\zeta \omega_n t_r}(cos(\omega_d t_r) + \frac{\zeta}{\sqrt{1-\zeta^2}}sin(\omega_d t_r))
$$


$$
\frac{dc}{dt}=1=e^{-\zeta \omega_n t}(cos(\omega_d t) + \frac{\zeta}{\sqrt{1-\zeta^2}}sin(\omega_d t))+e^{-\zeta \omega_n t}(cos(\omega_d t) - \frac{\zeta}{\sqrt{1-\zeta^2}}sin(\omega_d t))
$$
Los términos de coseno  se cancelan. Evaluando t = tp
$$
\frac{dc}{dt}\big|_{t=t_p}=(sin(\omega_d t_p))\frac{\omega_n}{\sqrt{1-\zeta^2}}e^{-\zeta \omega_n t_p}=0
$$
En la última ecuación:
$$
sin(\omega_d t_p) = 0
$$
o bien:
$$
\omega_d = 0, \pi, 2\pi, 3\pi, ...
$$
Como el tiempo pico corresponde al primer pico sobre elongación máximo:
$$
\omega_d t_p = \pi
$$
Por lo tanto:
$$
t_p = \frac{\pi}{\omega_d}
$$
Como:
$$
𝜔_d = 𝜔_n\sqrt{1 − 𝜁^2}\\
$$
Entonces:
$$
t_p = \frac{\pi}{𝜔_n\sqrt{1 − 𝜁^2}\\}
$$

**10)Demostrar que para una entrada parábola el sistema debe ser mínimo tipo 3 para que el error en
estado estable sea cero ess = 0.**

*Usando un sistema tipo 2*
$$
G(s) = \frac{K}{s^2(s^2 +xs+y)}
$$
Entrada rampa:
$$
Ref = \frac{1}{s^2}
$$
Calculando:
$$
\lim_{s \to 0}\frac{\frac{1}{s^3}}{1+\left(\frac{k}{s^2\left(s^2+x\cdot \:s^2+y\right)}\right)}=\lim _{s\to \:0}\left(\frac{s^2+s^2x+y}{s^2\left(s^2+s^2x+y\right)+k}\right)\\
=\frac{0^2+0^2x+y}{0^2\left(0^2+0^2x+y\right)+k}\\
$$

$$
\lim_{s \to 0}(s)\frac{K}{s^2(s^2 +xs+y)}=\frac{y}{k}
$$

*Usando sistema tipo 3*

Teniendo: 
$$
G(s) = \frac{K}{s^3(s^2 +xs+y)}
$$
Entrada de parábola:
$$
Ref = \frac{1}{s^3}
$$
Entonces:
$$
\lim _{s\to 0}\left(s\right)\frac{\frac{1}{s^3}}{1+\left(\frac{k}{s^3\left(s^2+x\cdot \:s^2+y\right)}\right)}=\lim _{s\to \:0}\left(s\right)\cdot \lim _{s\to \:0}\left(\frac{\frac{1}{s^3}}{1+\frac{k}{s^3\left(s^2+xs^2+y\right)}}\right)\\
\lim _{s\to \:0}\left(s\right)=0\\
\lim _{s\to \:0}\left(\frac{\frac{1}{s^3}}{1+\frac{k}{s^3\left(s^2+xs^2+y\right)}}\right)=\frac{y}{k}
$$
Entonces:
$$
\lim _{s\to 0}\left(s\right)\frac{\frac{1}{s^3}}{1+\left(\frac{k}{s^3\left(s^2+x\cdot \:s^2+y\right)}\right)}=0\cdot \frac{y}{k}=0
$$



