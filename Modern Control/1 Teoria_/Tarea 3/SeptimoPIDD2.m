%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kp*s+ki+kd*s^2+kd2*s^3;
pidD=s;
pN=1;
pD=s^3+21*s^2+20.44*s+8;
Planta=collect(pN/pD,s);
PolNum=collect(pidN*pN)
PolDen=collect(pidD*pD+pidN*pN,s)
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);
%Polinomio Deseado
beta=5;
zeta=0.4;
wn=5;
wn2=wn^2;
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^2;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4),d1s(5) == d2s(5)],5)
%Resolver sistema
S = solve(eqns1,[ki kp kd kd2]);
ki=eval(S.ki)
kp=eval(S.kp)
kd=eval(S.kd)
kd2=eval(S.kd2)


