%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kp*s+kd*s^2;
pidD=s;
pN=1;
pD=s^2-2*s;
Planta=collect(pN/pD,s);
PolNum=collect(pidN*pN)%multplico por 800 conservo igualdad
PolDen=collect(pidD*pD+pidN*pN,s)%divido por 800 conservo igualdad
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);
%Polinomio Deseado
% beta=5;
zeta=0.8261;
wn=4.8421;
% wn2=wn^2
PDgeneral=(s*s+2*zeta*wn*s+wn^2);
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3)],5)
%Resolver sistema
S = solve(eqns1,[kp kd]);
kp=eval(S.kp)
kd=eval(S.kd)
