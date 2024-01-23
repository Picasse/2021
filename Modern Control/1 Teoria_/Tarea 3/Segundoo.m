%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd*s^2+kp*s+ki;
pidD=s;
pN=806071.43;
pD=s^2+357.14*s;
PolNum=collect(pidN*pN);
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=vpa(PolNum/PolDen,5)
%Polinomio Deseado
beta=5;
zeta=0.707 ;   %1/raiz2
wn=505.15;
wn2=wn^2;
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

%Error frente a entrada rampa
Pol=vpa(eval(Pol),5) %Multiplicacion de planta y control
ref=1/(s^2) %rampa
sxerror=(ref*s)  /  (1+Pol); %s por el error hay que sacarle limite a esto s->0
sxerror=vpa(    collect( sxerror,s)    ,5)
limit(sxerror,s,0,'right')
limit(sxerror,s,0,'left')
%El limite es infinito o es 0? infinito si reemplazo la s, es 0 si digo que
%el grado mayor esta en el denominador

