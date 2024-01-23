%%% LAB 4 %%%%%%%%%
%%%%%   Plantear modelo y FT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms S s B2 P R1 R2 Ra La M vin ia iap x1 x1p Kw
syms Km RL LJ RJ LB RB Ka

planta= (-B2*P*R1*Km)/((s^2*60*M*R2)*(LJ*s^2+(RJ+LB)*s+(RB+Km*Ka)))
% planta= (P*R1*Km)/((s*60*R2)*(LJ*s^2+(RJ+LB)*s+(RB+Km*Ka)))
collect(planta,s)
[n, d] = numden(simplify(planta));
% step(n,d)
d=collect(d,s);
d=coeffs(d,s);
grado=5
%%%%%%% constantes y P.Operacion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B2=2;P=60;R1=50;R2=100;Ra=100;La=1e-3;M=0.1;Kw=1;
Km=1;RL=1;LJ=1;RJ=1;LB=9;RB=1;Ka=1;


%%%%%%%%%%%%%%%%%%%%%%%% Calculos evaluando %%%%%%%%%%%%%%%%%%%%%%%%%%%
planta=vpa(collect(eval(planta)),3)% ft metodo 1