close all
syms s qi c1 c2 ta t1 t2 r1 r2;
q1=(t1-ta)/r2;
q2=(t1-t2)/r1;
q3=(t2-ta)/r2;
t1p=(qi-q1-q2)/c1;
t2p=(q2-q3)/c2;
x=[t1;t2];
A=jacobian([t1p;t2p],x)
B=jacobian([t1p;t2p],qi)
y=t2;
C=jacobian(y,x)
D=jacobian(y,qi)
%Ft general
ftgen=collect(expand(C*inv(s*eye(2)-A)*B+D),s);
pretty(ftgen)

%Ft con Constantes-------------------------------------------------------------
c1=4.18; c2=4.18;  r2=2.85; r1=2.77; ta=293;
t1p=eval(t1p);
t2p=eval(t2p);
%Puntos de operacion
t2=310;
t1=solve(t2p==0,t1); t1=eval(t1)
qi=solve(t1p==0,qi); qi=eval(qi)

 A=double(eval(A)); 
 B=double(eval(B)); 
 C=double(eval(C)); 
 D=double(eval(D));
 
[num,den]=ss2tf(A,B,C,D);
ftnum=tf(num,den)
figure('Name','Respuesta al escalon')
step(ftnum); 
ylabel('Temperatura t2')
xlabel('Tiempo')


%Respuesta transitoria SOLO CITA>1 PAG 181 OGATA
% syms wn cita
% wn=7.071;
% cita=0.8;
% t=0:0.01:4;
% rt=1-exp(  -( cita-sqrt(cita^2-1) )*wn*t  );
% figure('Name','Respuesta transitoria')
% plot(t,rt);
% ylabel('Temperatura t1')
% xlabel('Tiempo')







