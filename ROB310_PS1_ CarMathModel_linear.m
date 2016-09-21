%%%%%%% COURSE: ROB310 %%%%%%%%%
%%%%%%% PROBLEM SET 1 %%%%%%%%
%%%%%%% by Florence Chan %%%%%%%

%% Question 1 2b: solving the discrete time mathematical model with ..
% expm function 

% declaring constants in the mathematical model
b = 0.1;
m = 1;
h = 0.01;

TheMatrix = [-b/m, 1/m; 0, 0];
Morpheus = TheMatrix*h;

%from MATLAB help%
%expm(A) is the matrix exponential of A and is computed using
    % a scaling and squaring algorithm with a Pade approximation.
expm (Morpheus)

% Bonus: using the c2d function to find A_d and B_d ???

% The c2d function coverst continuous time math models to discrete time
% c2d syntax : c2d(sysc, ts, method) ... more form help

SYSC = -b*v + 1/m * u;
SYSD = c2d (SYSC ,h,zoh) % zoh is a method for zero-order hold on inputs


%% Question 1 (c) simulating the system for a step input u_k = =1 for ..
% k = 1, ..., 10000 with v_o= 0


% from the results of Question 1 (b), we determined the following constants
A_d = 0.999;
B_d = 0.01;
h = 0.01;

u_k = 1;
N = 10000;

% we know that y_k = v_k and
% v_k+1 = A_d*v_k + B_d*u_k = A_d*v_k + B_d
% so v_k+2 = A_d*v_k+1 + B_d and so on

%v_o = 0 is represented below
v = zeros (N, 1);
v(1) = 0;
v(2) = A_d * v(1) + B_d; % u_k was not multiplied because it's 1 anyway but it should be

for k = 2:(N-1)
    v(k+1) = A_d*v(k)+B_d;
     %%%NOTE: NEED TO change x axis TO TIME    
end 
% length (v)
x = 0:N-1;
figure 
plot (x*h, v);
title ('Car moving on the road')
xlabel ('time in seconds')
ylabel ('velocity')

%% Model given friction coefficient is 0.4

% run sections in order since I didn't use functions..which I should have
% so I just didn't clear the variables on purpose (bad practice)

% new constants by running section 1 with b = 0.4;
A_d = 0.996;
B_d = 0.01;
h = 0.01;

u_k = 1;    % initial condition given in the previous section
N = 10000;

% we know that y_k = v_k and
% v_k+1 = A_d*v_k + B_d*u_k = A_d*v_k + B_d
% so v_k+2 = A_d*v_k+1 + B_d and so on

%v_o = 0 is represented below
w = zeros (N, 1);
w(1) = 0;
w(2) = A_d * w(1) + B_d;

for k = 2:(N-1)
    w(k+1) = A_d*w(k)+B_d;
     %%%NOTE: NEED TO change x axis TO TIME    
end 
j = 0:N-1;
figure 
plot (j*h, w);
title ('Car moving on the road with b = 0.4 in reality')
xlabel ('time in seconds')
ylabel ('velocity in units')
    
figure 
plot (j*h, abs(v-w));
title ('error: difference between the plot of b=0.1 and b=0.3');
xlabel ('time in seconds');
ylabel ('error value');







