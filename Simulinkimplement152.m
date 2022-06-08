clear all
close all
clc
% t = [0 72 152];                  %sec
% m = [1.20e5 7.38e4 2.44e4];      % Kg;
% I_y= [4.41e6 3.28e6 2.03e6];     %Kg-m^2
% T_c= [1.37e6 1.52e6 1.58e6];     % N
% L_Alpha = [0.001 8.81e5 4.00e4]; % N/rad
% l_Alpha = [14.65 10.39 5.67];    % m
% l_c= [10.33 9.85 14.26];         % m
% U_0= [0.001 984.42 416e3];       % m/sec


m =  2.44e4;        % Kg;
I_y= 2.03e6;        %Kg-m^2
T_c= 1.58e6;        % N
L_Alpha = 4.00e4;   % N/rad
l_Alpha = 5.67;     % m
l_c= 14.26;         % m
U_0= 416e3;         % m/sec
K_c=15;

%K_A= [0.34 21 2.5];  %compensator Values
K_A = 6.8;
K_R=0.5;

% s=tf('s');
% K_r=K_R*s;

%state space representation
% x_dot=[ w_dot q_dot theta_dot];
% X_dot=A_E*x+B_E*u;
% Y=C_E*x+D_E*u;
% x=[w; q; theta];

A152= [-(L_Alpha/(U_0*m)) U_0 0; (L_Alpha*l_Alpha)/(U_0*I_y) 0  0;  0 1 0];


B152= [(T_c/m); ((l_c*T_c)/I_y); 0];


C152= eye(3,3);
D152= zeros(3,1);

delta_max_deg=10; % deg
delta_max=delta_max_deg*pi/180;

theta_c_deg=5; % deg
theta_c=theta_c_deg*pi/180;

stop_time=100; %sec

out=sim('Simimplement152');


figure
plot(out.theta.Time,out.theta.data*180/pi)
grid on
xlabel('t (sec)')
ylabel('\theta (deg)')
S = stepinfo(out.theta.data,out.theta.Time,5/180*pi)


