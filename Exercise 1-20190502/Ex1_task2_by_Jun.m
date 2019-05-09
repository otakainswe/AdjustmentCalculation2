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
 x = load('distances.txt');
 
%calculate the mean value
 x_bar = mean(x);
 
%standard deviation of single measurements
 v_x = x - x_bar*ones(length(x),1);
% s_x = sqrt((v_x'*v_x)/(length(x)-1));  
s_x = sqrt((v_x'*v_x)/length(x));
 
%standard deviation of the mean value
s_x_mean = s_x/sqrt(length(x));

%calculate and plot the residuals
figure  
bar(v_x)
title('Residuals for distances');
xlabel('Number of residuals');
ylabel('Residuals');

 
%Calculate the confidence limits of the expectation value
% T distribution, the range of an expctation resides at a selected level of confidence(a)
% is [mean(x)- t_a/2 *S/sqrt(n)  ,mean(x)+ t_a/2 *S/sqrt(n)]
% for S1 = 95% a=0.05
t_S1 =  tinv(0.975,length(x)-1) ;
x1_e_low = x_bar - t_S1*s_x_mean ;
x1_e_up =  x_bar + t_S1*s_x_mean ;
% for S2 = 99% a =0.01
t_S2 =  tinv(0.995,length(x)-1) ;
x2_e_low = x_bar - t_S2*s_x/sqrt(length(x)) ;
x2_e_up =  x_bar + t_S2*s_x/sqrt(length(x)) ;







