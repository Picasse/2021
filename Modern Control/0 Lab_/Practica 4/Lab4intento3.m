%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
Km=1; R1=0.02 ; P=1; L=0.05; J=0.01; R=0.01; B=0.01; Ka=1; R2=0.03;
num=Km*R1*P
den=(  (L*J)*s^2  +(R*J+L*B)*s  +R*B+Km*Ka  )*(R2*60*s)
pidN=kd2*s^4+kd*s^3+kp*s^2+ki*s+ki2;
pidD=s;
pN=100;
pD=s^4+2*s^3+2*s^2;
Planta=vpa(collect(num/den,s),5)
PolNum=vpa(collect(pidN*pN),5);
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5);
d1s=vpa(coeffs(PolDen,s),5);%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);
%Polinomio Deseado
beta=5;
zeta=0.95;
wn=1;
wn2=wn^2;
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^3;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4),d1s(5) == d2s(5),d1s(6) == d2s(6)],5)
%Resolver sistema
S = solve(eqns1,[ki kp kd kd2 kd3]);
ki=eval(S.ki)
kp=eval(S.kp)
kd=eval(S.kd)
kd2=eval(S.kd2)
kd3=eval(S.kd3)

