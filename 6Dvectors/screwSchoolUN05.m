clear,clc
%% post-processing with springs
LK = 0.05;bK = 0.01;
plK = [LK 0;0 bK]*[0:0.05:1;0 sin(pi/2*(0:18)) 0];
hK = hgtransform;
set([line(plK(1,:),plK(2,:),'color','k','linewidth',4.0)...
     line(plK(1,1),plK(2,1),'color','k','linewidth',4.0...
                           ,'marker','o','markersize',8.0)],'parent',hK);
%%
set(hK,'matrix',TKaj*makehgtform('zrotate',qk1)...
                    *makehgtform('scale',[qk2 1 1]))
[handles,handleBase] = drawModel( modelRobot, parent );

for i = 1:length(t_data)
    [Tdisp,Xa] = positionModel( modelRobot, q, handles );
    drawnow
end
