%C/A�뷢����?
function [c] = ca_code_generator(ca_length)
%C/A������10���Ĵ�����ʼ��?
reg1=zeros(1,10);
reg2=zeros(1,10);

reg1_t=zeros(1,10);
reg2_t=zeros(1,10);
%��ʼ��
reg1(1)=1;
reg2(1)=1;
%forѭ��������ca_length��C/A��?
c=zeros(1,ca_length);
for i=1:ca_length 
%�����i��C/A��?
    c(i)=mod(reg1(10)+reg2(3)+reg2(8),2);
%����10���Ĵ���ѭ����λ????
for j=1:9
    reg1_t(11-j)=reg1(10-j);
    reg2_t(11-j)=reg2(10-j);
end
%����C/A�����ͼ������1���Ĵ�����ֵ?????
reg1_t(1)=mod(reg1(3)+reg1(10),2);
reg2_t(1)=mod(reg2(2)+reg2(3)+reg2(6)+reg2(8)+reg2(9)+reg2(10),2);
%��ѭ����λ�Ľ�����棬�����´���������?????
reg1=reg1_t;
reg2=reg2_t;
end
