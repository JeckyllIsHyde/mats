clear,clc,clf
%%
%[x,y] = meshgrid(-20.0:0.1:20.0,-20.0:0.1:20.0);
[x,y] = meshgrid(-4.5:0.1:4.5,-4.5:0.1:4.5);
%a = 1;b = 100;
%f = (a-x).^2 + b*(y-x.^2).^2;
%f = (a-x).^2 + (y+1).^2;
f = (1.5-x+x.*y).^2 +(2.25-x+x.*y.^2).^2 +(2.625-x+x.*y.^3).^2;
contour(x,y,log(f))
%surf(x,y,f,'edgecolor','none')
hold on, grid on
%%
IterMax = 50;
Phi = 1;
rho1 = 2;
rho2 = 2;
%fobj =@(x)((a-x(:,1)).^2 + b*(x(:,2)-x(:,1).^2).^2);
%fobj =@(x)((a-x(:,1)).^2 + (x(:,2)+1).^2);
fobj =@(x)((1.5-x(:,1)+x(:,1).*x(:,2)).^2 +(2.25-x(:,1)+x(:,1).*x(:,2).^2).^2 +(2.625-x(:,1)+x(:,1).*x(:,2).^3).^2);
nP = 10;
% initial population
xj = 9*rand(nP,2)-4.5;
fj = fobj(xj);
xbestj = xj;
fbestj = fj;fbestj(:) = 1000;
vj = zeros(size(xj));
%
hxj = plot(xj(:,1),xj(:,2),'*k');
%%
iter = 0;
while (iter<IterMax)
    xbestj(fj<fbestj,:) = xj(fj<fbestj,:);
    fbestj(fj<fbestj) = fj(fj<fbestj);
    [fgbest,jgbest] = min(fbestj);
    xgbest = xbestj(jgbest,:);
    vj =   Phi*repmat(rand(nP,1),1,2).*vj...
        + rho1*repmat(rand(nP,1),1,2).*(xbestj-xj)...
        + rho2*repmat(rand(nP,1),1,2).*(repmat(xgbest,nP,1)-xj);
    xj = xj+vj;
    fj = fobj(xj);
    set(hxj,'xdata',xj(:,1),'ydata',xj(:,2));
    iter = iter+1;
    drawnow
end
xgbest