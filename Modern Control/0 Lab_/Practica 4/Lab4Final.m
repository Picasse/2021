%%% LAB 4 %%%%%%%%%
%%%%%   Plantear modelo y FT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms S s B2 P R1 R2 Ra La M vin ia iap x1 x1p Kw
syms Km RL LJ RJ LB RB Ka

planta= (-B2*P*R1*Km)/((s^2*60*M*R2)*(LJ*s^2+(RJ+LB)*s+(RB+Km*Ka)))
% planta= (P*R1*Km)/((s*60*R2)*(LJ*s^2+(RJ+LB)*s+(RB+Km*Ka)))
collect(planta,s)
[n, d] = numden(simplify(planta));
d=collect(d,s);
d=coeffs(d,s);
grado=5
%%%%%%% constantes y P.Operacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B2=2;P=60;R1=5;R2=10;Ra=100;La=1e-3;M=0.1;Kw=1;
Km=1;RL=1;LJ=1;RJ=1;LB=1;RB=1;Ka=1;


%%%%%%%%%%%%%%%%%%%%%%%% Calculos evaluando %%%%%%%%%%%%%%%%%%%%%%%%%%%
planta=vpa(collect(eval(planta)),3)% ft metodo 1
%planta=vpa(planta*(-1),3) %prefiltro machetazo
%%%%prefiltro
Ff=collect(simplify(eval(planta)));
[n, d] = numden(Ff);
d1=coeffs(d,s);
n1=coeffs(n,s);
temp=d1(end);
d=collect(d/temp);
n=n/temp;
F=n/d; %funcion despejada
planta=vpa(F,3)
ft1=tf(eval(n),eval([fliplr(coeffs(d)) 0]))
step(ft1)
stepinfo(ft1)


%%%%%% sacar valores para segundo orden %%%%

%%%%%%%%%%%%%%%%%%%%%%%%   Control %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms s kp ki kd G(s) f(s) ki2 ki3 kd2 kd3
%GC depende tipo de controlador
%Gc=collect(expand(kp+ki/s+kd*s+kd2*s^2),s)%PIDD
Gc=collect(expand(kp+ki/s+ki2/(s^2)+kd*s+kd2*s^2),s) %PID
Ys=f(s)*G(s)/(1+f(s)*G(s))
%%%%%%%%%%%%%%%%%%Gc Retroalimentacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=collect(simplify(planta*Gc/(1+planta*Gc)),s);
F=eval(F);
[n, d] = numden(F);
d1=coeffs(d,s);
temp=d1(end);
d1=collect(d/temp);
n=n/temp;
F=n/d1; %funcion despejada
Ys=vpa(F,3)
d1=vpa(coeffs(d1,s),3)
n1=coeffs(n,s);
%%%%%%%%%%%%%%%%%%%%%% Polinomio deseado canonico %%%%%%%%%%%%%%%%%%%%%%%
syms zeta wn s beta
gradopol=length(d1)-1

pd0=(s^2+2*zeta*wn*s+wn^2)*(s+beta*zeta*wn)^(gradopol-2)
pdeseado=collect(pd0,s)
d2s=coeffs(pdeseado,s);
%%%%%%%  ECUACIONES simbolicas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ecuaciones de acuerdo a incognitas y grado de polinomio deseado
eqns1 = d1==d2s;

ecuaciones1=vpa(eqns1.',5)
%%%%%%%%%%%%%%%%%%%%%%% valores pd deseados %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ts=15
%ts=0.95*tsteorico
zeta=0.95
beta=10 %dejar expresado o comentar linea si se quiere despejar
wn=4/(ts*zeta)
Mp=exp(-(zeta/(sqrt(1-zeta^2)))*pi)*100 %
%%%%%%%%%  ECUACIONES EVALUANDO zeta wm %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ecuaciones de acuerdo a incognitas y grado de polinomio deseado
eqns = eval(d1)==eval(d2s);

ecuacionesfull=vpa(eqns.',5)
%%%%%%%%%%%%%%%%%% solve equations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ki ki2 ki3 kp kd kd2 kd3 beta
incognitas=[ki ki2 kp kd kd2] %PID
S = solve(eqns,incognitas);%se agregan incognitas o beta en caso tal
ki=eval(S.ki)
ki2=eval(S.ki2)
kp=eval(S.kp)
kd=eval(S.kd)
kd2=eval(S.kd2)
%beta=eval(S.beta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SACAR FT y GRAFICAR %%%%%%%%%%%%%
Gc
Gcevaluada=vpa(eval(Gc),3)
planta
%%%%%%%DESPEJE FUNCION FINAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ff=collect(simplify(eval(F)));
[n, d] = numden(Ff);
d1=coeffs(d,s);
n1=coeffs(n,s);
temp=d1(end);
d=collect(d/temp);
n=n/temp;
F=n/d; %funcion despejada
Funcionfinal=vpa(F,3)
%%%%%%%%% GRAFICAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n1=double(n1/temp);
d1=double(d1/temp);
ft2=tf(fliplr(n1),fliplr(d1))
step(ft2)
info2=stepinfo(ft2)
rlocus(ft2)
polos2=vpa(roots(fliplr(d1)),3)








