clear
syms s M g Jb R x3 x2 x1
% pert = 0; %perturbaci�n.
g=-9.81; M = 0.02; Jb = 1e-6; R = 0.01; J = 0.02;

x1p = x2
x2p = (-1/(  (Jb/R^2)+M  )   )*M*g*sin(x3)

Est=[x1, x2]; %VECTOR DE ESTADOS
In=[x3]; %Vector de entradas 
A=jacobian([x1p, x2p],Est)
Out=x1; %Salida teta
B=jacobian([x1p, x2p],In)
C=jacobian(Out,Est)
D=jacobian(Out,In)
x3=0;
A = double(eval(A))
B = double(eval(B))
C = double(eval(C))
D = double(eval(D))
% %Despeje de puntos de operaci�n

%Estabilidad escal�n
A_aux=[  A [0; 0]; -C 0  ]
B_aux=[   B;0  ]

PolDes = roots([1 9.6 14.106 10.45])

% K=acker(A_aux, B_aux, PolDes)

Co = ctrb(A_aux, B_aux)
phi = 1*A_aux^3 + 9.6*A_aux^2+ 14.106*A_aux +10.45*eye(3)

K = vpa([0 0 1]*inv(Co)*phi, 5)

Kp = vpa(place(A_aux, B_aux, PolDes))
acker(A_aux, B_aux, PolDes)

%OBSERVADORES

tso=0.025;%tiempo de respuesta 10 veces mas rapido
wndo=4/(tso*0.5)%Hallar omega
PolDesObs=[1    2*0.5*wndo     wndo^2]
Phiobs = 1*A^2 + 320*A+ 102400*eye(2)
O = obsv(A, C)
det(O)
L1=Phiobs*inv(O)*[0;1]