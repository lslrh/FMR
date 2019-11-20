%% flexible representation learning method
clear;clc;close all;
% 
% 
load('yale_mtv.mat');
fprintf('Latent representation multiview subspace clustering\n');
numClust = size(unique(gt),1);

%%   
lambda1 = 1e-4;   lambda2 = 1e-8;  epsilon =  -5e10; alpha = 100; K = 200; %yale
%lambda1 = 1e-4;   lambda2 = 1e-8;  epsilon =  -5e8; alpha = 100; K = 300; %ORL
%lambda1 = 1e-3;   lambda2 = 1e-6;  epsilon =  -5e8; alpha = 10; K = 200; %BBCSport
%lambda1 = 1e-4;   lambda2 = 1e-7;  epsilon =  -5e5; alpha = 10; K = 800; %Notting Hill
%lambda1 = 1e-4;   lambda2 = 1e-6;  epsilon =  -5e7; alpha = 100; K = 200; %MSRC-v1

[nmi,ACC,f,RI,H] = HSIC(X,gt,numClust,lambda1,lambda2,K,epsilon,alpha);           
result=[nmi,ACC,f,RI]


 



