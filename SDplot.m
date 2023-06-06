% This program constructs a contour plot for the two-bar truss
% constants
clear; close all;

% design variables at mesh points

[x,y] = meshgrid(0.001:0.01:2,0.001:0.01:2);
 
% equations

f = 100.*(y-(x.^2)).^2 + (1-x).^2;

figure(1)
[C,h] = contour(f,0.1:5:100,'k-');
clabel(C,h,'Labelspacing',250);
title('Spring Design Plot');
xlabel('x');
ylabel('y');
hold on;

% solid lines to show constraint boundaries
contour(D,d,(-(Se/Sf)+tao_a),[0,0],'g-','LineWidth',2); % tao_a <= Se/Sf
contour(D,d,(-(Sy/Sf)+(tao_a + tao_m)),[0,0],'r-','LineWidth',2);
contour(D,d,(4-(D./d)),[0,0],'y-','LineWidth',2);
contour(D,d,((D./d)-16),[0.0,0.0],'c-','LineWidth',2);
contour(D,d,((D+d)-0.75),[0.0,0.0],'m-','LineWidth',2);
contour(D,d,(0.05-ca),[0.0,0.0],'b-','LineWidth',2);
contour(D,d,(tao_hs-Sy  - hdef),[0.0,0.0],'k-','LineWidth',2);

% show a legend
legend('Force','tao_a<=Se/Sf','tao_a+tao_m<=Sy/Sf','4<=D/d','D/d<=16','D+d<=0.75','0.05<=ca','tao_hs<=Sy')
hold off;
