function [ x,n ] = stepseq(n0,n1,n2)
%stepseq ��λ��Ծ���е�Matlab����
%  n0: ��Ծ��ʼ��
%  n1, n2: ���е���ʼ��ͽ�����
n= n1:n2;x= 0<=(n-n0);
x=double(x);
end

