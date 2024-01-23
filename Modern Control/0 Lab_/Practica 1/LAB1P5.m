   syms s r1 r2 r3 c l; %PERFECTISIMOOOOOOOO

%Respuesta al escalon por espacio de estados
A=[ (-r1-r3)/(c*r1*r3)       1/c;
       -1/l                         -r2/l  ];
B1=[1/(c*r3); 1/l ];
C=[-1 0];    
D=[1];
SI=s*eye(2);
ft2sinreemplazar=C*inv(SI-A)*B1+D;
ft2sinreemplazar=collect(simplify(ft2sinreemplazar));%Funcion de transferencia sin reemplazar obtenida por EE
pretty(ft2sinreemplazar);
r1=100;
r2 =350;
r3=50;
c=0.01;
l=0.03;
A=eval(A);
B1=eval(B1);
[num,den]=ss2tf(A,B1,C,D);
ft3=tf(num,den)%Funcion de transferencia reemplazando obtenida por EE
%step(ft3); %respuesta al escalon solo sistemas lineales
% rlocus(ft2);
