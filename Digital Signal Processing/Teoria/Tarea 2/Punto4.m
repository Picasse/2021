n=0:100;
w=pi/6;
A=1;
A7=0.3;
A2=1;
A3=1;
A4=0.2;
A5=0;
A6=0;
xn=(A5*(A3.^n)-A6*(-A4).^n)*1+A*(cos(w/3)+A2*1i*sin(w/3)).^n+A7*(cos(2*w/3)-A2*1i*sin(2*w/3)).^n; %*u(n) es tomar los valores positivos
figure('Name','Parte real')
stem(n,real(xn))
% figure('Name','Parte imaginaria')
% stem(n,imag(xn))
