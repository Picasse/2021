%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd*s^2+kp*s+ki;%Numerador Controlador
pidD=s;%Denominador Controlador
pN=0.04073576;%Numerador planta
pD=s^2+0.3406*s+0.02155;%Denominador planta
% Planta=tfcollec(pN,pD),5);%Planta
PolNum=vpa(collect(pidN*pN,s),5)
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)%Polinomio planta*controlador retroalimentacion
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5);
%Polinomio Deseado
beta=5;
zeta=0.95;
wn=0.102;
wn2=wn^2;
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^1;%Polinomio deseado
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4)],5)
%Resolver sistema
S = solve(eqns1,[kd kp ki ]);
kd=eval(S.kd)
kp=eval(S.kp)
ki=eval(S.ki)
    
