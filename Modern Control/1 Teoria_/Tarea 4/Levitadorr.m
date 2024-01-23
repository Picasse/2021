syms s  m g L IL R Vt c x v;
m=0.01; g=9.8; L=100e-3; R=10; c=   0.1; 
xp=v;
vp=( -(c*IL^2)/x   +m*g   )/m;
ilp=(   Vt-IL*R    )/L;
Estados=[x,v,IL]; %VECTOR DE ESTADOS
Entradas=[Vt]; %Vector de entradas 
A=jacobian([xp,vp,ilp],Estados)
y1=x; %este y1=q5;
B=jacobian([xp,vp,ilp],Entradas)
C=jacobian(y1,Estados)
D=jacobian(y1,Entradas)
%PUNTOS DE OPERACION
x=0.1;
% vp=eval(vp);
% IL1=solve(vp==0,IL);
% IL1=vpa(abs(IL1),5);
% IL=IL1(1)
IL=0.313
% ilp=eval(ilp);
% Vt=solve(ilp==0,Vt)
Vt=3.13

A=vpa(eval(A),5);A=double(A)
B=vpa(eval(B),5);B=double(B)
C=vpa(eval(C),5);C=double(C)
D=vpa(eval(D),5);D=double(D)
ee=ss(A,B,C,D);
ft=tf(ee)
roots([ 1 100 -97.97 -9797 ])



