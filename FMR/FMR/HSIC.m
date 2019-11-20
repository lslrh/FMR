function [nmi,ACC,f,RI,H] = HSIC(X,gt,cls_num,lambda1,lambda2,K,epsilon,alpha)
%% Initialize P,H,Z,E_h,E_r,J,F and Y_1,Y_2,Y_3,Y_4
V = size(X,2); %nunber of views

N = size(X{1},2); % number of data points

for i=1:V
    X{i} = X{i}./(repmat(sqrt(sum(X{i}.^2,1)),size(X{i},1),1)+eps);
    %X{i} = X{i}(:,1:100);
end

for i=1:V
%   for i=2:2
    a(i)=1/V;
    D{i} = size(X{i},1); % dimension of each view
end
SD = 0;
M = [];

 for i=1:V
    SD = SD + D{i};
    M = [M;X{i}];
 end

H = rand(K,N); 

E = zeros(K,N);   %K是指定的
Z = zeros(N,N); J = zeros(N,N);
Y1 = zeros(K,N);Y2 = zeros(N,N);

L=eye(N)-1/N*ones(N);
K_x=L*(M'*M)*L;

IsConverge = 0;    
mu = 1e-5;
%lambda = 100;
pho = 1.1;
max_mu = 1e10;
max_iter =500;
iter = 1;
epsilong = 1e-9;

Y=[];
%% updating variables...
while (IsConverge == 0&&iter<=max_iter)

    % update H
    H= updateH(H,K_x,Y1,Z,E,N,mu,epsilon,alpha);
    
    % update J
    J = softth((Z+Y2/mu)+eye(N)*1e-8,lambda1/mu);    %lambda1没有定义
 
    % update Z
    Z = inv(H'*H+eye(N))*((J+H'*H-H'*E)+(H'*Y1-Y2)/mu);
    
    % update E 
    G = H-H*Z+Y1/mu;
    [E] = solve_l1l2(G,lambda2/mu);
     
    Y=[Y norm(Z-J,inf)];

   % updata multipliers
  
    Y1 = Y1+ mu*(H-H*Z-E);
    Y2 = Y2+ mu*(Z-J);
    mu = min(pho*mu, max_mu);  %这句是什么意思
    
    % convergence conditions
    thrsh = 0.0001;
    if(norm(H-H*Z-E,inf)<thrsh && norm(Z-J,inf)<thrsh)
        IsConverge = 1;
    end
    cov_val(iter) = norm(Z-J,inf)

 if (iter==1 || mod(iter,50)==0 || IsConverge == 1)
        disp(['iter ' num2str(iter) ',mu=' num2str(mu,'%2.1e') ...
            ',rank=' num2str(rank(Z,1e-4*norm(Z,2))) ',cov_val(iter)' num2str(cov_val(iter),'%2.3e')]);
 end   
    iter = iter + 1
end
 [nmi,ACC,f,RI]=clustering(abs(Z)+abs(Z'), cls_num, gt);
