function [ x,n ] = stepseq(n0,n1,n2)
%stepseq 单位阶跃序列的Matlab函数
%  n0: 阶跃起始点
%  n1, n2: 序列的起始点和结束点
n= n1:n2;x= 0<=(n-n0);
x=double(x);
end

