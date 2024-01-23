Planta 
$$
F_s(s)=\frac{0.5}{s^3+2s^2+2s+1}
\\para\space controlar\space escalon
\\para\space error\space en\space estado\space estable\space igual\space a\space cero\space se\space agrega\space un\space integrador
\\F_s(s)=\frac{0.5}{(s^3+2s^2+2s+1)s}
\\Realizando\space el\space lazo\space cerrado
\\F_s(s)=\frac{0.5}{s^4+2s^3+2s^2+s+0.5}
\\polos\space que \space tengo:
\\-0.8931 \pm 0.6360i
\\-0.1069 \pm 0.6360i
\\T_sdeseado=90\% T_s\space Lazo \space abierto
\\T_s=6.64seg
\\T_sdeseado=5.9760seg
\\ \zeta_{deseado}=0.8
\\ \omega_{deseado}=\frac{4}{\zeta_{deseado}*Ts_{deseado}}
\\ \omega_{deseado}=0.8367rad/s
\\Polinomio\space Deseado
\\p_d=s^2+1.3387s+0.7001
\\Polos\space polinomio\space deseado
Lavando la losa vuelvo en 10





  


  
$$
Compensador de adelanto ya que se quiere que la respuesta del sistema sea mas rápida.
$$
G_c(s)=\frac{K_C(1+\frac{1}{T_s})}{s+\frac{1}{\alpha T_s}}
$$
