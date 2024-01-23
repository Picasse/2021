



![img](https://lh6.googleusercontent.com/g4AgaK-sc-uzyKrsgzWCpBiD-5rwwg9w0JtszVoyEPjMnKcUuHPOldJ8eccX4m-a-RDrRdkcGl621Tg0HTZW31gsDeF1K5fZO1z6gnsoJL27uam4faPOGsK155Fb3w)
$$
G(s)=\frac{0.2392s+0.04074}{s^2+0.3406s+0.02155}
\\Expresando\space el\space cero\space en\space la\space forma\space estandar
\\G(s)=\frac{0.2392(s+0.1703)}{s^2+0.3406s+0.02155}
\\El\space prefiltro\space seria
\\P_f=\frac{0.1703}{s+0.1703}
\\Multiplicando\space por\space el\space prefiltro
\\ G(s)*P_f=\frac{0.2392(s+0.1703)}{s^2+0.3406s+0.02155}*\frac{0.1703}{s+0.1703}
\\ G(s)*P_f=\frac{0.2392*0.1703}{s^2+0.3406s+0.02155}
\\ G(s)*P_f=\frac{0.04073576}{s^2+0.3406s+0.02155}
$$

****

pControl PID
$$
\\ G(s)=\frac{0.04073576}{s^2+0.3406s+0.02155}
\\G_c(s)=\frac{Kds^4+kps^3+kis^2+ki2s+ki3}{s^3}
\\planta por controlador
\\G(s)*G_c(s)=\frac{0.02kds^4+0.02kps^3+0.02kis^2+0.02ki2s+0.02ki3}{s^5+0.3406*s^4+0.02155s^3}
\\Multiplicando\space planta\space por\space controlador\space y\space\\ realizando\space la\space retroalimentacion\space negativa
\\ \frac{0.040736kds^4+0.0407kps^3+0.0407kis^2+0.0407ki2s+0.0407ki3}{s^5+(0.0407*kd + 0.34)*s^4 + (0.0407kp+0.021)s^3+0.0407kis^2+0.0407ki2s+ 0.0407ki3}
\\Polinomio deseado xd
\\Pol=\frac{\omega^2}{(s^2+2\zeta\omega s+\omega^2)(s+\beta\zeta\omega)^3}
\\pol=\frac{ 0.0104}{s^5 + 1.64s^4 + 0.996s^3 + 0.265s^2 + 0.0293s + 0.00118}
\\s^3 + 0.6783s^2 + 0.1043s + 0.0050407
\\s^0\rightarrow 0.040736ki3 == 0.0011833
\\s^1\rightarrow 0.040736ki2 == 0.029368
\\s^2\rightarrow 0.040736ki == 0.26533
\\s^3\rightarrow 0.040736kp + 0.02155 == 0.99631
\\s^4\rightarrow 0.040736kd + 0.3406 == 1.6473
\\s^5\rightarrow 1.0 == 1.0
\\kd =32.0775
\\kp =23.9289
\\ki = 6.5135
\\ki2 =0.7209
\\ki3 =0.0290
$$


para tetha 2
$$
G(s)=\frac{0.02066}{s^2+0.3406s+0.02155}
\\Multiplicando\space planta\space por\space controlador\space y\space\\ realizando\space la\space retroalimentacion\space negativa
\\ \frac{0.0266kds^4+0.0266kps^3+0.0266kis^2+0.0266ki2s+0.026ki3}{s^5+ (0.0266kd +0.3406)s^4 + (0.0266kp+0.02155)s^3+0.0266kis^2+0.0266ki2s+0.0266ki3}
\\Polinomio deseado xd
\\Pol=\frac{0.0075}{s^5+1.3954s^4+0.71486s^3+0.16126s^2+0.015119s +0.000516}
\\s^0\rightarrow\\s^5\rightarrow0.0266*ki3 == 0.000516
\\s^1\rightarrow0.0266*ki2 == 0.015119
\\s^2\rightarrow0.0266*ki == 0.16126
\\s^3\rightarrow0.0266*kp + 0.02155 == 0.71486
\\s^4\rightarrow0.0266*kd + 0.3406 == 1.3954
\\s^5\rightarrow1.0 == 1.0
\\kd =39.6526
\\kp =26.0644
\\ki =6.0625
\\ki2 =0.5684
\\ki3 =0.0194
$$


