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
Por medio del criterio de la ubicación de los polos, se observa que el sistema es inestable.

![image-20210207203237498](C:\Users\Cx001la\Desktop\Control 2021-1\Teoria\Tarea1\rlocus)

 











