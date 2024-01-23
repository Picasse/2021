syms c mp s w
mp=10/100;
ts=9;
c=solve(exp(  -(c*pi)/(sqrt(  1-c^2 ))  )==mp,c)
c=abs(double(c))
ci=abs(c(2))
w=4/(ts*ci)
% b=5
% DenPd= vpa( collect(   (s^2+2*ci*w*s+w^2)*(s+b*ci*w)^3  ,s) ,5)
% DenPd=expand(DenPd)
% DenPd=vpa(DenPd,5)
% k=b*w*ci+2*ci*w;
% a=(   ci*(w^3)*b   )/(3*k);
% mi=k*a+3*k-1;
% 
% a=vpa(a,5)
% k=vpa(k,5)
% mi=vpa(mi,5)


