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
x1 = load('epoch2011.txt');
x2 = load('epoch2012.txt');

%Number of measurements
n1 = length(x1);
n2 = length(x2);

%The adjusted height difference for both epochs
x_bar1 = sum(x1)/n1;
x_bar2 = sum(x2)/n2;

%Calculate the residuals
v1 = x_bar1-x1;
v2 = x_bar2-x2;

%Plot the residuals
figure (1)
bar(v1)
title('Residuals for epoch2011');
xlabel('Number of residuals');
ylabel('Residuals [v_i]'); 

figure (2)
bar(v2)
title('Residuals for epoch2012');
xlabel('Number of residuals');
ylabel('Residuals [v_i]'); 

%Calculate the empirical reference standard deviation for both epochs
s1 = sqrt(sum(v1.^2)/(n1-1));
s2 = sqrt(sum(v2.^2)/(n2-1));

%Degrees of freedom
f1 = n1-1;   
f2 = n2-1;   

%Plot the F-distribution 
x_axes = 0:0.01:10;

figure
plot(x_axes,fpdf(x_axes,f1,f2));
title('F-distribution');
xlabel('Degrees of freedom'); 
ylabel('Density function');

%Calculate the confidence limits of F-Distribution
% for S = 95%
af_95 = s1/s2*sqrt(1/finv(0.975,f1,f2));   
bf_95 = s1/s2*sqrt(finv(0.975,f2,f1));   

%Statistical test for a = 0.05 S = 95%
T_F = (s1^2)/(s2^2);
F_lo = finv(0.975,f1,f2);     
F_up = finv(0.975,f2,f1);    
 
if F_lo<T_F && T_F<F_up
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end

%Homework
% for S = 99%
af_99 = s1/s2*sqrt(1/finv(0.995,f1,f2)); 
bf_99 = s1/s2*sqrt(finv(0.995,f2,f1)); 

%Statistical test for a = 0.01 S = 99%
T_F = (s1^2)/(s2^2);
F_lo_99 = finv(0.995,f1,f2);     
F_up_99 = finv(0.995,f2,f1);    
 
if F_lo_99<T_F && T_F<F_up_99
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end

%Plot the x^2 - distribution
x_axe = 0:0.01:50; 

figure
plot(x_axe,chi2pdf(x_axe,f1),'b',x_axe,chi2pdf(x_axe,f2),'r');
title('x^2-distribution');
xlabel('Degrees of freedom');
ylabel('Density function');
legend('x^2_f_1','x^2_f_2');

%Calculate the confidence limits of x^2-Distribution
% S = 95%  a = 0.05 
a1chi2_95 = s1*sqrt(f1/chi2inv(0.975,f1));   % 1-a/2
b1chi2_95 = s1*sqrt(f1/chi2inv(0.025,f1));   %  a/2 

a2chi2_95 = s2*sqrt(f2/chi2inv(0.975,f2));   
b2chi2_95 = s2*sqrt(f2/chi2inv(0.025,f2));    


%Homework
% S = 99% a = 0.01
a1chi2_99 = s1*sqrt(f1/chi2inv(0.995,f1));
b1chi2_99 = s1*sqrt(f1/chi2inv(0.005,f1));

a2chi2_99 = s1*sqrt(f2/chi2inv(0.995,f2));
b2chi2_99 = s1*sqrt(f2/chi2inv(0.005,f2));

%Statistical test for a = 0.05 S = 95%  
% For epoch2011
T_chi21 = (f1*s1^2)/0.0015^2;
chi2_lo_1 = chi2inv(0.025,f1);
chi2_up_1 = chi2inv(0.975,f1); 

if chi2_lo_1<T_chi21 && T_chi21<chi2_up_1
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end
 
 %For epoch2012
 T_chi22 = (f2*s2^2)/0.0015^2;
 chi2_lo_2 = chi2inv(0.025,f2);
 chi2_up_2 = chi2inv(0.975,f2); 
 
 if chi2_lo_2<T_chi22 && T_chi22<chi2_up_2
    disp('Fails to reject the Ho.')
else
    disp('Rejects the Ho.')
end






