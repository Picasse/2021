syms s  m g L IL R Vt c x v;
m=0.2; g=9.81; L=10; R=10; c=2; 
xp=v;
vp=( -(c*IL^2)/x   +m*g   )/m;
ilp=(   Vt+IL*R    )/L;
Estados=[x,v,IL]; %VECTOR DE ESTADOS
Entradas=[Vt]; %Vector de entradas 
A=jacobian([xp,vp,ilp],Estados)
y1=x; %este y1=q5;
B=jacobian([xp,vp,ilp],Entradas)
C=jacobian(y1,Estados)
D=jacobian(y1,Entradas)
%PUNTOS DE OPERACION
x=0.05; IL=0.22; vt=2.2;
A=eval(A);
B=eval(B);
C=eval(C);
D=eval(D);
SI=s*eye(3);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
% step([-44],[5 -5 -968 968])
% % rlocus([-44],[5 -5 -968 968])