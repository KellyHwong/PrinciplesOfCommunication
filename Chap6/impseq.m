function [x,n] = impseq(n0,n1,n2)
%impseq 单位取样序列的Matlab函数
%  n0: 取样点（函数值为1的点）
%  n1, n2: 序列的起始点和结束点
n= n1:n2;x= 0==(n-n0);
x=double(x);
end

