%lineas 4 5 6 7 8 14 15 16 17
clear all
format compact
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd*s^3+kp*s^2+ki*s+ki2;
pidD=s^2;
pN=0.1/0.0014;
pD=s^2+119.2857*s+100;
PolNum=collect(pidN*pN)
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=coeffs(PolDen,s)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=PolNum/PolDen;
%Polinomio Deseado
beta=10
zeta=0.7
wn=6.015037
wn2=wn^2
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^2;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s==d2s],5)
%Resolver sistema
S = solve(eqns1,[ki ki2 kp kd]);
ki=eval(S.ki)
ki2=eval(S.ki2)
kp=eval(S.kp)
kd=eval(S.kd)


% format long
% PD=[1     2*cd*wnd     wnd^2];
% PD=conv([PD],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
% % PD=conv([PD],[1 5*cd*wnd])



