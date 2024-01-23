close all
syms s m k1 b k2 km kw r Ra La ia v x vin

v1p=(  -(k1+k2)*x  -b*v*v  +km*ia/r )/(m);
iap=(  -Ra*ia -kw*v/r +vin  )/(La);
xp=v;

Estados=[v;ia;x];%Estados
A=jacobian([v1p;iap;xp],Estados)
B=jacobian([v1p;iap;xp],vin)
y=x;%Salida t2
C=jacobian(y,Estados)
D=jacobian(y,vin)
%Ft general
ftgen=collect(expand(C*inv(s*eye(3)-A)*B+D),s);
pretty(ftgen)

%Ft con Constantes-------------------------------------------------------------
m=0.5; k1=1; k2=2; km=0.05; kw=0.03; r=1; Ra=10; La=0.9; b=0.4;%xd
v1p=eval(v1p);
iap=eval(iap);
%Puntos de operacion
x=1;
v=1;

ia=solve(v1p==0,ia);
% t1=t1A(1); 
ia=eval(ia)
vin=solve(iap==0,vin);
% fa=faA(1);
vin=eval(vin)

 A=double(eval(A)); 
 B=double(eval(B)); 
 C=double(eval(C)); 
 D=double(eval(D));
 
[num,den]=ss2tf(A,B,C,D);
ftnum=tf(num,den)
figure('Name','Respuesta al escalon')
step(ftnum); 
ylabel('Posicion x1')
xlabel('Tiempo')

