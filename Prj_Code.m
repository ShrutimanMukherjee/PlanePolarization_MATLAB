clc;
close all;
clear;

%% Initialization
t = 0:0.05:2*pi;
phi = pi;
omega = 4;
lambda = 4000;
Emax = 2;
Bmax = 3;
time2pause = 0.01;

%% EM Directions
E = Emax*cos(omega*t - 2*pi/lambda + phi);

Eline1 = animatedline('LineWidth',3,'Color','r');
Eline2 = animatedline('LineWidth',3,'Color','g');
Eline3 = animatedline('LineWidth',3,'Color','m');
Eline4 = animatedline('LineWidth',3,'Color','#D95319');
Pline = animatedline('LineWidth',3,'Color','b');

axis([0 2*pi -2 2 -3 3]);
title('3D EM Wave');
view(45,20);
xlabel('Propagation dir (x)');
ylabel('Electric field dir (y)');
zlabel('Electric field dir (z)');
halflen = length(t)/2;
patch([pi pi pi pi],[-2 -2 2 2],[3 -3 -3 3],[0 0 0 0])
grid on;
hold on;

%% Add points
for i=1:halflen
    addpoints(Pline,t(i),0,0);
    addpoints(Eline1,t(i),E(i)*cos(0),E(i)*sin(0));
    addpoints(Eline2,t(i),E(i)*cos(pi/4),E(i)*sin(pi/4));
    addpoints(Eline3,t(i),E(i)*cos(pi/2),E(i)*sin(pi/2));
    addpoints(Eline4,t(i),E(i)*cos(3*pi/4),E(i)*sin(3*pi/4));
    drawnow
    pause(time2pause);
    hold on;
end
choice = input('Enter the plane to polarize along:\n1 --> red\n2 --> green\n3 --> pink\nAnything Else --> brown');
for i=1+halflen : length(t)
    addpoints(Pline,t(i),0,0);
    if choice == 1
        addpoints(Eline1,t(i),E(i)*cos(0),E(i)*sin(0));
    elseif choice == 2
        addpoints(Eline2,t(i),E(i)*cos(pi/4),E(i)*sin(pi/4));
    elseif choice == 3
        addpoints(Eline3,t(i),E(i)*cos(pi/2),E(i)*sin(pi/2));
    else
        addpoints(Eline4,t(i),E(i)*cos(3*pi/4),E(i)*sin(3*pi/4));
    end

    drawnow
    pause(time2pause);
    hold on;
end