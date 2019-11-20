function [val] = norm21(A)
col_num = size(A,2);
val = 0;
for i=1:col_num
    val = val + norm(A(:,i),2);
end