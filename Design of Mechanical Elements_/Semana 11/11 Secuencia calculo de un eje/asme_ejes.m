Mxy=0 % momento flector plano xy
Mzy=0% momento flector plano zy
M=sqrt((Mxy^2)+(Mzy^2))% momento flector resultante
N=3 %factor de seguridad
Kt=1.8 %factor de concentracion de esfuerzo
Sn=54e3 %resistencia a la fatiga corregida
Sy=68e3 %resistencia a la fluencia
T=3150 % Momento torsor

D=((32*N/pi())*sqrt(((Kt*M/Sn)^2)+(0.75*(T/Sy)^2)))^(1/3)