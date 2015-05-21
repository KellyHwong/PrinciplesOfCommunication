%C/A码发生器?
function [c] = ca_code_generator(ca_length)
%C/A码两个10级寄存器初始化?
reg1=zeros(1,10);
reg2=zeros(1,10);

reg1_t=zeros(1,10);
reg2_t=zeros(1,10);
%初始化
reg1(1)=1;
reg2(1)=1;
%for循环，产生ca_length个C/A码?
c=zeros(1,ca_length);
for i=1:ca_length 
%输出第i个C/A码?
    c(i)=mod(reg1(10)+reg2(3)+reg2(8),2);
%两个10级寄存器循环移位????
for j=1:9
    reg1_t(11-j)=reg1(10-j);
    reg2_t(11-j)=reg2(10-j);
end
%根据C/A码产生图，给第1个寄存器赋值?????
reg1_t(1)=mod(reg1(3)+reg1(10),2);
reg2_t(1)=mod(reg2(2)+reg2(3)+reg2(6)+reg2(8)+reg2(9)+reg2(10),2);
%将循环移位的结果保存，进行下次随机码产生?????
reg1=reg1_t;
reg2=reg2_t;
end
