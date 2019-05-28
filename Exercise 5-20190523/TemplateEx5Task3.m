%--------------------------------------------------------------------------
%   
%   SELECTED SECTIONS OF ADJUSTMENT CALCULATION
%      Free Network Adjustment Calculation
%        - Combined Horizontal Network -
% 
%   Author         : Anastasia Pasioti
%   Version        : May 30, 2017
%   Last changes   : Mar. 28, 2019
%
%--------------------------------------------------------------------------

clc;
clear all;
close all;
format long g;
%--------------------Task 3------------------------------------------------

%Data
% X_hat = 
% Q_xx = 

I = eye(12,12);


y1 = X_hat(1);
x1 = X_hat(2);
y6 = X_hat(3);
x6 = X_hat(4);
y9 = X_hat(5);
x9 = X_hat(6);
y15 = X_hat(7);
x15 = X_hat(8);

%% 1)

p = 4;

%Scaling
 a = sqrt(x1^2+x6^2+x9^2+x15^2+y1^2+y6^2+y9^2+y15^2);
    
%Matrix G
%     G = 

%Matrix B
%     B = 


%S transformation
S = I-G'*(inv(B*G'))*B;

X_hat_tran = S*X_hat;

Q_xx_tran = S*Q_xx*S';








