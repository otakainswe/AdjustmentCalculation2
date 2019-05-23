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


%--------------------Task 2------------------------------------------------

%Data
% from total trace minimization
 X_hat = [-8.8595
          0.0295
          12.027
          -3.197]; 
 Q_xx = [0.1875	-0.0625	-0.0625	-0.0625
        -0.0625	0.1875	-0.0625	-0.0625
        -0.0625	-0.0625	0.1875	-0.0625
        -0.0625	-0.0625	-0.0625	0.1875]; 
     

I = eye(4,4);

%% 1)

G_1 = [0.5 0.5 0.5 0.5];  % G matrix always have to be toral trace min. 
% 
B_1 = [1 0 0 0]; % new datum definition 

%Similarity transformation
S_1 = I - G_1'*(inv(B_1*G_1'))*B_1;

% 
X_hat_tran_1 = S_1* X_hat; 
% 
Q_xx_tran_1 = S_1*Q_xx*S_1'; 

%% 2)

G_2 = G_1; 
% 
B_2 = [0 0 1 1];

%Similarity transformation
S_2 = I-G_2'*(inv(B_2*G_2'))*B_2;
% 
X_hat_tran_2 = S_2* X_hat;
% 
Q_xx_tran_2 = S_2*Q_xx*S_2'; 






