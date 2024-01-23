syms s kp ki ki2 ki3 kd kd2 kd3 zeta wn beta Kc k
Km=1; R1=0.2; P=0.001; L=1; J=0.0025; R=0.1; B=0.001; Ka=1; R2=0.8;
num=Km*R1*P
den=(  (L*J)*s^2  +(R*J+L*B)*s  +R*B+Km*Ka  )*(R2*60*s)
Planta=vpa(collect(num/den,s),5)
s=-8+6*j; %polo deseado
ft=(1/600)/(s^3+0.5*s^2+40.03*s+1/600)
angulo=atan2d(imag(ft),real(ft))
phi=180- angulo
Kc=vpa(solve( abs(    ( (Kc^5)*(1/600)*((s+2.17)^5) )/( (s^3+0.5*s^2+40.03*s)*((s+18.0788)^5) )    ) ==1,Kc),5)
%k=vpa(solve( abs(    ( k*((s+2.17)^5) )/( (s^3+0.5*s^2+40.03*s)*((s+18.0788)^5) )    ) ==1,k),5) %(Kc^5)*(1/600)
Kc^5









