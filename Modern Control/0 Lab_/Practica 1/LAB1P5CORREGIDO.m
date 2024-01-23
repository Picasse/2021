syms r1 r2 r3 c l ei il ec s;
ecp=(  il+ei/r3+(-8*ec-ec^3*r3)/(8*r3)  )/c;
ilp=(  ei-ec-il*r2  )/l;
x=[ec;il]; %vector de estados
A=jacobian([ecp; ilp],x);
B=jacobian([ecp; ilp],ei);
y=ei-ec;%Salida
C=jacobian(y,x);
D=jacobian(y,ei);   
SI=s*eye(2);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
ec=10; r1=10000; r2=150; r3=220; c=0.01; l=0.05; %Constantes
ftevaluada=eval(ftgeneral);%Funcion de transferencia con reemplazos
pretty(ftevaluada);
step([0.88 5940 9900000],[0.88 5940.4 9902960]);%Ftevluada copiada
% step(ftstep);
