syms s  M g teta tetap Torque r rp Jb J ;
M=0.041; g=9.8; J=0.473; Jb=3.69e-6;
vrp=(   -M*g*sin(teta)+M*r*tetap^2  )/(  (Jb/(r^2))+M  );
vr=rp;
wp=(  Torque-2*M*r*vrp*tetap-M*g*r*cos(teta)  )/(  M*r^2+J+Jb  );
w=tetap;
Estados=[vr;r;w;teta]; %VECTOR DE ESTADOS
Entradas=[Torque]; %Vector de entradas 
A=jacobian([vrp;vr;wp;tetap],Estados)
y1=r; %este y1=q5;
B=jacobian([vrp;vr;wp;w],Entradas)
C=jacobian(y1,Estados)
D=jacobian(y1,Entradas)
r=0.03; teta=0;tetap=0; Torque=0.012054; %PUNTOS DE OPERACION
A=eval(A);
B=eval(B);
SI=s*eye(4);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
% pretty(ftgeneral);

% A=eval(A);
% B=eval(B);
% C=eval(C);
% D=eval(D);
[num,den]=ss2tf(A,B,C,D);
ft3=tf(num,den);%Funcion de transferencia reemplazando obtenida por EE
step(ft3); %respuesta al escalon
rlocus(ft3)
%pendulo invertido
% step([-5.2966 -0.00099118],[1 7.437 -32.1141 -198.8038])