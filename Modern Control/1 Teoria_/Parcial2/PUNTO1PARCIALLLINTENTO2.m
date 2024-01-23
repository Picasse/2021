%COEFICIENTES DE UNA RETRO DE ESTADOS USANDO ASIGNASION DE POLOS
%MATRICES DEL ESPACIO DE ESTADOS
syms k1 k2 ki s
A=[0 1;0 -0.4]
B=[0;8]
C=[8 0]
D=0
% ee=ss(A,B,C,D);
% ft=tf(ee)%FUNCION DE TRANSFERENCIA
%FORMA CANONICA CONTROLABLE
S=[B A*B] %Matriz de controlabilidad n-1 =2
Determinante=det(S) %Determinante distinto de zero es controlable
k=[k1 k2 ] %n=3 k1,2,3
Aasterisco=[A-B*k B*ki;-C 0]%Esto sale de un analisis ni el hp
Polinomio=det(s*eye(3)-Aasterisco)
d1s=coeffs(Polinomio,s)%Coeficientes Polinomio s^0 s^1 s^2 s^3 s^n

%Hallar beta y zeta
syms c mp s w
% format float
% mp=exp(  -(c*pi)/(sqrt(  1-c^2 ))  )
mp=0.025;%maximo sobre impulso
ts=7;%tiempo de establecimiento
c=solve(exp(  -(c*pi)/(sqrt(  1-c^2 ))  )-mp==0,c);%despejar cita
c=abs(double(c));
ci=abs(c(2))%Hallar cita
w=4/(ts*ci)%Hallar omega

%Polinomio Deseado
beta=10; %beta debe ser minimo 10
zeta=ci; %0.5912;
wn=w;%0.8458;
% wn2=wn^2
PDgeneral=(s^2+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^1;
PDgeneral=vpa(  collect(PDgeneral,s)  ,5)
d2s=vpa(coeffs(PDgeneral,s),5)%Coeficientes Polinomio Deseado s^0 s^1 s^2 s^3 s^n
%Sistema Ecuaciones 
eqns1 = vpa([d1s(1) == d2s(1),d1s(2) == d2s(2),d1s(3) == d2s(3),d1s(4) == d2s(4)],5)
%Resolver sistema
Sol = solve(eqns1,[ki k1 k2]);
ki=eval(Sol.ki)
k1=eval(Sol.k1);
k2=eval(Sol.k2);
k=eval(k)%Evaluamos el vector k


%FORMA CANONICA OBSERVABLE
% O=[C;C*A]
% Q=inv(M*O)
% Afco=inv(Q)*A*Q
% Bfco=inv(Q)*B
% Cfco=C*Q
% Dfco=D
%Ackerman
% Afcc2=[0 1;3 0] 
% Bfcc2=[0;1]
% phiA=Afcc2^2+8*Afcc2+16*eye(2)
% S2=[Bfcc2 Afcc2*Bfcc2]
% K=[0 1]*inv(S2)*phiA