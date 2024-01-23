%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kp*s+ki+kd*s^2;
pidD=s;
pN=39;
pD=s^2-98;
Planta=collect(pN/pD,s);
PolNum=collect(pidN*pN)
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);

%Hallar beta y zeta
syms c mp s w
% format float
% mp=exp(  -(c*pi)/(sqrt(  1-c^2 ))  )
mp=0.1;%maximo sobre impulso
ts=2;%tiempo de establecimiento
c=solve(exp(  -(c*pi)/(sqrt(  1-c^2 ))  )-mp==0,c);%despejar cita
c=abs(double(c));
ci=abs(c(2))%Hallar cita
w=4/(ts*ci)%Hallar omega

%Polinomio Deseado
beta=10; %beta debe ser minimo 10
zeta=ci; %0.5912;
wn=w;%0.8458;
% wn2=wn^2
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^1;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4)],5)
%Resolver sistema
S = solve(eqns1,[ki kp kd]);
ki=eval(S.ki)
kp=eval(S.kp)
kd=eval(S.kd)

%punto 14
ft2=tf([0.025 5],[1 5])
bode(ft2)
