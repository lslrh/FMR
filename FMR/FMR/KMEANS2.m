function [nmi,ACC,f,RI] = KMEANS2(X, k,gt)
C = kmeans(X, k);
[A nmi avgent] = compute_nmi(gt,C);
ACC = Accuracy(C,double(gt));
[f,p,r] = compute_f(gt,C);
[AR,RI,MI,HI]=RandIndex(gt,C);
end