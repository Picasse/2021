Modelado de LaGrange:
$$
T = \frac{1}{2}mv^2=\frac{1}{2}m(\dot x^2+\dot y^2)\\
x = lsin(\theta)\\
y = lcos(\theta)+Asin(\omega t)\\
\dot x = sin(\theta) \dot l + l sin(\theta) \dot \theta\\
\dot y = cos(\theta) \dot l - l sin(\theta) \dot \theta+A\omega sin(\omega t)
$$
Energía cinética:
$$
T = \frac{1}{2}m[\dot l^2+l^2\dot \theta^2+(A\omega sin(\omega t))^2+2A\omega cos(\omega t)[cos(\theta)\dot l-l sin(\theta) \dot \theta]]
$$
Energía potencial:
$$
V_g = mgy\\
V_m = \frac{1}{2}K[l-l_0]^2\\
V = V_m+V_g = \frac{1}{2}K[l-l_0]^2+mg[lcos(\theta)+Asin(\omega t)]
$$
Lagrangiano:
$$
\frac{1}{2}m[\dot l^2+l^2\dot \theta^2+(A\omega sin(\omega t))^2+2A\omega cos(\omega t)[cos(\theta)\dot l-l sin(\theta) \dot \theta]]-\frac{1}{2}K[l-l_0]^2-mg[lcos(\theta)+Asin(\omega t)]
$$
Ecuación 1:
$$
\frac{\partial L}{\partial\theta}= -mA\omega cos(\omega t)[sin(\theta)\dot l + l cos(\theta) \dot\theta]+mglsin\theta\\
\frac{\partial L}{\partial \dot\theta} = ml^2\dot\theta - mA\omega cos(\omega t)lsin(\theta)\\
\frac{d}{dt}[\frac{\partial L}{\partial \dot \theta} = ml^2\ddot\theta+2ml\dot l\dot\theta+mA\omega^2sin(\omega t)lsin(\theta)-mA\omega cos(\omega t)[\dot l sin\theta+lcos\theta \dot \theta]]\\
l\ddot\theta+2\dot l\dot\theta+[A\omega^2sin(wt)-g]sin(\theta) =FL
$$
Ecuación 2:
$$
\frac{\partial L}{\partial l} = ml\dot\theta^2-mA\omega cos(\omega t)sin(\theta)\dot\theta-K[l-l_o]-mgcos(\theta)\\
\frac{\partial L}{\partial \dot l}= m\dot l+mA\omega cos(\omega t)cos(\theta)\\
\frac{d}{dt}[\frac{\partial L}{\partial\dot l}]= m\ddot l-mA\omega^2sin(\omega t)cos(\theta)-mA\omega cos(\omega t)sin(\theta)\dot \theta\\
\ddot l-l\dot\theta^2+\frac{K}{m}[l-l_o]+[g-A\omega^2sin(\omega t)]cos\theta = 0
$$
Ecuaciones:
$$
l\ddot\theta+2\dot l\dot\theta+[A\omega^2sin(wt)-g]sin(\theta) = Fl\\
\ddot l-l\dot\theta^2+\frac{K}{m}[l-l_o]+[g-A\omega^2sin(\omega t)]cos\theta = 0
$$
