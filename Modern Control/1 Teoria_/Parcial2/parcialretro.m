% clear all
% ft=tf([10],[1 5 6])
syms w t u
tp=w
wp=-0.2*w^2-10*sin(t/2)+20*u
x=[t w]
A=jacobian([tp;wp],x)
B=jacobian([tp;wp],u)
y=t;
C=jacobian(y,x)
D=jacobian(y,u)

w=0;
t=0.523599;
wp=eval(wp)
u=solve(wp==0,u)%U=0.1294
A=eval(A);
B=eval(B);
C=eval(C);
D=eval(D);
Afco=double(A)
Bfco=double(B)
Cfco=double(C)
Dfco=double(D)



% S=[B A*B]
% detCtrl=det(S)
% 
% O=[C;C*A]
% detObsrv=det(O)

% num=1.3333;
% den=[1 20.83 16.83 3.33];
% ft=tf(num,den)
% [Afco,Bfco,Cfco,Dfco]=tf2ss(num,den)
ee=ss(Afco,Bfco,Cfco,Dfco)
FTfco=tf(ee)  
step(ee)
hold on
% step(ee)
% S=[Bfco Afco*Bfco]
% detCtrl=det(S)
%Asignacion de polos
syms k1 k2 ki ki2 s
K=[k1 k2]
Aa=[Afco-Bfco*K Bfco*ki2 Bfco*ki; zeros(1,2) 0 1;-Cfco 0 0 ]
SI=s*eye(4)
PC=collect(det(SI-Aa),s)
%PARAMETROS DE DISEÑO
beta=5
tsd=10
cd=0.9%como hicimos que el sistema sea mas rapido que en lazo abierto debe ser subamortiguado pero no muchito 
wnd=4/(cd*tsd)
PD=conv([1 2*cd*wnd wnd^2],[1 beta*cd*wnd]);
PD=conv(PD,[1 beta*cd*wnd]);
% PD=vpa(PD,5)
d1s=fliplr(coeffs(PC,s))
eqns1 = vpa([ PD(2)==d1s(2), PD(3)==d1s(3), PD(4)==d1s(4), PD(5)==d1s(5) ],5)
%Resolver sistema
Sol = solve(eqns1,[k1 k2 ki ki2]);
k1=eval(Sol.k1)
k2=eval(Sol.k2)
ki=eval(Sol.ki)
ki2=eval(Sol.ki2)

%Ackerman
% Ae=[Afco zeros(2,1) zeros(2,1);zeros(1,2) 0 1;-Cfco 0 0]
% Be=[Bfco;0;0]
% raices=roots(PD)
% Kacker=acker(Ae,Be,raices) % k1 k2 -ki2 -ki1

O=[Cfco;Cfco*Afco]
detObsrv=det(O)
%observador por matriz de transformacion L=Q*[alfan-an] pero Q IDENTIDAD
%observador el polinomio del observador debe ser de orden n -> n=#estados
tsdo=tsd/20
cdo=1
wndo=4/(tsdo*cdo)
PDO=[1 2*cdo*wndo wndo^2]
L=[PDO(3)-6; PDO(2)-5]%alfa2 - a2 ; alfa1 - a2 alfa=polinomio deseado a=DENOMINADOR FT = L1 L2

%Descubrimiento propio wnd debe ser cercano a wndo, para ello modifico cita
%o mucho mejor el tiempo de establecimiento deseado
%Lo mejor es hacer mucho mas rapido el tsdo
%para arreglarlo toco cambiar tiempo establecimiento deseado a 10 segundos
%y el del observador que sea 20veces mas rapido
wnd
wndo




