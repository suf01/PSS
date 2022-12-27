clc
clear all

zdata = [1 1 0 0.25
         2 2 1 0.1
         3 3 1 0.1
         4 2 0 0.25
         5 2 3 0.1];
[ro co] = size(zdata);
zbus = [];
cbn = 0;

j = sqrt(-1);
for i = 1:ro
    [ro1 co1] = size(zbus);
    
    sb = zdata(i, 2);
    eb = zdata(i, 3);
    zser = zdata(i, 4);
    newbus = max(sb, eb);
    ref = min(sb, eb);
   
    if newbus>cbn && ref == 0
        zbus = [zbus zeros(ro1, 1)
                zeros(1, co1) zser];
        cbn = newbus;
        continue;
    end
    
    if newbus > cbn && ref ~= 0
        zbus = [zbus zbus(:, ref)
                zbus(ref, :) zser+zbus(ref, ref)];
        cbn = newbus;
        continue;
    end
    
    if newbus <= cbn && ref == 0
        zbus = zbus-1/(zbus(newbus, newbus)+zser)*zbus(:, newbus)*zbus(newbus, :);
        continue;
    end
    
    if newbus <= cbn && ref ~= 0
        zbus = zbus-1/(zser+zbus(sb, sb)+zbus(eb, eb)-2*zbus(sb, eb))*((zbus(:,sb)-zbus(:,eb))*(zbus(sb,:)-zbus(eb,:)));
        continue;
    end
end
disp(j*zbus);
    