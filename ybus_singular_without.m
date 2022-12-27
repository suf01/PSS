clc
clear all
n = 4;
l = 5;
e = n+l;
zd = [1 2 0 0.2 0 -6.66;
      1 3 0 0.15 0 0; 
      1 4 0 0.1 0 0; 
      2 3 0 0.1 0 0; 
      2 4 0 0.15 0 0];
sn = zd(:,1);
rn = zd(:,2);
r = zd(:,3);
x = zd(:,4);
g = zd(:,5);
b = zd(:,6);
j = sqrt(-1);
zsc = r+j*x;
ysc = 1./zsc;
ysh = g + j*b;
A = zeros(l,n);
for q=1:n
    A(q,q) = 1;
end
for i=1:l
    A(n+i,sn(i))=1;
    A(n+i,rn(i))=-1;
end
disp(A)
yprim = zeros(e,e);
for i=1:l
    yprim(n+i,n+i) = yprim(n+i,n+i) + ysc(i);
    yprim(sn(i),sn(i))=yprim(sn(i),sn(i))+ysh(i);
    yprim(rn(i),rn(i))=yprim(rn(i),rn(i))+ysh(i);
end
ybus = A'*yprim*A;
disp(ybus)