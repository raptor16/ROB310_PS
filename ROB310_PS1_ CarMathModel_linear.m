%%%%%%% COURSE: ROB310 %%%%%%%%%
%%%%%%% PROBLEM SET 1 %%%%%%%%
%%%%%%% by Florence Chan %%%%%%%

% Question 1 2b: solving the discrete time mathematical model with ..
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
expm (Morpheus)ss





