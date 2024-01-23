% clear all
% % ft=tf([10],[1 5 6])
A=[-0.8468   -0.0005;54.4218   -7.6617]
B=[0;8.3264]
C=[0 1]
D=[0]
ee=ss(A,B,C,D)
FTfco=tf(ee)
% bode(FTfco)
% step(ee)
% hold on
% step(ee)
S=[B A*B]
detCtrl=det(S)
%Asignacion de polos
syms k1 k2 ki ki2 s
K=[k1 k2]
Aa=[A-B*K B*ki; -C 0 ]
SI=s*eye(3)
PC=collect(det(SI-Aa),s)
%PARAMETROS DE DISEÑO
beta=5
tsd=3 %como es una planata termica se demora media hora :V
cd=0.9%como hicimos que el sistema sea mas rapido que en lazo abierto debe ser subamortiguado pero no muchito 
wnd=4/(cd*tsd)
PD=conv([1 2*cd*wnd wnd^2],[1 beta*cd*wnd]);
% PD=conv(PD,[1 beta*cd*wnd]);
% PD=vpa(PD,5)
d1s=fliplr(coeffs(PC,s))
eqns1 = vpa([ PD(2)==d1s(2), PD(3)==d1s(3), PD(4)==d1s(4) ],5)
%Resolver sistema
Sol = solve(eqns1,[k1 k2 ki ]);
k1=eval(Sol.k1)
k2=eval(Sol.k2)
ki=eval(Sol.ki)

%Ackerman
% Ae=[A zeros(2,1) zeros(2,1);zeros(1,2) 0 1;-C 0 0]
% Be=[B;0;0]
% raices=roots(PD)
% Kacker=acker(Ae,Be,raices) % k1 k2 -ki2 -ki1

O=[C;C*A]
detObsrv=det(O)
%observador por matriz de transformacion L=Q*[alfan-an] pero Q IDENTIDAD
%observador el polinomio del observador debe ser de orden n -> n=#estados
tsdo=tsd/20
cdo=1
wndo=4/(tsdo*cdo)
PDO=[1 2*cdo*wndo wndo^2]
L=[PDO(3)-(6.513); PDO(2)-8.508]%alfa2 - a2 ; alfa1 - a1          alfa=polinomio deseado a=DENOMINADOR FT = L1 L2

%Descubrimiento propio wnd debe ser cercano a wndo, para ello modifico cita
%o mucho mejor el tiempo de establecimiento deseado
%Lo mejor es hacer mucho mas rapido el tsdo
%para arreglarlo toco cambiar tiempo establecimiento deseado a 10 segundos
%y el del observador que sea 20veces mas rapido
wnd
wndo


%xd

