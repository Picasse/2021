**EJERCICIO EN CLASE**   BRIAN SEBASTIAN CACERES PINZON 1803245 est.brian.caceres@gmail.com 

Características de fuente y carga para todos los ejercicios.

Fuente Vac 110v 60Hz.

Consumo Carga 1(W): 50W (Carga Resistiva)

![image-20210214112242430](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214112242430.png)

Consumo de la carga 2 (W): ¿ W ? (altamente inductiva, solo bobina)

La potencia es inversamente proporcional a la impedancia de la inductancia, inductancia alta, potencia tiende a 0, inductancia baja, potencia tiende a ∞.

Consumo de la carga 3 (W): 50 W (carga combinada resistiva inductiva 26mH)

![image-20210214115402736](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214115402736.png)

**_Análisis para carga R._**

**1)Rectificador de media onda**

a. Características de los diodos rectificadores. 

La figura muestra una carga resistiva alimentada por una fuente de voltaje sinusoidal,durante el semiciclo positivo de la señal alterna, el diodo se polariza en forma directa y sus características físicas lo convierten en un interruptor en estado de conducción, así en la carga ya no habrá una señal alterna sino una señal periódica con una gran componente de CC, por otro lado en el semiciclo negativo el diodo actúa como un circuito abierto y recibe todo el voltaje de la fuente.

![image-20210214122553355](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214122553355.png)

b. Observe las señales de voltaje en la carga. c. Mida la potencia consumida por la carga y entregada por la fuente. 

![image-20210214123137668](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214123137668.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214123711888](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214123711888.png)

![image-20210214123740290](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214123740290.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.	
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=42.98\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=42.27\%\\
F_p=\frac{24.3}{34.8}=0.69
$$

Se concluye que la carga aprovecha 0.69 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 42.98% y 42.27% para voltaje y corriente respectivamente. 

**2)Rectificador de media onda con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214193621813](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214193621813.png)

b. Observe las señales de voltaje en la carga. c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214132444838](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214132444838.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214142722892](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214142722892.png)

![image-20210214142823718](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214142823718.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=42.5\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=37.5\%\\
F_p=\frac{24.3}{34.8}=0.69
$$
Se concluye que la carga aprovecha 0.69 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 42.5% y 37.5% para voltaje y corriente respectivamente. 

**3)Rectificador de media onda con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214193727986](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214193727986.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214142854217](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214142854217.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214143142762](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214143142762.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214145417463](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214145417463.png)

![image-20210214145631904](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214145631904.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=4.7\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=4.91\%\\
F_p=\frac{P}{S}=0.73
$$
Se concluye que la carga aprovecha 0.73 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 4.7% y 4.91% para voltaje y corriente respectivamente, la cual no es tan alta. 

**4)Rectificador de onda completa. **

a. Características de los diodos rectificadores. 

Puente de diodos.

![image-20210214184230553](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214184230553.png)

Diodo de marcha libre.

![image-20210214185008007](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214185008007.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214145710136](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214145710136.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214201716716](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214201716716.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214145102740](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214145102740.png)

![image-20210214145155905](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214145155905.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=17.1\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=19.2\%\\
F_p=\frac{0.45}{0.45}=1
$$
Se concluye que la carga aprovecha toda la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 17.1% y 19.2% para voltaje y corriente respectivamente. 

**5) Rectificador de onda completa con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214185255249](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214185255249.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214165357762](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214165357762.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214202118351](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214202118351.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214171015563](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214171015563.png)

​	![image-20210214171112165](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214171112165.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=17.9\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=17.2\%\\
F_p=\frac{43.8}{44.4}=0.98
$$
Se concluye que la carga aprovecha 0.98 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 17.9% y 17.2% para voltaje y corriente respectivamente. 

**6)Rectificador de onda completa con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214185456039](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214185456039.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214165438525](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214165438525.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214203519404](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214203519404.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214171144017](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214171144017.png)

![image-20210214171212693](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214171212693.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=2.3\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=2.4\%\\
F_p=\frac{48.7}{49.3}=0.98
$$
Se concluye que la carga aprovecha 0.98 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 2.3% y 2.4% para voltaje y corriente respectivamente. 

----------------------------------------------------------------------------------------------------------------------------------------------------------

**_Análisis para carga L._**

**1)Rectificador de media onda**

a. Características de los diodos rectificadores. 

![image-20210214194202957](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194202957.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214174828477](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214174828477.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214155133518](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214155133518.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214175411902](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214175411902.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=2.2\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=1.4\%\\
F_p=\frac{0.52}{2.09}=0.24
$$
Se concluye que la carga aprovecha 0.24 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 2.2% y 1.4% para voltaje y corriente respectivamente. 

**2)Rectificador de media onda con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214194407148](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194407148.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214174858087](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214174858087.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214155207685.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214204458859](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214204458859.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=36.4\%\\
F_p=\frac{0.44}{2.10}=0.2
$$
Se concluye que la carga aprovecha 0.2 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 36.4% para voltaje, la corriente no se pudo medir correctamente por el simulador. 

**3)Rectificador de media onda con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214194509590](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194509590.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214174936543](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214174936543.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214205236710](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214205236710.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214175828863](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214175828863.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=37.6\%\\
F_p=\frac{10.5}{10.6}=0.99
$$
Se concluye que la carga aprovecha 0.99 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 37.6% para voltaje, la corriente no se pudo medir correctamente por el simulador. 

**4)Rectificador de onda completa. **

a. Características de los diodos rectificadores. 

![image-20210214190045364](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214190045364.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214175002413](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214175002413.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214205606705](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214205606705.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214175855026](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214175855026.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=37.4\%\\
F_p=\frac{9.65}{9.72}=0.99
$$
Se concluye que la carga aprovecha 0.99 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 37.4% para voltaje, la corriente no se pudo medir correctamente por el simulador. 

**5) Rectificador de onda completa con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214210446057](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214210446057.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214210525298](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214210525298.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214205844405](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214205844405.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 	

![image-20210214210609399](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214210609399.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=16.1\%\\
F_p=\frac{192}{228}=0.84
$$
Se concluye que la carga aprovecha 0.84 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 16.1% para voltaje, la corriente no se pudo medir correctamente por el simulador. 

**6)Rectificador de onda completa con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214215145564](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214215145564.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214215216748](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214215216748.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214210755608](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214210755608.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214215428251](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214215428251.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=16.1\%\\
F_p=\frac{0.8}{3.07}=0.26
$$
Se concluye que la carga aprovecha 0.26 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 16.1% para voltaje, la corriente no se pudo medir correctamente por el simulador. 

----------------------------------------------------------------------------------------------------------------------------------------------------------

**_Análisis para carga RL._**

**1)Rectificador de media onda**

a. Características de los diodos rectificadores. 

![image-20210214194815533](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194815533.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181805212](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181805212.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214181434884](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181434884.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214182054834](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182054834.png)

![image-20210214182128881](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182128881.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=42.6\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=41.2\%\\
F_p=\frac{24.4}{34.6}=0.7
$$
Se concluye que la carga aprovecha 0.7 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 42.6% Y 41.2% para voltaje y corriente respectivamente. 

**2)Rectificador de media onda con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214194853051](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194853051.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181825323](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181825323.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214222804567](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214222804567.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214182149346](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182149346.png)

![image-20210214182322818](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182322818.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=45.6\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=42.2\%\\
F_p=\frac{13.4}{19.1}=0.7
$$
Se concluye que la carga aprovecha 0.7 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 45.6% Y 42.2% para voltaje y corriente respectivamente.

**3)Rectificador de media onda con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214194940226](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214194940226.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181850731](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181850731.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214223210680](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214223210680.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214223645800](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214223645800.png)

![image-20210214223723142](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214223723142.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=15.6\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=12.2\%\\
F_p=\frac{0.2}{2.46}=0.08
$$
Se concluye que la carga aprovecha 0.08 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 15.6% Y 12.2% para voltaje y corriente respectivamente.

**4)Rectificador de onda completa. **

a. Características de los diodos rectificadores. 

![image-20210214190926620](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214190926620.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181910688](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181910688.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214224247902](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214224247902.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214182612845](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182612845.png)

![image-20210214182646942](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182646942.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=30.6\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=32.2\%\\
F_p=\frac{13.7}{24.3}=0.56
$$
Se concluye que la carga aprovecha 0.56 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 30.6% Y 32.2% para voltaje y corriente respectivamente.

**5) Rectificador de onda completa con diodo de marcha libre**

a. Características de los diodos rectificadores. 

![image-20210214191110436](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214191110436.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181933567](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181933567.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214224350455](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214224350455.png)	

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

![image-20210214182735844](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182735844.png)

![image-20210214182758809](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182758809.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.
$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=30.7\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=32.1\%\\
F_p=\frac{13.4}{24.3}=0.55
$$
Se concluye que la carga aprovecha 0.55 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 30.7% Y 32.1% para voltaje y corriente respectivamente.

**6)Rectificador de onda completa con diodo de marcha libre y condensador para reducir rizo (10%). **

a. Características de los diodos rectificadores. 

![image-20210214191256671](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214191256671.png)

b. Observe las señales de voltaje en la carga. 

![image-20210214181954058](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214181954058.png)

c. Mida la potencia consumida por la carga y entregada por la fuente.

![image-20210214224725012](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214224725012.png)

d. Compare los resultados de obtener las señales de espectro de Fourier para voltaje y corriente en la carga (análisis de armónicos). 

​	![image-20210214182834091](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182834091.png)

![image-20210214182857379](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210214182857379.png)

e. Concluya sobre el aprovechamiento de la energía en cada tipo de carga.

$$
THD_v=\frac{\sqrt{V_2^2+V_3^2+V_4^2+V_n^2}}{V_1}=4.4\%\\
THD_I=\frac{\sqrt{I_2^2+I_3^2+I_4^2+I_n^2}}{I_1}=5.1\%\\
F_p=\frac{61.2}{248}=0.24
$$
Se concluye que la carga aprovecha 0.24 veces la potencia entregada por la fuente.

También se puede observar que la calidad de la energía recibida se ve afectada, por los armónicos produciendo una distorsión 4.4% Y 0.24% para voltaje y corriente respectivamente.





















