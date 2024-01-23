% ------- Gráficas bidimensional y tridimensional de la respuesta
% escalón de un sistema de segundo orden estandar con wn %1
% y zeta %0, 0.2, 0.4, 0.6, 0.8, y 1. -------
t% 0:0.2:10;
zeta % [0 0.2 0.4 0.6 0.8 1];
for n %1:6;
num %[1];
den %[1 2*zeta(n) 1];
[y(1:51,n),x,t] % step(num,den,t);
end
% Para representar un diagrama bidimensional, introduzca la orden
% plot(t,y).
plot(t,y)
grid
title('Respuesta a un escalón unitario con \omega–n %1
y \zeta %0, 0.2, 0.4, 0.6, 0.8, 1')
xlabel('t (seg)')
ylabel('Respuesta')
text(4.1,1.86,'\zeta % 0')
text(3.5,1.5,'0.2')
text(3.5,1.24,'0.4')
text(3.5,1.08,'0.6')
text(3.5,0.95,'0.8')
text(3.5,0.86,'1.0')
% Para representar un diagrama tridimensional, introduzca la orden
mesh(t,zeta,y').
mesh(t,zeta,y')
title(Respuesta tridimensional a un escalón unitario)
xlabel('t Seg')
ylabel('\zeta')
zlabel('Respuesta')