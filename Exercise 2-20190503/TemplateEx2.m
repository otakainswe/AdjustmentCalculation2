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

% Ho: 
% Ha: 



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
    





