**Tarea 1 Control - Brian Sebastian Caceres Pinzon 1803245**

**Ejercicio 1**

Modelo Matemático.
$$
\dot x=v\\
\dot v=\frac{1}{m}[-\frac{cI_L^2}{x}+mg]\\
\dot I_L=\frac{1}{L}[V(t)-I_LR]
$$
Puntos de equilibrio.
$$
\ddot x=\dot I_L=0\\
v(t)-I_L=0\\
-\frac{cI_L^2}{x}+mg=0\\
$$
Constantes:
$$
R=10Ω\\c=2\\m=0.2kg\\
$$
Puntos de operación. 
$$
\bar x=0.05m\\
I_L=\sqrt{\frac{mg\bar x}{c}}\\
\bar I_L=\sqrt{\frac{9.8*0.2*0.05}{2}}=0.22A\\
\bar v(t)=\bar I_LR=0.22*10=2.2V
$$
Linealizando.
$$
\dot v\delta=-\frac{2cI_L\delta}{mx}+\frac{cI_L^2}{mx^2\delta}\\
\dot x\delta=v\\
\dot I_L=\frac{v(t)\delta}{L}-\frac{RI_L\delta}{L}
$$
Función de transferencia si la salida es x.
$$
ft=-\frac{44}{5s^3-5s^2-968s+968}
$$
Por medio del criterio de la ubicación de los polos, se observa que el sistema es inestable y también al escalón.

![image-20210207203237498](C:\Users\Cx001la\Desktop\Control 2021-1\Teoria\Tarea1\rlocus)

![image-20210209204048032](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209204048032.png)



**Ejercicio 2**

- usando el enfoque de Euler-Lagrange verificar el modelo matemático del siguiente
  sistema (bola sobre riel).
- Obtener el modelo lineal y la función de transferencia.

![image-20210209190531658](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209190531658.png)
$$
T=T_{viga}+T_{bola}\\
T_{viga}=T_{rot}=\frac{1}{2}Iw^2\\
T_{bola}=T_{tras}+T_{rot}=\frac{1}{2}mv_b^2+\frac{1}{2}Iw^2
$$
Calculo de componentes para hallar vb

![image-20210209190710496](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209190710496.png)
$$
x=rcos(\theta)\rightarrow \dot x=\dot rcos(\theta)-r\dot \theta sen(\theta)\\
y=rsen(\theta)\rightarrow \dot y=\dot rsen(\theta)+r\dot \theta cos(\theta)\\
v_b^2=\dot x^2+\dot y^2
$$
Se obtiene Vb y w para la energía cinética en la bola
$$
v_b^2=(\dot rcos(\theta)-r\dot \theta sen(\theta))^2+(\dot rsen(\theta)+r\dot \theta cos(\theta))^2\\
v_b^2=\dot r^2cos^2(\theta)+r^2\dot \theta^2 sen^2(\theta)+\dot r^2sen^2(\theta)+r^2\dot \theta^2 cos^2(\theta)\\
v_b^2=\dot r^2(cos^2(\theta)+sen^2(\theta))+r^2\dot \theta^2(sen^2(\theta)+cos^2(\theta))\\
v_b^2=\dot r^2+r^2 \dot \theta^2\\
\theta R=r\rightarrow\dot \theta R=\dot r\rightarrow wR=\dot r\rightarrow w=\frac{\dot r}{R}
$$
Energía cinética total del sistema
$$
T_{viga}=\frac{1}{2}J_v\dot \theta^2\\
T_{bola}=\frac{1}{2}m(\dot r^2+r^2 \dot \theta^2)+\frac{J_b\dot r^2}{2R^2}\\
T=\frac{1}{2}J_v\dot \theta^2+\frac{m\dot r^2}{2}+\frac{mr^2 \dot \theta^2}{2}+\frac{J_b\dot r^2}{2R^2}
$$
**Energía Potencial**

![image-20210209190902000](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209190902000.png)
$$
U=U_{viga}+U_{bola}\\
U_{viga}=0\\
U_{bola}=mgrsen(\theta)\\
U=mgrsen(\theta)\\
$$
**Lagrangiano**	
$$
L=T-U\\
L=\frac{1}{2}J_v\dot \theta^2+\frac{m\dot r^2}{2}+\frac{mr^2 \dot \theta^2}{2}+\frac{J_b\dot r^2}{2R^2}-mgrsen(\theta)
$$
**Ecuaciones de Lagrange**
$$
\frac{d}{dt}(\frac{dL}{d\dot \theta})-\frac{dL}{d\theta}+\frac{dD}{d\dot \theta}= \tau\\
\frac{d}{dt}(\frac{dL}{d\dot r})-\frac{dL}{dr}=0\\
\frac{dL}{d\dot r}=m\dot r\rightarrow \frac{d}{dt}(\frac{dL}{d\dot r})=m\ddot r+\frac{J_b\ddot r}{R^2}\\
\frac{dL}{dr}=mr\dot \theta^2-mgsen(theta)\\
\frac{dL}{d\dot \theta}=J_V\dot \theta+mr^2\dot \theta\rightarrow \frac{d}{dt}(\frac{dL}{d\dot \theta})=J_V\ddot \theta+mr^2\ddot \theta\\
\frac{dL}{d\dot \theta}=-mgrcos(\theta)\\
$$
**Ecuaciones de movimiento**
$$
\ddot r(m+\frac{J_b}{R^2})-mr\dot \theta^2+mgsen(\theta)=0\\
\ddot \theta(J_v+J_b+mr^2)+mgrcos(\theta)+2mr\dot r\dot \theta=\tau
$$
**Linealización**

*Puntos de Equilibrio*
$$
\ddot r=\dot r=\ddot \theta=\dot \theta=0\\
\ddot r(m+\frac{J_b}{R^2})-mr\dot \theta^2+mgsen(\theta)=0\rightarrow 0=0\\
\ddot \theta(J_v+J_b+mr^2)+mgrcos(\theta)+2mr\dot r\dot \theta=\tau \rightarrow
\tau=mgr\cos(\theta)\\
$$
*Puntos de operación*
$$
\bar \theta=\bar w=\bar{\dot r}=0\\
r=0.03[m]\\
\tau=mg\bar r\cos(\theta)\rightarrow \tau=0.012054\\
$$
*Jacobiano*

Cambio de variables
$$
\dot \theta=w\\
\dot r=v_r
$$
Parámetros
$$
m=0.041[kg]\\
J_V=0.473[Kgm^2]\\
J_b=3.69e-6[Kgm^2]\\
r=0.5[m]\\
L=1[m]\\
$$
Espacio de estados linealizado
$$
\left[
\matrix
{
\dot \theta\\
\dot w\\
\dot r\\
\dot v_r\\
}
\right]=
\left[
\matrix
{
0&1&0&0\\
0&0&-0.00027&0\\
0&0&0&1\\
-9.79&0&0&0\\
}
\right]
\left[
\matrix
{
 \theta\\
 w\\
 r\\
 v_r\\
}
\right]+
\left[
\matrix
{
0\\2.11\\0\\0
}
\right]\tau\\
y=\left[
\matrix
{
0&0&1&0\\
}
\right]
\left[
\matrix
{
 \theta\\
 w\\
 r\\
 v_r\\
}
\right]
$$

Función de transferencia**
$$
ft=\frac{-18.83}{s^4+(2.22e-16)s^3+(5.329e-15)s^2-(5.329e-15)s-7.567}
$$

**Estabilidad del sistema**

Se observa que el sistema es inestable. Por medio del criterio de ubicación de polos y a la respuesta al escalón.

![image-20210209203843413](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209203843413.png)

![image-20210209202844357](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209202844357.png)


**Ejercicio 3**

![image-20210209191023834](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209191023834.png)

Ecuaciones de Movimiento
$$
1.\ddot X(M+m)-\ddot \theta (mLcos(\theta))+mL\dot \theta^2sen)\theta+b\dot X=F(t)\\
2.\ddot \theta(mL^2+I)-\ddot X(mLcos(\theta))+\dot \theta C-mgLsen(\theta)=0
$$
Dejando en cada ecuación solo una máxima derivada
$$
w_p=-\frac{CMw+Cmw-FLmcos(\theta)-Lgm^2sin(\theta)+L^2m^2w^2cos(\theta)sin(\theta)-LMgmsen(\theta)+Lbmvcos(\theta)}{-L^2m^2cos(\theta)^2+L^2m^2+ML^2m+Im+IM }\\
V_P=-\frac{Ibv-FI-FL^2m+L^2bmv+L^3m^2w^2sin(\theta)+ILmw^2sen(\theta)+CLmwcos(\theta)-L^2gm^2cos(\theta)sin(\theta)}{-L^2m^2cos(\theta)^2+L^2m^2+ML^2m+Im+IM}
$$
Reemplazando los valores iniciales
$$
Movil\\
M = 0.48
b = 3.83\\ 
Péndulo\\
m = 0.16
L = 0.25
I = 0.0043
C = 0.00218
g=9.8\\
\\
x_p=v\\
v_p=\frac{25F}{6}-\frac{383v}{64}-\frac{w^2sen(\theta)}{16}+\frac{cos(\theta)(500cos(\theta)sin(\theta)w^2+436w-78400sen(\theta)-12500Fcos(\theta)+47875vcos(\theta))}{(16)(500cos(\theta)^2-2860)}\\
\theta_p=w\\
w_p=\frac{500cos(\theta)sin(\theta)w^2+436w-78400sin(\theta)-12500Fcos(\theta)+47875vcos(\theta)}{500cos(\theta)^2-2860}\\
$$
Linealizando mediante jacobiano
$$
\left[
\matrix
{
\partial\dot x\\
\partial\dot v\\
\partial\dot \theta\\
\partial\dot w\\
}
\right]=
\left[
\matrix
{
0&1&0&0\\
0&a_1&b_1&c_1\\
0&0&0&1\\
0&a_2&b_2&c_2\\
}
\right]
\left[
\matrix
{
\partial x\\
\partial v\\
\partial \theta\\
\partial w\\
}
\right]
+
\left[
\matrix
{
0\\
d_1\\
0\\
d_2
}
\right]F\\
a_1=\frac{47875cos(\theta)^2}{16\partial_3}-\frac{383}{64}\\
b_1=\frac{125cos(\theta)^2sen(\theta)\partial_1}{2\partial_3^2}-\frac{sen(\theta)\partial_1}{16\partial_3}-\frac{cos(\theta)\partial_2}{16\partial_3}-\frac{w^2cos(\theta)}{16}\\
c_1=\frac{cos(\theta)\partial_4}{16\partial_3}-\frac{wsen(\theta)}{8}\\
d_1=\frac{25}{16}-\frac{3125cos(\theta)^2}{(4)(500cos(\theta)^2-2860)}\\
a_2=\frac{47875cos(\theta)}{\partial_3}\\
b_2=\frac{1000cos(\theta)sen(\theta)\partial_1}{\partial_3^2}-\frac{\partial_2}{\partial_3}\\
c_2=\frac{\partial_4}{\partial_3}\\
d_2=-\frac{12500cos(\theta)}{500cos(\theta)^2-2860}\\
$$
Reemplazando punto de operación.
$$
\theta=w=0\\
\partial_1=-12500F+47875v\\
\partial_2=78400\\
\partial_3=-2360\\
\partial_4=436\\
\left[
\matrix
{
\partial\dot x\\
\partial\dot v\\
\partial\dot \theta\\
\partial\dot w\\
}
\right]=
\left[
\matrix
{
0&1&0&0\\
0&-7.2523&2.0763&-0.0115\\
0&0&0&1\\
0&-20.2860&33.2203&-0.1847\\
}
\right]
\left[
\matrix
{
\partial x\\
\partial v\\
\partial \theta\\
\partial w\\
}
\right]
+
\left[
\matrix
{
0\\
1.8935\\
0\\
5.2966\\
}
\right]F\\
y=
\left[
\matrix
{
1&0&0&0
}
\right]
\left[
\matrix
{
\partial x\\
\partial v\\
\partial \theta\\
\partial w\\
}
\right]\\
Ft(s)=\frac{-5.2966s-0.00099118}{s^3+7.437s^2-32.1141s-198.8038}\\
$$

**Estabilidad del sistema**

Se observa que el sistema es inestable. Por medio del criterio de los polos y a la respuesta al escalon.

![image-20210209203701237](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209203701237.png)

![image-20210209203432831](C:\Users\Cx001la\AppData\Roaming\Typora\typora-user-images\image-20210209203432831.png)