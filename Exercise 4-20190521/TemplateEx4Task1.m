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
 G = [1/sqrt(no_u) 1/sqrt(no_u) 1/sqrt(no_u) 1/sqrt(no_u)];

% total trace minimizataion
 B_1 = [1 1 1 1];

% partial trace minimizataion(1.2)
 B_2 = [1 0 0 0];

% partial trace minimizataion(1.3)
 B_3 = [1 1 0 0];


%--------------------------------------------------------------------------
%  Adjustment
%-------------------------------------------------------------------------- 
%Design matrix 
A = [-1 1 0 0; 0 -1 1 0; 0 0 -1 1; 1 0 0 -1; 0 1 0 -1; -1 0 1 0]; 

rk_A = rank(A);

   
%Normal matrix
N = A'*P*A;

det_N = det(N); 

  N_ext_G = [N G'; G 0];
  N_ext_B_1 = [N B_1'; B_1 0];
  N_ext_B_2 = [N B_2'; B_2 0];
  N_ext_B_3 = [N B_3'; B_3 0];

%Vector of right hand side of normal equations
n = A'*P*L;

n_ext = [n' 0]; 

%Inversion of normal matrix / Cofactor matrix of the unknowns
Q_xx_ext_G = inv(N_ext_G);
Q_xx_ext_B_1 = inv(N_ext_B_1);
Q_xx_ext_B_2 = inv(N_ext_B_2);
Q_xx_ext_B_3 = inv(N_ext_B_3);


Q_xx_G = Q_xx_ext_G(1:no_u,1:no_u); %Q_11
Q_xx_B_1 = Q_xx_ext_B_1(1:no_u,1:no_u); %Q_11
Q_xx_B_2 = Q_xx_ext_B_2(1:no_u,1:no_u); %Q_11
Q_xx_B_3 = Q_xx_ext_B_3(1:no_u,1:no_u); %Q_11

%Solution of normal equations
X_hat_G = Q_xx_G*n;

X_hat_B_1 = Q_xx_B_1*n;
X_hat_B_2 = Q_xx_B_2*n;
X_hat_B_3 = Q_xx_B_3*n;

%Vector of residuals
v_G = A*X_hat_G-L;
v_B_1 = A*X_hat_B_1-L;
v_B_2 = A*X_hat_B_2-L;
v_B_3 = A*X_hat_B_3-L;

%Vector of adjusted observations
L_hat_G = L+v_G;
L_hat_B_1 = L+v_B_1;
L_hat_B_2 = L+v_B_2;
L_hat_B_3 = L+v_B_3;

%Check


%Empirical reference standard deviation
s_0_G = sqrt(v_G'*P*v_G /r);  % sqrt(vTPv/r);  
s_0_B_1 = sqrt(v_B_1'*P*v_B_1 /r);  % sqrt(vTPv/r);  
s_0_B_2 = sqrt(v_B_2'*P*v_B_2 /r);  % sqrt(vTPv/r);  
s_0_B_3 = sqrt(v_B_3'*P*v_B_3 /r);  % sqrt(vTPv/r);  

%VC matrix of adjusted unknowns
S_XX_hat_G = s_0_G^2*Q_xx_G;
S_XX_hat_B_1 = s_0_B_1^2*Q_xx_B_1;
S_XX_hat_B_2 = s_0_B_2^2*Q_xx_B_2;
S_XX_hat_B_3 = s_0_B_3^2*Q_xx_B_3;

%Standard deviation of the adjusted unknowns
s_X_G = sqrt(diag(S_XX_hat_G));
s_X_B_1 = sqrt(diag(S_XX_hat_B_1));
s_X_B_2 = sqrt(diag(S_XX_hat_B_2));
s_X_B_3 = sqrt(diag(S_XX_hat_B_3));

%Cofactor matrix of adjusted observations
Q_LL_hat_G = A*Q_xx_G*A';
Q_LL_hat_B_1 = A*Q_xx_B_1*A';
Q_LL_hat_B_2 = A*Q_xx_B_2*A';
Q_LL_hat_B_3 = A*Q_xx_B_3*A';

%VC matrix of adjusted observations
S_LL_hat_G = s_0_G^2*Q_LL_hat_G;
S_LL_hat_B_1 = s_0_B_1^2*Q_LL_hat_B_1;
S_LL_hat_B_2 = s_0_B_2^2*Q_LL_hat_B_2;
S_LL_hat_B_3 = s_0_B_3^2*Q_LL_hat_B_3;

%Standard deviation of the adjusted observations
s_L_hat_G = sqrt(diag(S_LL_hat_G));
s_L_hat_B_1 = sqrt(diag(S_LL_hat_B_1));
s_L_hat_B_2 = sqrt(diag(S_LL_hat_B_2));
s_L_hat_B_3 = sqrt(diag(S_LL_hat_B_3));

%Cofactor matrix of the residuals
Q_vv_G = Q_LL-Q_LL_hat_G;
Q_vv_B_1 = Q_LL-Q_LL_hat_B_1;
Q_vv_B_2 = Q_LL-Q_LL_hat_B_2;
Q_vv_B_3 = Q_LL-Q_LL_hat_B_3;

%VC matrix of residuals
S_vv_G = s_0_G^2*Q_vv_G;
S_vv_B_1 = s_0_B_1^2*Q_vv_B_1;
S_vv_B_2 = s_0_B_2^2*Q_vv_B_2;
S_vv_B_3 = s_0_B_3^2*Q_vv_B_3;



%Standard deviation of the residuals
s_v_G = sqrt(diag(S_vv_G));
s_v_B_1 = sqrt(diag(S_vv_B_1));
s_v_B_2 = sqrt(diag(S_vv_B_2));
s_v_B_3 = sqrt(diag(S_vv_B_3));

%Pseudo inverse
p_N = pinv(N);

%--------------------------------------------------------------------------
%  Plot the adjusted heights 
%--------------------------------------------------------------------------
%figure 
X = 1:1:4;
Y = X_hat_G;
plot(X,Y,'x-');
hold on
Y2 = X_hat_B_1;
plot(X,Y2,'x-');
hold on
Y3 = X_hat_B_2;
plot(X,Y3,'x-');
hold on
Y4 = X_hat_B_3;
plot(X,Y4,'x-');
hold off









    