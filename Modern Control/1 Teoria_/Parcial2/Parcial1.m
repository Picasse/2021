%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=ki2+ki*s+kp*s^2+kd*s^3+kd2*s^4;
pidD=s^2;
pN=0.4/(3/10);
pD=(3*s+1)*(0.05*s+1)*(2*s+1)/(3/10);
PolNum=collect(pidN*pN);
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=coeffs(PolDen,s)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);
%Polinomio Deseado
ft=tf([1.3333],[1 20.83 16.83 3.33])
% step(ft)
ts=50;%14.9 planta
beta=5
zeta=0.9
wn=4/(ts*zeta)
% wn2=wn^2
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^3;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(5),d1s(5) == d2s(5),d1s(6) == d2s(6)],5)
%Resolver sistema
S = solve(eqns1,[ki ki2 kp kd kd2]);
ki=eval(S.ki)
ki2=eval(S.ki2)
kp=eval(S.kp)
kd=eval(S.kd)
kd2=eval(S.kd2)


% format long
% PD=[1     2*cd*wnd     wnd^2];
% PD=conv([PD],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
% % PD=conv([PD],[1 5*cd*wnd])



