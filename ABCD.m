clc;
clear all
j=sqrt(-1);
vrl=220*10^3;
ir=(105-j*50.6);
y=j*930*10^(-6);
z=35+j*140;
%pfr=cos(angle(vrp)-angle(ir));
pfr = 0.9;

vrp = vrl/sqrt(3);
a = 1;
b = z;
c = 0;
d = 1;

verify = a*d-b*c
vsp = a*vrp+b*ir;
is = c*vrp+d*ir;

pfs = cos(angle(vsp)-angle(is));
pr = 3*vrp*ir*pfr;
ps = 3*vsp*is*pfs;

eff = (abs(pr)/abs(ps))*100;
vrpnl = vsp/a;
reg = (abs(vrpnl)-abs(vrp)/abs(vrp))*100;

//long
zc=sqrt(z/y);
a=cosh(sqrt(y*z));
b=zc*sinh(sqrt(y*z));
c=(1/zc)*sinh(sqrt(y*z));
d=a;

//medium pi
a=((y*z)/2)+1;
b=z;
c=y*(((y*z)/4)+1);
d=a;

//medium t
a=((y*z)/2)+1;
b=z*(((y*z)/4)+1);
c=y;
d=a;
