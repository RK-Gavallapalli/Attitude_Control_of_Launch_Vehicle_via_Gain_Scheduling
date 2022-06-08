close all
clear all
m=2.44e4; %kg
I_y=2.03e6; %kg m^2
T=1.58e6; % N
L_alpha=4.00e4; % N/rad
l_alpha=5.67; % m
l_c=14.26; % m
U_0=4.16e3; % m/sec
k_c=15; %rad/sec

s=tf('s');

G=((l_c*T/I_y)*(s+(L_alpha/(U_0*m))*(l_c+l_alpha)))/((s^3+(L_alpha/(U_0*m))*s^2-((l_alpha*L_alpha)/I_y)*s))

Gp=(15/(s+15))*G

rlocus(Gp);

K_R=0.3

H=K_R*s+1

sisotool(Gp,1,H,1)