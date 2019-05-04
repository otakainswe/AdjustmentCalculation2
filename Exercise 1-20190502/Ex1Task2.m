%--------------------------------------------------------------------------
%   
%   SELECTED SECTIONS OF ADJUSTMENT CALCULATION 
%   Test distribution and confidence intervals
% 
%   Author         : Pasioti Anastasia
%   Version        : May 02, 2018
%   Last changes   : May 02, 2019
%
%--------------------------------------------------------------------------

clc;
clear all;
close all;

%--------------------------------------------------------------------------
% A survey application
%--------------------------------------------------------------------------

%Load the data
x = load('distances.txt');

%Number of measurements
n = length(x);

%Mean value
x_bar = sum(x)/n;

%Residuals
v = x_bar-x;

%Standard deviation of the mean value
sd = sqrt(sum(v.^2)/(n-1));

%Standard deviation of a single measurement(standard error of the mean)
se = sd/sqrt(n);

%Plot the residuals
figure (1)
bar(v)
title('Residuals for distance measurements');
xlabel('Number of residuals');
ylabel('Residuals [v_i]'); 

%Degrees of freedom
f = n-1;      

%Calculate the confidence limits for the expectation
% for S = 95%
pd = fitdist(x,'Normal');
ci_95 = paramci(pd);

% for S = 99%
ci_99 = paramci(pd,'Alpha',0.01);

%Calculate the confidence limits for a single measurement

% % for S = 95%
% pd = fitdist(x,'Normal');
% ci_95 = paramci(pd);
% 
% % for S = 99%
% ci_99 = paramci(pd,'Alpha',0.01);




 



