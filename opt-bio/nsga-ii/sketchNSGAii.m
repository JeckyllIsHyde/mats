clear,clc,clf
%% SCH
f1obj = @(x)(x(:,1).^2);
f2obj = @(x)((x(:,1)-2).^2);
x = -1:0.1:3;
% f1obj = @(x)(1-exp(-sum((x-1/sqrt(3)).^2,2)));
% f2obj = @(x)(1-exp(-sum((x+1/sqrt(3)).^2,2)));
%%
figure(1)
plot(x,f1obj(x),x,f2obj(x)),hold on,grid on
%%
IterMax = 100;
pmut = 0.005;
ndim = 3;
nd = 9;
nb = 3+nd;
nP = 100;
decodeVector = repmat(2.^(((nb-2):-1:0)-nd),nP,1);
bj = round(rand(nP,ndim*nb));
xj = [sum(decodeVector.*bj(:,2:1:nb),2).*(-1).^(bj(:,1)-1),...
      sum(decodeVector.*bj(:,nb+2:1:2*nb),2).*(-1).^(bj(:,nb)-1),...
      sum(decodeVector.*bj(:,2*nb+2:1:3*nb),2).*(-1).^(bj(:,2*nb)-1)];
% figure(1)
% hxj = plot(xj(:,1),0,'*k');
fj = [f1obj(xj),f2obj(xj)];
%% Non-dominated sorting algorithm
% first pareto front
Spj = zeros(nP,nP);
npj = zeros(nP,1);
prank = zeros(nP,1);
for j=1:nP
    Spj(:,j) = sum(repmat(fj(j,:),nP,1)<fj,2)==2;
    npj(j) = sum(sum(repmat(fj(j,:),nP,1)>fj,2)==2,1);
end
FP1 = (npj==0);
pjidx = 1:nP;
FP = {pjidx(FP1)};
prank(FP{1}) = 1;
figure(2)
plot(fj(:,1),fj(:,2),'*'),hold on,grid on
%% n-other pareto fronts
i = 1;
while ~isempty(FP{i})
    Q = [];
    for p=FP{i}
        for q = pjidx(Spj(:,p)==1)
            npj(q) = npj(q)-1;
            if npj(q)==0
                Q = [Q q];
                prank(q) = i+1;
            end
        end
    end
    i = i+1;
    FP{i} = Q;
end
%% graphical representation
c = jet(length(FP)-1);
for i=1:length(FP)-1
    plot(fj(FP{i},1),fj(FP{i},2),'LineStyle','*','Color',c(i,:))
    disp(FP{i})
end
