close all
syms s  k b km r m l Ra kw ia v1 x1 vin

v1p=( -k*x1-b*v1+km*ia/r )/m;
iap=(  vin -ia*Ra -kw*v1/r )/l;
x1p=v1;
x=[v1;ia;x1];
A=jacobian([v1p;iap;x1p],x)
B=jacobian([v1p;iap;x1p],vin)
y=x1;
C=jacobian(y,x)
D=jacobian(y,vin)
%Ft general
ftgen=collect(expand(C*inv(s*eye(3)-A)*B+D),s);
pretty(ftgen)

%Ft con Constantes-------------------------------------------------------------
k=0.1; b=0.01; km=2; r=0.1; m=5; l=0.01; Ra=220; kw=3;
iap=eval(iap);
v1p=eval(v1p);
x1p=eval(x1p);
%Puntos de operacion
% x1=0.1;
% t1=solve(t2p==0,t1); t1=eval(t1)
% qi=solve(t1p==0,qi); qi=eval(qi)

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


%Respuesta transitoria SOLO CITA>1 PAG 181 OGATA
% syms wn cita
% wn=7.071;
% cita=1.4849;
% t=0:0.01:4;
% rt=1-exp(  -( cita-sqrt(cita^2-1) )*wn*t  );
% figure('Name','Respuesta transitoria')
% plot(t,rt);
% ylabel('Temperatura t1')
% xlabel('Tiempo')
% 
% syms x
% funcion=2000/(x^2+21*x+50);
% der2=diff(funcion,2);
% x=solv1e(der2==0,x);
% x=v1pa(ptox,5)
% ev1al(funcion)









% ------- Este es un programa MATLAB para encontrar el tiempo de subida,
% tiempo de pico, sobreelongación máxima, y tiempo de asentamiento del
% sistema de segundo orden y sistemas de orden superior -------
% ------- En este ejemplo se supone que zeta % 0.6 y wn %5 -------
% num =[50];
% den =[1 21 50];
% t=0:0.05:5;
% [y,x,t] = step(num,den,t);
% r= 1; 
% while y(r) < 1.0001
%     r =r +1; 
% end
% tiempo_subida = (r - 1)*0.005
%  
% [ymax,tp] =max(y);
% tiempo_pico = (tp - 1)*0.005
%  
% sobreelongacion_max =ymax-1;
%  
% s=1001; 
% while y(s) >0.98 && y(s) <1.02 
%     s = s - 1; 
% end
% tiempo_asentamiento =(s - 1)*0.005






