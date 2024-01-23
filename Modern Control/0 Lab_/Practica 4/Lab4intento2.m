%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd*s^4+kp*s^3+ki*s^2+ki2*s^1+ki3;
pidD=s^3;
pN=100;
pD=s^4+2*s^3+2*s^2;
Planta=collect(pN/pD,s);
PolNum=collect(pidN*pN)
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5)
%Polinomio Deseado
beta=5;
zeta=0.95;
wn=1;
wn2=wn^2;
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^5;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4),d1s(5) == d2s(5)],5)
%Resolver sistema
S = solve(eqns1,[kd kp ki ki2 ki3]);
kd=eval(S.kd)
kp=eval(S.kp)
ki=eval(S.ki)
ki2=eval(S.ki2)
ki3=eval(S.ki3)


