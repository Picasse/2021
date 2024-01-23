%DiscretoDiscreto
ft=tf([3 0],[1 2])
tm=1/8
ftz=c2d(ft,tm)
% step(ft)
% hold on%Ver las respuestas
% step(ftz)%Como si se parecen el tm está bien seleccionado
AS=conv([1 -1],[1 -1]);
AS=conv([AS],[1 -1]);
AS=conv([AS],[1 -1])%(1-z^-1)^4
AS=conv([AS],[1 -0.7788])%(1-z^-1)^4*(1-0.7788z^-1)=z0 z-1 z-2 z-3 z-4 z-n
%Matriz
% k=[1 3 0 0 0 0;-4.7788 -3 3 0 0 0;9.1152 0 -3 3 0 0;-8.6728 0 0 -3 3 0;4.1152 0 0 0 -3 3;-0.7788 0 0 0 0 -3]
k=[1 0 0 0 0;-4.7788 3 0 0 0;9.1152 -3 3 0 0;-8.6728 0 -3 3 0;4.1152 0 0 -3 3;-0.7788 0 0 0 -3]%R0=0
%hallar polinomio deseado discreto
alfa=-0.2; %   -0.05<=alfa<=-0.5
tsd=2;
cd=0.8;
wnd=4/(tsd*cd);
tm=0.125;
p1=-2*exp(-cd*wnd*tm)*cos(wnd*tm*sqrt(1-cd^2))
p2=exp(-2*cd*wnd*tm)
PD=[1 p1 p2];
PD=conv(PD,[1 alfa]);
PD=conv(PD,[1 alfa]);
PD=conv(PD,[1 alfa]) %Lo necesitamos de orden -5
P=PD' %Transpuesta boludo
x=k\P %Siempre debe haber un uno de primeras 1 r1 r2 r3 r4 ya que r0=0
r1=x(2)
r2=x(3)
r3=x(4)
r4=x(5)

%hallando PID continuo para comparar con el pid discreto
syms kp ki ki2 ki3 ki4
kp=0
PDC=conv([1 2*cd*wnd wnd^2],[1 5*cd*wnd]);
PDC=conv([PDC],[1 5*cd*wnd])
ki=solve(3*ki+2==PDC(2),ki);
ki2=solve(3*ki2==PDC(3),ki2);
ki3=solve(3*ki3==PDC(4),ki3);
ki4=solve(3*ki4==PDC(5),ki4);
ki=double(ki)
ki2=double(ki2)
ki3=double(ki3)
ki4=double(ki4)
PID=tf([kp ki ki2 ki3 ki4],[1 0 0 0 0])
%Discretizando el PID continuo
PIDZ=c2d(PID,tm,'tustin')%Si me chimbea y me empieza a inestabilizar cambio este tiempo de muestreo ej 0.125->0.05, ojo con la señal de control
%si la señal de control se va a la mierda (valores muy altos ej 5000voltios en una stm)es mejor el control discreto
%discreto que hacer un pid continuo y discretizarlo

%Coeficientes pid para simu
PIDZn = PIDZ.num{1}



