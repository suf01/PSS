clc
clear all
pin = 48*10^6;
j = sqrt(-1);
pf = 0.8;
vl = 34.64810^3;
xd = 10;
vph = vl/sqrt(3);
phi = acos(pf);
q = tan(phi)*pin;
i = (pin-j*q)/(3*vph);
eph = vph+j*i*xd;
delta = 0:10:180;
pi = 22/7;
pout = abs(vph)*abs(eph)*sin(delta*pi/180)/xd;
plot(delta, pout);
reg = ((abs(eph)-abs(vph))/abs(vph))*100;