function [H,val,k]=gradient(fun,gfun,X0,epsilon,alpha) %x0是H(:,m)的初始值
% 功能: 用最速下降法求解无约束问题:  min f(x)
%输入:  x0是初始点, fun, gfun分别是目标函数和梯度
%输出:  x, val分别是近似最优点和最优值,  k是迭代次数.
maxk=20000;   %最大迭代次数
% % % rho=0.5;sigma=0.4;
k=0;%  epsilon=-1.32e+3;


while(k<maxk)
    g=feval(gfun,X0);  %计算梯度
    d=-g;    %计算搜索方向
     val0=feval(fun,X0);
    
     k=k+1;
    if(val0<epsilon)
        break; 
    end
      X0=X0+alpha*d;  
      % X0=X0./repmat(max(1,sqrt(sum(X0.*X0,1)+eps)),size(X0,1),1);
      val0=feval(fun,X0);   
end

H=X0;
val=feval(fun,X0);
end