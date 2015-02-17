clear,clc,clf
%% polares
syms r th
x = r*cos(th);
y = r*sin(th);
er = [cos(th);sin(th)]
eth = [-sin(th);cos(th)]
dXde = [diff(x,r) diff(x,th);diff(y,r) diff(y,th)]
dedX = simplify(inv(dXde))
simplify(dXde.'*dXde)
simplify(dedX*dedX.')
G = eval(subs(dXde,[r,th],[0.5,atan2(0.4,0.3)]));
figure(1),hold on, grid on
R = zeros(2,101);
for r=0:0.1:1
    i=1;
    for th = (0:0.01:1)*2*pi
        R(:,i) = [r*cos(th);r*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:))
end
R = zeros(2,11);
for th = ([0:0.05:1])*2*pi
    i=1;
    for r=0:0.1:1
        R(:,i) = [r*cos(th);r*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:),'r')
end
v = [0.4;0.2];
p = [0.3;0.4];
quiver(p(1),p(2),v(1),v(2),'linewidth',4.0,'color','k')
quiver(p(1),p(2),G(1,1),G(2,1),'linewidth',4.0,'color','r')
quiver(p(1),p(2),G(1,2),G(2,2),'linewidth',4.0,'color','g')
axis equal
%% parabolicas
syms r th
x = r*th;
y = 1/2*(th^2-r^2)
dXde = [diff(x,r) diff(x,th);diff(y,r) diff(y,th)]
dedX = simplify(inv(dXde))
simplify(dXde.'*dXde)
simplify(dedX*dedX.')
G = eval(subs(dXde,[r,th],[10^(1/2)/10,3*10^(1/2)/10]));
figure(2),hold on, grid on
R = zeros(2,101);
for r=-1:0.1:1
    i=1;
    for th = 0:0.01:1
        R(:,i) = [r*th;1/2*(th^2-r^2)];
        i=i+1;
    end
    plot(R(1,:),R(2,:))
end
R = zeros(2,11);
for th = 0:0.05:1
    i=1;
    for r=-1:0.1:1
        R(:,i) = [r*th;1/2*(th^2-r^2)];
        i=i+1;
    end
    plot(R(1,:),R(2,:),'r')
end
v = [0.4;0.2];
p = [0.3;0.4];
quiver(p(1),p(2),v(1),v(2),'linewidth',4.0,'color','k')
quiver(p(1),p(2),G(1,1),G(2,1),'linewidth',4.0,'color','r')
quiver(p(1),p(2),G(1,2),G(2,2),'linewidth',4.0,'color','g')
axis equal
%% elipticas 1
a=1.2; b=0.7;
syms r th
x = a*r*cos(th);
y = b*r*sin(th);
er = [cos(th);sin(th)]
eth = [-sin(th);cos(th)]
dXde = [diff(x,r) diff(x,th);diff(y,r) diff(y,th)]
dedX = simplify(inv(dXde))
simplify(dXde.'*dXde)
simplify(dedX*dedX.')
figure(3),hold on, grid on
R = zeros(2,101);
for r=0:0.1:1
    i=1;
    for th = (0:0.01:1)*2*pi
        R(:,i) = [a*r*cos(th);b*r*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:))
end
R = zeros(2,11);
for th = ([0:0.05:1])*2*pi
    i=1;
    for r=0:0.1:1
        R(:,i) = [a*r*cos(th);b*r*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:),'r')
end
axis equal
%% elipticas 2
a=1; b=2;
syms r th
x = a*cosh(r)*cos(th);
y = b*sinh(r)*sin(th);
dXde = [diff(x,r) diff(x,th);diff(y,r) diff(y,th)]
dedX = simplify(inv(dXde))
simplify(dXde.'*dXde)
simplify(dedX*dedX.')
figure(4),hold on, grid on
R = zeros(2,101);
for r=0:0.1:1
    i=1;
    for th = (0:0.01:1)*2*pi
        R(:,i) = [a*cosh(r)*cos(th);b*sinh(r)*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:))
end
R = zeros(2,11);
for th = ([0:0.05:1])*2*pi
    i=1;
    for r=0:0.01:1
        R(:,i) = [a*cosh(r)*cos(th);b*sinh(r)*sin(th)];
        i=i+1;
    end
    plot(R(1,:),R(2,:),'r')
end
axis equal
