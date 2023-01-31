clc;
clear all;
j = sqrt(-1);
yb = [
65-45*j -40+j*20 -25+25*j;
-40+j*20 60-60*j -20+40*j;
-25+25*j -20+40*j 45-j*65;];
nbus = 3;
sb = 1;
v = [1 1 1];
delta = [0 0 0];
ym = sqrt(real(yb).^2 + imag(yb).^2);
ang = atan2(imag(yb),real(yb));
clear J;
for i = 1:nbus
J1(i,i) = 0;
J3(i,i) = 0;
J22 = 0;
J44 = 0;
for j = 1:nbus
if i ~= j
J1(i,i) = J1(i,i) + v(i)*v(j)*ym(i,j)*sin(ang(i,j) + delta(j) - delta(i));
J3(i,i) = J3(i,i) + v(i)*v(j)*ym(i,j)*cos(ang(i,j) + delta(j) - delta(i));
J22 = J22 + v(j)*ym(i,j)*cos(ang(i,j) + delta(j) - delta(i));
J44 = J44 + v(j)*ym(i,j)*sin(ang(i,j) + delta(j) - delta(i));
end
end
if i ~= sb
J1(i,i) = J1(i,i);
J3(i,i) = J3(i,i);
J2(i,i) = J22 + (2*v(i)*ym(i,i)*cos(ang(i,i)));
J4(i,i) = -J44 - (2*v(i)*ym(i,i)*sin(ang(i,i)));
end
end
for i = 1:nbus
for j = 1:nbus
if (i ~= sb & i ~= j & j ~= sb)
J1(i,j) = -v(i)*v(j)*ym(i,j)*sin(ang(i,j) + delta(j) - delta(i));
J3(i,j) = -v(i)*v(j)*ym(i,j)*cos(ang(i,j) + delta(j) - delta(i));
J2(i,j) = v(i)*ym(i,j)*cos(ang(i,j) + delta(j) - delta(i));
J4(i,j) = -v(i)*ym(i,j)*sin(ang(i,j) + delta(j) - delta(i));
end
end
end
for i = 1:nbus

for j = 1:nbus
if (i ~= sb & j ~= sb)
J(i-1,j-1) = J1(i,j);
J(i-1,nbus - 2 + j) = J2(i,j);
J(nbus - 2 + i,j-1) = J3(i,j);
J(nbus - 2 + i,nbus - 2 + j) = J4(i,j);
end
end
end
disp(J);
