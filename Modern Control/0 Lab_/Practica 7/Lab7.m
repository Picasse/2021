%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd2*s^3+kd*s^2+kp*s+ki;
pidD=s;
pN=0.5;
pD=s^3+2*s^2+2*s;
PolNum=collect(pidN*pN);
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=coeffs(PolDen,s)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=PolNum/PolDen;
%Polinomio Deseado
beta=5
zeta=0.9
wn=0.188
wn2=wn^2;
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^2;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
d1s
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4)],5)
%Resolver sistema
S = solve(eqns1,[ki kp kd kd2]);
ki=eval(S.ki)
kp=eval(S.kp)
kd=eval(S.kd)
kd2=eval(S.kd2)

% planta=tf([0.5],[1 2 2 0])
control=tf([kd2 kd kp ki],[1 0])
ts=30;          %tiempo de establecimiento
tm=ts/40;     %tiempo de muestreo
controlz=c2d(control,tm,'tustin')
% plantaz=c2d()



