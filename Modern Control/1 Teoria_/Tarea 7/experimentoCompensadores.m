clear %lineas 4 5 6 10 12 13 17
format compact
syms s kc S
GInt=(5)/(s^2+2*s)%planta CON INTEGRADORES NECESARIOS
Glcnum=5;%numerador planta lazo cerrado CON INTEGRADORES NECESARIOS
Glcden=s^2+2*s+5;%denominador  planta lazo cerrado CON INTEGRADORES NECESARIOS
Glc=Glcnum/Glcden%funcion de transferencia en lazo cerrado
polo=roots( fliplr(coeffs(Glcden)) );%polos de transferencia en lazo cerrado
VerPolos=vpa(polo)
polo=polo(2);%poner el polo que tenga la parte imag positiva hallado en la linea anterior
magPolo=abs(polo)%magnitud polo
tsd=3.74 %como es una planata termica se demora media hora :V
cd=0.3568%como hicimos que el sistema sea mas rapido que en lazo abierto debe ser subamortiguado pero no muchito 
wnd=4/(cd*tsd)
PD=[1 2*cd*wnd wnd^2]
raices=roots(PD)
s=raices(1)%raiz positiva del polinomio
poloPDevaluado=eval(Glc)%evaluamos s=-0.8000 + 0.3875i en la ft en lazo cerrado
angulo=atan2d(imag(poloPDevaluado),real(poloPDevaluado));
totalphi=180-(-angulo)%angulo total a compensar
nCompDec=totalphi/60;%calcula el numero decimal de compensadores necesarios
nCompEnt=ceil(nCompDec)%calcula numero entero de compensadores necesarios
phi=totalphi/nCompEnt%angulo a compensar menor a 60
phiMed=phi/2%phi medios
%Hallar ubicacion del cero
one=atan2d(imag(polo),real(polo));
% VerOne=vpa(one)
two=180-one;
% VerTwo=vpa(two)
tree=two/2;
% VerTree=vpa(tree)
four=tree-phiMed;
% VerFour=vpa(four)
five=180-(one+four);
% VerFive=vpa(five)
UbiCero=sind(four)*magPolo/sind(4);
VerUbiCero=vpa(UbiCero)
%Hallar ubicacion del polo
seven=four+phi;
% VerSeven=vpa(seven)
eight=180-(seven+one);
% VerEight=vpa(eight)
UbiPolo=sind(seven)*magPolo/sind(eight);
VerUbiPolo=vpa(UbiPolo)
%Hallar Kc
T=1/UbiCero;
VerT=vpa(T)
Alfa=1/(T*UbiPolo);
VerAlfa=vpa(Alfa)
if (Alfa>0)&&(Alfa<=1)
    disp('COMPENSADOR ADELANTO')
elseif (Alfa>1)
    disp('COMPENSADOR ATRASO')
end
Comp=kc*(S+UbiCero)/(S+UbiPolo);%S mayuscula para que no se reemplaze el polo deseado SOLO PARA VERLO XD
VerComp=vpa(Comp,3)
comp=kc*(s+UbiCero)/(s+UbiPolo);%Este si se reemplaza y se multiplica xd
GInt=eval(GInt);
kc=solve(abs(GInt*comp)==1,kc);% | plantaINT*compensadorKC | =1 en s=polo deseado, despeja kc
VerKc=vpa(kc,5)
kcn=kc^(nCompEnt);
VerKcn=vpa(kcn)
VerUbiCero
VerUbiPolo
kcn=double(kcn);UbiCero=double(UbiCero);UbiPolo=double(UbiPolo);kc=double(kc);
disp('SIMULINK -> kc & compensador & planta & integrador(En caso de que se necesite)')














