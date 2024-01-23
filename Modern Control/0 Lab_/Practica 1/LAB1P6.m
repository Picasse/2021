syms s r1 rf  c; %PERFECTISIMOOOOOOOO

%Respuesta al escalon por espacio de estados
A=[   (-r1-rf)/(c*r1*rf)   ];
B1=[  -1/(c*rf)  ];
C=[1];    
D=[1];
SI=s*eye(1);
ft2sinreemplazar=C*inv(SI-A)*B1+D;
ft2sinreemplazar=collect(simplify(ft2sinreemplazar));%Funcion de transferencia sin reemplazar obtenida por EE
pretty(ft2sinreemplazar);
r1=10;
rf =30;
c=0.001;
A=eval(A);
B1=eval(B1);
[num,den]=ss2tf(A,B1,C,D);
ft3=tf(num,den)%Funcion de transferencia reemplazando obtenida por EE
step(ft3); %respuesta al escalon
% rlocus(ft2);
% ftn=(-rf/r1)*(r1*c*s+1); %posible ft que esta bien pero esta raro
% pretty(ftn);