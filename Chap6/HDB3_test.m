%HDB3±àÂë²âÊÔ
close all;clear;clc;
%ÏûÏ¢Âë
%msg_code=[1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1];
msg_code = randi([0,1],1,1000);
ami_code=AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

hdb3_decode = HDB3_decode(hdb3_code);