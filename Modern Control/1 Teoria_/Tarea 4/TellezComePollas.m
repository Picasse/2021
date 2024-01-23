clear
syms s x2 g x3 L U c m x1 r c

x1p = x2
x2p = g-((c*x3^2)/(m*x1))
x3p = -(r/L)*x3+(1/L)*U
est = [x1 x2 x3];
y = [U];
A=jacobian([x1p, x2p, x3p],est)
B=jacobian([x1p, x2p, x3p],y)
C=jacobian(x1,est)
D=jacobian(x1,y)


SI=s*eye(3);
ftgeneral=C*inv(SI-A)*B+D;

ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);

%---------------------------------------
c=0.1; 
g=9.8;
L=100e-3;
r=10;
m=0.01;
%Puntos de operación
x1=0.1; %Posición de la bola.
x2=0;   %velocida de la bola
x3= 0.313;     %Corriente en la bobina 
U = 3.13;
%----------------------------------------

A=eval(A); %A = double(A);
B=eval(B); %B = double(B);
C=eval(C); %C = double(C);
D=eval(D); %D = double(D);
ft=C*inv(SI-A)*B+D
ft=simplify(ft)
ee=ss(A,B,C,D)
ft=tf(ee)
step(ft)