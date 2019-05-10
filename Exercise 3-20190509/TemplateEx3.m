%--------------------------------------------------------------------------
%   
%   SELECTED SECTIONS OF ADJUSTMENT CALCULATION 
%   Evaluation and processing of singular matrices
% 
%   Author         : Pasioti Anastasia
%   Version        : May 17, 2017
%   Last changes   : Mar. 26, 2019
%
%--------------------------------------------------------------------------

clc;
clear all;
close all;

%--------------------------------------------------------------------------
% Calculate the rank of the design matrix A
%--------------------------------------------------------------------------

A=[-9 -10 -7 -1 -8;
   -3 5 -5 8 3; 
   8 0 8 -8 0;
   -16 0 -10 16 6;
   3 8 0 5 5;
   -13 2 -7 15 8;
   4 2 10 -2 8;
   15 8 4 -7 -3;
   2 6 0 4 4;
   7 2 -1 -5 -6];

r_A = rank(A);

d = 5 - r_A; % rank deficiency = unknown - rank of design matrix
%--------------------------------------------------------------------------
% Calculate the normal matrix N and the determinant
%--------------------------------------------------------------------------

N = A'*A; 

detN = det(N);

%{
Determinant of N = 0. That means normal matrix N is singular and
 cannot have inverse matrix.
%}

r_N = rank(N); 
% rank of N = 3. It's not maximal and rank deficiency is 2.

%--------------------------------------------------------------------------
% Calculate 3 different g-inverses of the matrix N
%--------------------------------------------------------------------------
%First g-inverse
B1 = randi([-500 500],5,2); % two vectors with 5 random numbers from -500 to 500. 

Next1 = [N B1; B1' zeros(2,2)];

Next1_inv = inv(Next1);

Q_11_1 = Next1_inv(1:5,1:5); % N^-

N1 = N*Q_11_1*N;

t1 = trace(Q_11_1);

%Second g-inverse
B2 = randi([-100 100],5,2); % two vectors with 5 random number from -100 to 100. 

Next2 = [N B2; B2' zeros(2,2)];

Next2_inv = inv(Next2);

Q_11_2 = Next2_inv(1:5,1:5);

N2 = N*Q_11_2*N;

t2 = trace(Q_11_2);


%Third g-inverse
B3 = randi([-300 300],5,2); % two vectors with 5 random number from -300 to 300. 

Next3 = [N B3; B3' zeros(2,2)];

Next3_inv = inv(Next3);

Q_11_3 = Next3_inv(1:5,1:5);

N3 = N*Q_11_3*N;

t3 = trace(Q_11_3);

%{
N = N1 = N2 = N3
Values of three traces are different.
%}

%--------------------------------------------------------------------------
% Calculate the eigenvalues of N
%--------------------------------------------------------------------------

lambda = eig(N);
% Two eigenvalues are zero because the rank deficiency is two.

%--------------------------------------------------------------------------
% Calculate the eigenvectors of N
%--------------------------------------------------------------------------

[v lambda] = eig(N);

vv = [v(:,1) v(:,2)];

Next_v = [N vv; vv' zeros(2,2)];

Next_v_inv = inv(Next_v);

Q_11_4 = Next_v_inv(1:5,1:5);

N4 = N*Q_11_4*N;

t4 = trace(Q_11_4);

% N = N4
% trace of N4 is the minimal.

%--------------------------------------------------------------------------
% Calculate the pseudo inverse of N
%--------------------------------------------------------------------------

p_N = pinv(N);

t_N = trace(p_N);


% trace of pseudo inverse is the minimal and std of adjusted value become
% minimal as well.
