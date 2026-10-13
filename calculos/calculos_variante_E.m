%% Cálculos 
clc; clear;

%% Geometría
r  = 0.070;
lx = 0.42/2
ly = 0.38/2

%% RPLIDAR A3 (Enhanced, 8 Hz)
samples = 16000/8

m = 0.190;  rl = 0.076/2;  h = 0.041;
I_lidar = [m*(3*rl^2 + h^2)/12, m*(3*rl^2 + h^2)/12, m*rl^2/2]

%% Orbbec Astra
hfov = deg2rad(58.4)

m = 0.310;  x = 0.040;  y = 0.165;  z = 0.048;
I_camara = [m*(y^2 + z^2)/12, m*(x^2 + z^2)/12, m*(x^2 + y^2)/12]

%% Cinemática: xi = W*omega,  omega = W+ * xi
k = 1/(lx + ly);
W = (r/4)*[ 1  1  1  1;
           -1  1  1 -1;
           -k  k -k  k]
W_pinv = pinv(W)
