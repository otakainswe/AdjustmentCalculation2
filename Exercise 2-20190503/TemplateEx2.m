%--------------------------------------------------------------------------
%   
%        SELECTED SECTIONS OF ADJUSTMENT CALCULATION
%             Exercise 2 - Hypothesis Testing
% 
%   Author         : Anastasia Pasioti
%   Version        : May 4, 2017
%   Last changes   : May 7, 2018
%
%--------------------------------------------------------------------------
clc;
clear all;
close all;

%--------------------------------------------------------------------------
% Task 1
%--------------------------------------------------------------------------

% Ho: x_bar = E(x)  
% Ha: x_bar > E(x)     

% expectation value: E(x)
E = 0; % mm

% mean
x_bar = 3.5; % mm

% std of mean
s_x_bar = 1.7; % mm

% Degree of Freedom
f = 9; 

% Test statistics of t-test
T_t = (x_bar-E)/s_x_bar;

% Threshold value of t-test
t_t = tinv(0.95,9);

% Statistical test for a = 0.05 S = 95%
if T_t < t_t
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end

% [h,p,ci,stats] = ttest(E,x_bar);

%--------------------------------------------------------------------------
% Task 2
%--------------------------------------------------------------------------

% Ho: sigma_d = s_d
% Ha: sigma_d != s_d

% theoretical std
sigma_d = 2.0; % mm
% empirical stdgt
s_d = 2.2; % mm

% Degree of Freedom
f = 9; % 10-1

% %Calculate the confidence limits of x^2-Distribution
% % S = 95%  a = 0.05 
% a1chi2_95 = s1*sqrt(f1/chi2inv(0.975,f1));   % 1-a/2
% b1chi2_95 = s1*sqrt(f1/chi2inv(0.025,f1));   %  a/2 

% Test statistic of x^2-test
T_chi2 = (f*s_d^2)/sigma_d^2;

% Threshold value of x^2-test
t_chi2_lo = chi2inv(0.025,f);
t_chi2_up = chi2inv(0.975,f); 

%Statistical test for a = 0.05 S = 95%
if t_chi2_lo<T_chi2 && T_chi2<t_chi2_up
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end


%--------------------------------------------------------------------------
% Task 3
%--------------------------------------------------------------------------

% Ho: 
% Ha: 
% 
% s2_2
% s2_5
% 
% f=
% 
% Tf
% tf = finv(0.95,f,f);
% 
% if Tf<tf
    





