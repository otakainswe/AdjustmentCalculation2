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
    disp('Fails to reject the Task1 Ho.')
else
    disp('Rejects the Task1 Ho.')
end

% [h,p,ci,stats] = ttest(E,x_bar);

%--------------------------------------------------------------------------
% Task 2
%--------------------------------------------------------------------------

% Ho: sigma_d^2 = s_d^2
% Ha: sigma_d^2 != s_d^2

% theoretical std
sigma_d = 2.0; % mm
% empirical std
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
    disp('Fails to reject the Task2 Ho.')
else
    disp('Rejects the Task2 Ho.')
end


%--------------------------------------------------------------------------
% Task 3
%--------------------------------------------------------------------------

% Ho: s2_2 = s2_5
% Ha: s2_2 != s2_5

% variances of obs
s2_2 = 61.0;
s2_5 = 54.0;

% Degree of Freedom
f= 9; % 10-1 

%Statistical test for a = 0.05 S = 95%
% Test statistic of F-test
T_F = (s2_2)/(s2_5);

% Threshold value of F-test
% One-sided 
t_F_lo = finv(0.95,f,f);        
 
if  T_F <t_F_lo
    disp('Fails to reject the Task3 Ho.')
else
    disp('Rejects the Task3 Ho.')
end


%--------------------------------------------------------------------------
% Task 4
%--------------------------------------------------------------------------

% Ho: x_bar = E(x)  
% Ha: x_bar != E(x)     

% expectation value: E(x)
E = 6; 

% mean
x_bar = 5.5; 

% std of mean
s_x_bar = 1.0;

% Degree of Freedom
f = 15; % 16-1 

% Test statistics of t-test
T_t = (E-x_bar)/s_x_bar;

% Threshold value of t-test
t_t = tinv(0.95,15);

% Statistical test for a = 0.05 S = 95%
if T_t < t_t
    disp('Fails to reject the Task4 Ho.')
else
    disp('Rejects the Task4 Ho.')
end

%--------------------------------------------------------------------------
% Task 5
%--------------------------------------------------------------------------

% Ho: sigma_x = s_x
% Ha: sigma_x != s_x

% theoretical variance
sigma_x2 = 0.10; 
% empirical variance
s_x2 = 0.07; 

% Degree of Freedom
f = 11; % 12-1

% Test statistic of x^2-test
T_chi2 = (f*s_x2)/sigma_x2;

% Threshold value of x^2-test
t_chi2_lo = chi2inv(0.025,f);
t_chi2_up = chi2inv(0.975,f); 

%Statistical test for a = 0.05 S = 95%
if t_chi2_lo<T_chi2 && T_chi2<t_chi2_up
    disp('Fails to reject the Task5 Ho.')
else
    disp('Rejects the Task5 Ho.')
end

%--------------------------------------------------------------------------
% Task 6
%--------------------------------------------------------------------------

% Ho: x1_bar = x2_bar 
% Ha: x1_bar != x2_bar    

% sample mean
x1_bar = 8.73;
x2_bar = 8.68;

% sample variance
s2_x1 = 0.35;
s2_x2 = 0.40;

% % sample std
% x_x1 = sqrt(s2_x1);
% x_x2 = sqrt(s2_x2);

% sample size
n1 = 15;
n2 = 17;

% Degree of Freedom
f = (n1-1) + (n2-1); 

% Test statistics of two-sample t-test
T_2t = (x1_bar-x2_bar) / sqrt((s2_x1/n1) + (s2_x2/n2));

% Threshold value of two-sample t-test
t_2t = tinv(0.95,30);

% Statistical test for a = 0.05 S = 95%
if T_t < t_t
    disp('Fails to reject the Task6 Ho.')
else
    disp('Rejects the Task6 Ho.')
end



    





