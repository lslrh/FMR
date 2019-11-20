function   H =  updateH(H,K_x,Y1,Z,E,N,mu,epsilon,alpha)
   
 [H, val,k]= gradient( @fun,@gfun,H,epsilon,alpha);
 %out.fval = -2*out.fval; % convert the function value to the sum of eigenvalues

 function [F, G] = fun(H) 
   
     F = -trace(K_x*H'*H)/(N-1)^2+trace(Y1'*(H-H*Z-E))+mu/2*norm(H-H*Z-E,'fro');

 end

function  G = gfun(H) 

     G=-2*H*K_x/(N-1)^2+Y1*(eye(N)-Z)'+mu*(H-H*Z-E)*(eye(N)-Z'); 
     
 end
end