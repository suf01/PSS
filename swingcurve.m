H = 5.2;
xpre = 0.7;
xfault = 1.9;
xpost = 0.9;
E = 2;
V = 1;
MVA = 100;
MW = 8;
delta = 0;
tc = 0.125;
tfinal = 0.5;

M = H/(180*50);
pm = MW/MVA;
ppre = (E*V)/xpre;
pfault = (E*V)/xfault;
ppost = (E*V)/xpost;

ddelta = 0;
tstep = 0.05;
t = 0;
tf = 0;

i = 2;
time(1) = 0;
ang(1) = delta;

while t<tfinal
    if(t==tf)
        paa = pm-ppre*sin(delta*pi/180);
        pab = pm-pfault*sin(delta*pi/180);
        pa = (paa+pab)/2;
    end
    if(t == tc)
        paa = pm-pfault*sin(delta*pi/180);
        pab = pm-ppost*sin(delta*pi/180);
        pa = (paa+pab)/2;
    end
    if(t > tf && t < tc)
        pa = pm-pfault*sin(delta*pi/180);
    end
    if(t > tc)
        pa = pm-ppost*sin(delta*pi/180);
    end
    
    ddelta = ddelta+(tstep*tstep*pm/M);
    delta = delta+ddelta;
    t = t+tstep;
    time(i) = t;
    ang(i) = delta;
    i = i+1;
end

plot(time, ang)