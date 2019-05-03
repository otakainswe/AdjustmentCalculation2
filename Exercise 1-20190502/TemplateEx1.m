%--------------------------------------------------------------------------
%   
%   SELECTED SECTIONS OF ADJUSTMENT CALCULATION 
%   Test distribution and confidence intervals
% 
%   Author         : Pasioti Anastasia
%   Version        : May 02, 2018
%   Last changes   : May 02, 2018
%
%--------------------------------------------------------------------------

clc;
clear all;
close all;

%--------------------------------------------------------------------------
% A survey application
%--------------------------------------------------------------------------

%Load the data
x1 = load('epoch2011.txt');
x2 = load('epoch2012.txt');

%Number of measurements
n1 = length(x1);
n2 = length(x2);

%The adjusted height difference for both epochs
x_bar1 = mean(x1); 
x_bar2 = mean(x2);

%Calculate the residuals
v1 = x_bar1 - x1; 
v2 = x_bar2 - x2;

%Plot the residuals
figure (1)
bar(v1);
title('Residual for epoch2011');
xlabel('Number of residuals');
ylabel('Residuals [v_i]');

figure (2)
bar(v2);
title('Residual for epoch2012');
xlabel('Number of residuals');
ylabel('Residuals [v_i]');

%Calculate the empirical reference standard deviation for both epochs
s1 = sqrt(sum(v1.^2)/(n1-1));  % or std(v1) 
s2 = sqrt(sum(v2.^2)/(n2-1)); 

%Degree of freedom
f1 = n1-1; %numerator of freedom
f2 = n2-1; %denominator of freedom

%Plot the F-distribution 
x_axes = 0:0.01:10;

figure
plot(x_axes,fpdf(x_axes,f1,f2));
title('F-distribution');
xlabel('Degree of freedom');
ylabel('Density function');

%Calculate the confidence limits of F-Distribution
% for S = 95%
af_95 = s1/s2*sqrt(1/finv(0.975,f1,f2));  
bf_95 = s1/s2*sqrt(finv(0.975,f2,f1)); 

%Homework
% for S = 99%
% af_99 = 
% bf_99 = 

%Statistical test for a = 0.05 S = 95%
% T = 

if
    disp('Accepts the H0.')
else
    disp('Rejects the H0.')
end

%Plot the x^2 - distribution
x_axe = 0;0.01:50;
figure
plot(x_axes,chi2pdf(x_axes,f1),'b',x_axe,chi);
title('x^2-distribution');
xlabel('Degrees of freedom');
ylabel('Density function');
legend('x^2_f_1','x^2_f_2');

%Calculate the confidence limits of x^2-Distribution
% S = 95%  a = 0.05 
a1chi2_95 = s1*sqrt(f1/chi2inv(0.975,f1));  % a/2 %% in matlab, we have to type oppositte way!(0.975,f1)
b1chi2_95 = s1*sqrt(f1/chi2inv(0.025,f1));  % 1-a/2

%Homework
% S = 99% a = 0.01


%Statistical test for a = 0.05 S = 95%  
% For epoch2011


 
 %For epoch2012






