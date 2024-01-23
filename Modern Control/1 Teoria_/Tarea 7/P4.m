%lineas 4 5 6 7 8 14 15 16 17
clear all
format short
syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta;
pidN=kd*s^2+kp*s+ki;
pidD=s;
pN=7.05045;
pD=s^2+8.508*s+6.515;
PolNum=collect(pidN*pN);
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
d1s=coeffs(PolDen,s)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n
Pol=PolNum/PolDen;
%Polinomio Deseado
beta=5
zeta=0.9
wn=1.481481481481481
wn2=wn^2
PDgeneral=(s*s+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^1;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones PID
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3)],5)
%Resolver sistema
S = solve(eqns1,[ki kp kd]);
%pid continuo
ki=eval(S.ki)
kp=eval(S.kp)
kd=eval(S.kd)

%Pid continuo discretizado
PID=tf([kd kp ki],[1 0])
tm=6/300
PIDz=c2d(PID,tm,'tustin')
numPID = PIDz.num{1}
denPID = PIDz.den{1}

% format long
% PD=[1     2*cd*wnd     wnd^2];
% PD=conv([PD],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
% % PD=conv([PD],[1 5*cd*wnd])

%xd

