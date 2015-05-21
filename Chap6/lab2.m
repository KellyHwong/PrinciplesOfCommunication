%��������źŵĽ��ա���ͼ
clc, clear,close all;
%% ��������ҹ����˲���
alpha = 0.2;% alpha��[0,1]֮��
Fd=200;
%��Ԫ����
Rs = 100;
%����Ƶ��
Fs = 20*Rs;
rate=Fs/Rs;

[h,a]=rcosine(Fd,Fs,'fir',alpha);

%% ���������Ϣ��
num_of_msg = 100;%��Ԫ����
msg_code = randi([0,1],1,num_of_msg);
ami_code=AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

%������NRZ����
spnrz = singlePolarNRZ(msg_code,rate);
%ת��Ϊ˫���Բ���
dpnrz = spnrz*2-1;

%% �������
mu = 0; sigma = 0.5;%sigma^2/2����������
noise = randn(1,length(dpnrz));
noise = noise*sigma+mu;
dpnrz_with_noise = dpnrz + noise;

%% ͨ�������ҹ����˲���
recv = conv_m(dpnrz_with_noise,1:length(dpnrz_with_noise),h,1:length(h));

%ʱ����
totalTime = length(msg_code)/Rs;
deltaTime = 1/Rs/rate;
tt = 0:deltaTime:totalTime-deltaTime;

figure(1);
subplot(3,1,1);
plot(tt,dpnrz(1:length(tt)));axis([0,1,-2,2]);
xlabel('ʱ��/s');title('˫�����ź�');
subplot(3,1,2);
plot(tt,dpnrz_with_noise(1:length(tt)));
xlabel('ʱ��/s');title('˫�����źţ���Ӽ�������');
subplot(3,1,3);
plot(tt,recv(1:length(tt)));axis([0,1,-20,20]);
xlabel('ʱ��/s');title('�յ���˫�����ź�');

%% ����ͼ
figure(2);
eye_num = 3;
% ��������Ԫ�Ĳ����ص���һ��
hold on;
% ע��i��2��ʼ�����ڶ�����Ԫ���������˲������ɵĽ׶�
for i =2 : floor(num_of_msg/eye_num)
    plot(tt(1:rate*eye_num),...
        recv(rate*eye_num*(i-1)+1:rate*eye_num*i),...
        'Color',[0 0.4470 0.7410] );
end
title('��ͼ');