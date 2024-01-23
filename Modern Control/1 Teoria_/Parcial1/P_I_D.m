clear all
syms s kp ki ki2 ki3 kd kd2 kd3;
pidN=kp*s+ki+kd*s^2+kd2*s^3
pidD=s
pN=0.1111
pD=1*s^3+12.71*s^2+23.78*s+66.67
PolNum=collect(pidN*pN)
PolDen=vpa(collect(pidD*pD+pidN*pN,s),5)
cd=0.7;
wnd=2;
% tsd=1;
% wnd=4/(  tsd*(       cd -sqrt(cd^2-1)       )  )
format long
PD=[1     2*cd*wnd     wnd^2];
PD=conv([PD],[1 5*cd*wnd]); %el 1x10^n multiplica a todo el vector
PD=conv([PD],[1 5*cd*wnd])

