clc
clear all
e = 5;
n = 4;
b = 3;
l = 2;
j = sqrt(-1);
data = [1 2 0 0.6;
        1 3 0 0.5;
        3 4 0 0.5;
        1 2 0 0.4;
        2 4 0 0.2;
        1 2 0 0.1;
        1 4 0 0.2];
    
sn = data(:,1);
rn = data(:,2);
r = data(:,3);
x = data(:,4);
z = r+j*x;

acap = zeros(e,n);
for i=1:e
    acap(i,sn(i))=1;
    acap(i,rn(i))=-1;
end
acap(:,1)=[ ];
A = acap;
zp = zeros(e,e);
for i=1:e
    zp(i,i) = zp(i,i)+z(i);
end
nm = 2;
snm = data(6:7,1);
rnm = data(6:7,2);
rm = data(6:7,3);
xm = data(6:7,4);
zm = rm + j*xm;
for i=1:nm
    zp(snm(i),rnm(i))=zm(i);
    zp(rnm(i),snm(i))=zm(i);
end
yp = inv(zp);
ybus = A'*yp*A;
disp(A)
disp(yp)
disp(ybus)