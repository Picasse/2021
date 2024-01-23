syms s m1 m2 m3 g k1 k2 k3 k4 b1 b2 x1 x2 x3 x1p x2p x3p x1pp x2pp x3pp fa;
m1=0.2; m2=0.5; m3=0.3; g=9.81; k1=100; k2=150; k3=50; k4=110; b1=20; b2=50;
x1pp=(  -k1*(x1-x2)-2*b1*(x1p-x3p)+m1*g  )/(m1);
x2pp= (  -2*b2*(x2p-x3p)-k2*(x2-x3)+k1*(x1-x2)+m2*g  )/(m2);
x3pp=(  2*b1*(x1p-x3p)+2*b2*(x2p-x3p)+k2*(x1-x3)-0.7*k4*x3-0.7*k3*x3-fa  )/(m3);
v1=x1p;
v2=x2p;
v3=x3p;
x=[x1p;x2p;x3p;x1;x2;x3]; %VECTOR DE ESTADOS
y=[fa]; %Vector de entradas 
A=jacobian([x1pp;x2pp;x3pp;v1;v2;v3],x)
y1=x1; %SALIDA x1
B=jacobian([x1pp;x2pp;x3pp;v1;v2;v3],y)
C=jacobian(y1,x)
D=jacobian(y1,y)
SI=s*eye(6);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
step([-2000 400000 -2000000 -2000000 -1500000],[3 2600 405620 2448000 47870000 224000000 168000000])