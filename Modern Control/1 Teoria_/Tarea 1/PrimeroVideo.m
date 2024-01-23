syms s k x3 m x1 R L; %PERFECTISIMOOOOOOOO
 m=0.2; g=9.8; L=10; R=10; k=2; x1=0.05; x3=0.221; vt=2.21;
%Respuesta al escalon por espacio de estados
A=[               0                     1          0;
         (k*x3^2)/(m*x1^2)        1      -(2*k*x3)/(m*x1);
                    0                     0           -R/L               ];
B1=[  0;  0;  1/L ];
C=[1 0 0];    
D=[0];

% A=eval(A);
% B1=eval(B1);
SI=s*eye(3);
ft2sinreemplazar=C*inv(SI-A)*B1+D;
ft2sinreemplazar=collect(simplify(ft2sinreemplazar));%Funcion de transferencia sin reemplazar obtenida por EE
pretty(ft2sinreemplazar);
step([-2210],[250 -49091 -48841])