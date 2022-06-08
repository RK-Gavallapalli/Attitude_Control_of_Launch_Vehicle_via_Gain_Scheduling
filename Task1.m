close all
clear all

m=1.20e5; %kg
I_y=4.41e6; %kg m^2
T=1.37e6; % N
L_alpha=0.001; % N/rad
l_alpha=14.65; % m
l_c=10.33; % m
U_0=0.001; % m/sec
k_c=15; %rad/sec

s=tf('s')

G=((l_c*T/I_y)*(s)*(l_c+l_alpha))/(s^3)
Gp=(15/(s+15))*G

rlocus(Gp)

K_R=0.3

H=K_R*s+1

sisotool(Gp,1,H,1)