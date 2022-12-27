clc
zin = [0 1 0 1
       0 2 0 0.8
       1 2 0 0.4
       1 3 0 0.2
       2 3 0 0.2
       3 4 0 0.08];
 
 n = 4;
 b = n-1;
 e = 6;
 
 sb = zin(:, 1);
 eb = zin(:, 2);
 r = zin(:, 3);
 x = zin(:, 4);
 
 j = sqrt(-1);
 
 z = r+j*x;
 y = 1./z;
 
 ybus = zeros(n, n);
 
 for i = 1:n
     for k = 1:e
         if(sb(k) == i || eb(k) == i)
             ybus(i, i) = ybus(i, i) + y(k);
         end
     end
 end
 
 for i = 1:e
     if(sb(i) > 0 && eb(i) > 0)
         ybus(sb(i), eb(i)) = -y(i);
         ybus(eb(i), sb(i)) = -y(i);
     end
 end
 
 disp(ybus);
 
             
             
             
             
            