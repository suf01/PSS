clc;
clear all;
j=sqrt(-1);
pin=48*10^6;
pf=0.8;
vl=34.64*10^3;
xd=13.5;
xq=9.33;

j = sqrt(-1);
pi = 22/7;
vph = vl/sqrt(3);
phi = acos(pf);
q = tan(phi)*pin;
i = (pin-j*q)/(3*vph);
eq = vph+j*i*xq;

id = abs(i)*sin(angle(eq)-angle(i));
eph = eq+id*(xd-xq);
delta = 0:10:180;
deltal = delta*pi/180;

p1 = (eph*vph*sin(deltal))/xd;
p2 = (vph*vph/2)*((1/xq)-(1/xd))*sin(2*deltal);
pout = p1+p2;
plot(delta,p1,'r', delta,p2,'g', delta,pout,'g');
reg = ((abs(eph)-abs(vph))/abs(vph))*100;


