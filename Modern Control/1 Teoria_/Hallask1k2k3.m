%lineas 4 5 6 7 8 14 15 16 17 parabola
clear all
format short
syms s k1 k2 k3 zeta wn beta;
%roots([1 48 365.8 1831.4])
PolDen=s^3+ (10*k3+100)*s^2+(-626*k2-98)*s+(-626*k1-980*k3-9800)*s^0
d1s=vpa(coeffs(PolDen,s),5)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
%Polinomio Deseado
% beta=5;
% zeta=0.95;
% wn=0.102;
% wn2=wn^2
%PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^1;%Polinomio deseado
% PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
PDgeneral=s^3+48*s^2+365.8*s+1831.4
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4)],5)
%Resolver sistema
S = solve(eqns1,[k1 k2 k3]);
k1=eval(S.k1)
k2=eval(S.k2)
k3=eval(S.k3)
