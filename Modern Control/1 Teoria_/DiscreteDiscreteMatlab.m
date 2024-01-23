syms z s r0 r1 r2 s0
format compact

disp(       'TOMAR LOS EXPONENTES DE Z NEGATIVOS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
numz=vpa(collect( (0.079*z+0.06765*z^2)*(r0+r1*z+r2*z^2) ,z),5)
denz=vpa(collect( (1-1.607*z +0.6065*z^2)*(1-z)*(1+s0*z) ,z),5)
% disp('z^0         z^1                      z^2                  z^3')
% vpa(coeffs(numz,z),5)
% vpa(coeffs(denz,z),5)

%ADRIANA CODE https://controlautomaticoeducacion.com/control-de-procesos/controlador-por-asignacion-de-polos/
ft=tf([3],[1 2 0])
Fz=c2d(ft,0.25)
numz = Fz.num{1}
denz = Fz.den{1}
d1=denz(2);
d2=denz(3);
k=[1 0 0 0 0;  -1+d1 1 numz(2) 0 0; d2-d1 -1+d1 numz(3) numz(2) 0; -d2 d2-d1 0 numz(3) numz(2); 0 -d2 0 0 numz(3)]
%hallar polinomio deseado discreto
alfa=-0.2; %   -0.05<=alfa<=-0.5
tsd=5;
cd=0.9;
wnd=4/(tsd*cd);
tm=tsd/20;
p1=-2*exp(-cd*wnd*tm)*cos(wnd*tm*sqrt(1-cd^2))
p2=exp(-2*cd*wnd*tm)
PD=[1 p1 p2];
PD=conv(PD,[1 alfa]);
PD=conv(PD,[1 alfa]) %Lo necesitamos de orden 4
P=PD' %Transpuesta boludo
x=k\P %Siempre debe haber un uno de primeras 1 s0 r0 r1 r2
s0=x(2)
r0=x(3)
r1=x(4)
r2=x(5)

%hallando PID continuo para comparar con el pid discreto
syms kd kp ki
PDC=conv([1 2*cd*wnd wnd^2],[1 5*cd*wnd])
kd=solve(3*kd+2==PDC(2),kd);
kp=solve(3*kp==PDC(3),kp);
ki=solve(3*ki==PDC(4),ki);
kd=double(kd)
kp=double(kp)
ki=double(ki)
PID=tf([kd kp ki],[1 0])
%Discretizando el PID continuo
c2d(PID,0.05,'tustin')%Si me chimbea y me empieza a inestabilizar cambio este tiempo de muestreo ej 0.25->0.05, ojo con la señal de control
%si la señal de control se va a la mierda es mejor el control discreto
%discreto que hacer un pid continuo y discretizarlo


