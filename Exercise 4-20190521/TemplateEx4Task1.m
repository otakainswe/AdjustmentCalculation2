%--------------------------------------------------------------------------
%   
%   SELECTED SECTIONS OF ADJUSTMENT CALCULATION
%      Free Network Adjustment Calculation
%            - Levelling Network -
% 
%   Author         : Anastasia Pasioti
%   Version        : May 23, 2017
%   Last changes   : May 23, 2017
%
%--------------------------------------------------------------------------

clc;
clear all;
close all;

%--------------------------------------------------------------------------
%   Observations 
%--------------------------------------------------------------------------
%Vector of observations
 L = [8.892 11.994 -15.228 -5.660 3.220 20.886]';

%Number of observations
no_n = length(L);

%Number of unknowns
 no_u = 4;  % H1,H2,H3,H4

%Redundancy
 r = no_n - no_u + 1;

%--------------------------------------------------------------------------
%  Stochastic model
%--------------------------------------------------------------------------
%VC Matrix of the observations
S_LL = eye(no_n); 

%Theoretical standard deviation
sigma_0 = 1; 

%Cofactor matrix of the observations
Q_LL = 1/sigma_0^2 * S_LL; 

%Weight matrix
P = inv(Q_LL); 

%--------------------------------------------------------------------------
%  Constraints
%--------------------------------------------------------------------------
% G = [1/sqrt(no_u) 1/sqrt(no_u) 1/sqrt(no_u) 1/sqrt(no_u)];

% total trace minimizataion
% B = [1 1 1 1];

% partial trace minimizataion(1.2)
% B = [1 0 0 0];

% partial trace minimizataion(1.3)
B = [1 1 0 0];


%--------------------------------------------------------------------------
%  Adjustment
%-------------------------------------------------------------------------- 
%Design matrix 
A = [-1 1 0 0; 0 -1 1 0; 0 0 -1 1; 1 0 0 -1; 0 1 0 -1; -1 0 1 0]; 

rk_A = rank(A);

   
%Normal matrix
N = A'*P*A;

det_N = det(N); 

% N_ext = [N G'; G 0];

 N_ext = [N B'; B 0];

%Vector of right hand side of normal equations
n = A'*P*L;

n_ext = [n' 0]; 

%Inversion of normal matrix / Cofactor matrix of the unknowns
Q_xx_ext = inv(N_ext);

Q_xx = Q_xx_ext(1:no_u,1:no_u); %Q_11

%Solution of normal equations
X_hat = Q_xx*n;

%Vector of residuals
v = A*X_hat-L;

%Vector of adjusted observations
L_hat = L+v;

%Check


%Empirical reference standard deviation
s_0 = sqrt(v'*P*v /r);  % sqrt(vTPv/r);  

%VC matrix of adjusted unknowns
S_XX_hat = s_0^2*Q_xx;

%Standard deviation of the adjusted unknowns
s_X = sqrt(diag(S_XX_hat));

%Cofactor matrix of adjusted observations
Q_LL_hat = A*Q_xx*A';

%VC matrix of adjusted observations
S_LL_hat = s_0^2*Q_LL_hat;

%Standard deviation of the adjusted observations
s_L_hat = sqrt(diag(S_LL_hat));

%Cofactor matrix of the residuals
Q_vv = Q_LL-Q_LL_hat;

%VC matrix of residuals
S_vv = s_0^2*Q_vv;

%Standard deviation of the residuals
s_v = sqrt(diag(S_vv));


%--------------------------------------------------------------------------
%  Plot the adjusted heights 
%--------------------------------------------------------------------------
%figure 

%Pseudo inverse
p_N = pinv(N);





    