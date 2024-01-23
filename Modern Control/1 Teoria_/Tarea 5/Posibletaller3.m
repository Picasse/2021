clear
% A = [0 1; 0 -4]
% 
% B = [0;2]
% 
% C = [0 2]
% 
% contr = det(ctrb(A, B))
% observ = det(obsv(A, C))
% 
% %%======================================
% syms s
% num1 = [0 0 0 0 0 10]
% den1 = [1 4 9 10 0 0]
% 
% ft =  tf(num1, den1)
% 
% [A,B,C,D] = tf2ss(num1, den1)
% T = [0 0 0 0 1; 0 0 0 1 0; 0 0 1 0 0; 0 1 0 0 0; 1 0 0 0 0];
% [A,B,C,D] = ss2ss(A,B,C,D,T)
% Pc = ctrb(A, B)
% DetPc = det(Pc)
%%======================================
% num=[10]
% den=[1 0 0]
% den2=[1 2]
% den3=[1 2 5]
% G=tf(num,den)
% G1=tf(1,den2)
% G2=tf(3,den3)
% GC=(G*G1*G2)
% [numa,dena]=tfdata(GC,'v')
% [A,B,C,D]=tf2ss(numa,dena)
% a0=dena(1)
% a1=dena(2)
% a2=dena(3)
% a3=dena(4)
% a4=dena(5)
% a5=dena(6)
% b0=numa(1)
% b1=numa(2)
% b2=numa(3)
% b3=numa(4)
% M=[a4 a3 a2 a1 a0;a3 a2 a1 a0 0;a2 a1 a0 0 0;a1 a0 0 0 0;a0 0 0 0 0]
% S=ctrb(A,B)
% % Matriz de transformacion
% T=[S*M]
% O=obsv(A,C)
% Acc=inv(T)*A*T
% Bcc=inv(T)*B
% Ccc=C*T
% Q=inv(M*O)
% 
% Aco=inv(Q)*A*Q
% Bco=inv(Q)*B
% Cco=C*Q

%%======================================
%Controlador
r = [-2+2.73i; -2-2.73i; -20]
pol_des = poly(r)

num1 = [0 0 39];
den1 = [1 0 -98];

ft = tf(num1, den1)
[A,B,C,D] = tf2ss(num1, den1)

A_aux = [A [0;0]; -C 0]
B_aux = [B; 0]

p = roots(pol_des)
k = acker(A_aux, B_aux, p)
%Observador
r_obs = [-2000+3464.1016i;-2000-3464.1016i];
pol_des_obs = poly(r_obs);
P1 = roots(pol_des_obs)
L = acker(A', C', P1)'

%=======================================
%Polinomio de control

% syms kp ki kd s z
% 
% zeta = solve(0.10 == exp((z/((1-z^2)^(1/2)))*pi), z)
% 
% num = [0 0 39];
% den = [1 0 -98];
% F=tf(num,den)
% %stepinfo(F)
% [num,den]=tfdata(F,'v')
% 
% Pcontrol=collect(kp+ki/s+kd*s)
% PCON=vpa(collect((kd*s^2+kp*s+ki)*num(3)+s*(s^2+den(2)*s+den(3))))
% PC=fliplr(coeffs(PCON,s))
% 
% %Polinomio deseado
% cdp =  0.88
% cdp2 = 0.88%double(zeta(1))
% ts = 2
% wnp = 4/(ts*cdp)
% 
% PDp=conv([1 (2*cdp*wnp) wnp^2],[1 10*cdp2*wnp])
% 
% kd=solve(PC(2)==PDp(2))
% kp=solve(PC(3)==PDp(3))
% ki=solve(PC(4)==PDp(4))
% 
% kd=double(kd)
% kp=double(kp)
% ki=double(ki)
%=======================================
% syms z
% 
% r = [-2+2.73i; -2-2.73i; -20]
% pol_des = poly(r)
% 
% num1 = [0 0 39];
% den1 = [1 0 -98];
% zeta = solve(0.045 == exp((z/((1-z^2)^(1/2)))*pi), z)
% 
% % ft = tf(num1, den1)
% % [A,B,C,D] = tf2ss(num1, den1)
% 
% A = [0 1 0; 0 0 1; 0 -5 -6];
% B = [0; 0; 1];
% C = [1 0 0];
% 
% A_aux = [A [0;0;0]; -C 0]
% B_aux = [B; 0]
% 
% cdp= double(zeta(1))%0.8
% ts=3
% wnp=4/(ts*cdp)
% PDp=conv([1 (2*cdp*wnp) wnp^2],[1 5*cdp*wnp])
% PDp = conv(PDp, [1 5*cdp*wnp])
% 
% p = roots(PDp)
% k = acker(A_aux, B_aux, p)

% %Observador
% r_obs = [-2000+3464.1016i;-2000-3464.1016i];
% pol_des_obs = poly(r_obs);
% P1 = roots(pol_des_obs)
% L = acker(A', C', P1)'

%=======================================

% num1 = 0.025*[1 200];
% den1 = [1 5];
% ft = zpk(tf(num1, den1))
% 
% bode(ft)

%=======================================

% syms z
% 
% 
% 
% zeta = solve(10/100 == exp((z/((1-z^2)^(1/2)))*pi), z)
% 
% % ft = tf(num1, den1)
% % [A,B,C,D] = tf2ss(num1, den1)
% 
% A = [0 1 0; 0 0 1; 1 -5 -6];
% B = [0; 0; 1];
% C = [1 0 0];
% 
% A_aux = [A [0;0;0]; -C 0]
% B_aux = [B; 0]
% 
% cdp= double(zeta(1))%0.8
% ts=2.5
% wnp=4/(ts*cdp)
% PDp=conv([1 (2*cdp*wnp) wnp^2],[1 5*cdp*wnp])
% PDp = conv(PDp, [1 5*cdp*wnp])
% 
% p = roots(PDp)
% k = acker(A_aux, B_aux, p)
% 
% %Observador
% % r_obs = [-2000+3464.1016i;-2000-3464.1016i];
% % pol_des_obs = poly(r_obs);
% % P1 = roots(pol_des_obs)
% % L = acker(A', C', P1)'

%===================================