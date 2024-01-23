close all
syms s m l g fa t1 t2 k1 w1 w2

w1p=(  1.5*fa*l*cos(t1)   -1.5*m*g*l*sin(t1)   -k1*l*l*( sin(t1)-sin(t2) )*cos(t1)  )/(m*l*l);
w2p=(  -m*g*l*sin(t2)   +k1*l*l*( sin(t1)-sin(t2) )*cos(t2)   )/(m*l*l);
t1p=w1;
t2p=w2;
x=[w1;w2;t1;t2];%Estados
A=jacobian([w1p;w2p;t1p;t2p],x)
B=jacobian([w1p;w2p;t1p;t2p],fa)
y=t2;%Salida t2
C=jacobian(y,x)
D=jacobian(y,fa)
%Ft general
ftgen=collect(expand(C*inv(s*eye(4)-A)*B+D),s);
pretty(ftgen)

%Ft con Constantes-------------------------------------------------------------
m=0.5; l=1; g=9.81; k1=200; 
w1p=eval(w1p);
w2p=eval(w2p);
%Puntos de operacion
t2=0.523599;%30grados
t1A=solve(w2p==0,t1);
t1=t1A(1); t1=eval(t1)
faA=solve(w1p==0,fa);
fa=faA(1); fa=eval(fa)

 A=double(eval(A)); 
 B=double(eval(B)); 
 C=double(eval(C)); 
 D=double(eval(D));
 
[num,den]=ss2tf(A,B,C,D);
ftnum=tf(num,den)
figure('Name','Respuesta al escalon')
step(ftnum); 
ylabel('Temperatura t1')
xlabel('Tiempo')

