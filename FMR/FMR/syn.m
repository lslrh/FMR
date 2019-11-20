% generate synthetic data 
% original space:500-dimension
% 6 subspace: 10,12,14,16,18,20
% subspace numbers: 25,30,35,40,45,50 sum=225
% add noise: 20% perturbation
clear;clc;close all;
% 产生模拟数据
data = zeros(500,225);
gt = zeros(225,1);
%subspace data
d1 = rand(10,25); d2 = rand(12,30); d3 = rand(14,35); d4 = rand(16,40);
d5 = rand(18,45); d6 = rand(20,50);
%data
data(1:10,1:25) = d1; data(20:31,26:55) = d2; data(50:63,56:90) = d3; 
data(100:115,91:130) = d4; data(400:417,131:175) = d5; data(450:469,176:225) = d6;
gt(1:25,1) = 1; gt(26:55,1) = 2; gt(56:90,1) = 3; 
gt(91:130,1) = 4; gt(131:175,1) = 5; gt(176:225,1) = 6; 
%%%%%%%%%%%%%
%generate multiple views
P1 = rand(1000,500);
P2 = rand(1000,500);
P3 = rand(1000,500);
P1 = P1./repmat(sqrt(sum(P1.^2,1)),size(P1,1),1);
P2 = P2./repmat(sqrt(sum(P2.^2,1)),size(P2,1),1);
P3 = P3./repmat(sqrt(sum(P3.^2,1)),size(P3,1),1);

Noise1 = rand(1000,225);
Noise2 = rand(1000,225);
Noise3 = rand(1000,225);
pl = randperm(225);
Noise1(:,pl(23:225)) = 0;
Noise2(:,pl(23:225)) = 0;
Noise3(:,pl(23:225)) = 0;


X{1} = P1*data+Noise1+rand(1000,225)*0.1;
X{2} = P2*data+Noise2+rand(1000,225)*0.1;
%X{3} = P3*data+Noise3+rand(1000,225)*0.5;






