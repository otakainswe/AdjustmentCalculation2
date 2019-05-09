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
% Task 5
%--------------------------------------------------------------------------
% Step 1
% Ho: s_e = s_t  empirical deviation and therical deviation
% Ha: s_e  not equal s_t   
% Step 2: two sided
% Step 3 : a 5%
a = 0.05;
% Step 4: 
f = 12 - 1;
% Step 5: caculate the confidence interval for Theoritical deviation
s_e = sqrt(0.07);
s_t = sqrt(0.1);
s_t_low = s_e*sqrt(f/chi2inv(1-a/2,f));   % a/2 
s_t_up = s_e*sqrt(f/chi2inv(a/2,f));      % 1-a/2

if s_t_low < s_t  && s_t < s_t_up
     disp('Task 5:Fails to reject the Ho.')
     disp('the empirical variance is not significant different from the given variance')
else
     disp('Task 5:Rejects the Ho.')
end 

%--------------------------------------------------------------------------
% Task 6
%--------------------------------------------------------------------------
% Step 1
% Ho: u1 =u2
% Ha: u1 not equal u2
% Step 2: two sided
% Step 3 : a 5%
a = 0.05;
% Sstep 4: 
n1 = 15;
n2 = 17;
% Step 5: caculate the confidence interval for mean 1
s1_var = 0.35 ;
x1_mean = 8.73;
 
s2_var = 0.4 ;
x2_mean = 8.68;

%the standard error (SE) of the sampling distribution
se = sqrt(((n1-1)*s1_var +(n2-1)*s2_var)/(n1+n2-2));
%Degrees of freedom
df =  n1+n2-2;
% Test statistic.
t_dif = (x1_mean -x2_mean ) /sqrt(s1_var/n1 +s2_var/n2);

%Calculate the confidence limits of the expectation mean difference
 diff_mean = x1_mean -x2_mean ;
 t95 =tinv(0.975,df) ;
 diff_mean_low = diff_mean - t95*se/(n1+n2);
 diff_mean_up =  diff_mean + t95*se/(n1+n2) ;
 % the significance level is 5%
if diff_mean_low < diff_mean  && diff_mean < diff_mean_up
     disp('Task 6:Fails to reject the Ho.')
     disp('the empirical variance is not significant different from the given variance')
else
     disp('Task 6:Rejects the Ho.')
end 
 





