%仿真基带信号的接收、眼图
clc, clear,close all;
%% 设计升余弦滚降滤波器
alpha = 0.2;% alpha在[0,1]之间
Fd=200;
%码元速率
Rs = 100;
%采样频率
Fs = 20*Rs;
rate=Fs/Rs;

[h,a]=rcosine(Fd,Fs,'fir',alpha);

%% 随机产生消息码
num_of_msg = 100;%码元个数
msg_code = randi([0,1],1,num_of_msg);
ami_code=AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

%单极性NRZ波形
spnrz = singlePolarNRZ(msg_code,rate);
%转化为双极性波形
dpnrz = spnrz*2-1;

%% 添加噪声
mu = 0; sigma = 0.5;%sigma^2/2是噪声功率
noise = randn(1,length(dpnrz));
noise = noise*sigma+mu;
dpnrz_with_noise = dpnrz + noise;

%% 通过升余弦滚降滤波器
recv = conv_m(dpnrz_with_noise,1:length(dpnrz_with_noise),h,1:length(h));

%时间轴
totalTime = length(msg_code)/Rs;
deltaTime = 1/Rs/rate;
tt = 0:deltaTime:totalTime-deltaTime;

figure(1);
subplot(3,1,1);
plot(tt,dpnrz(1:length(tt)));axis([0,1,-2,2]);
xlabel('时间/s');title('双极性信号');
subplot(3,1,2);
plot(tt,dpnrz_with_noise(1:length(tt)));
xlabel('时间/s');title('双极性信号，添加加性噪声');
subplot(3,1,3);
plot(tt,recv(1:length(tt)));axis([0,1,-20,20]);
xlabel('时间/s');title('收到的双极性信号');

%% 画眼图
figure(2);
eye_num = 3;
% 将相邻码元的波形重叠在一起
hold on;
% 注意i从2开始，即第二个码元，跳过了滤波器过渡的阶段
for i =2 : floor(num_of_msg/eye_num)
    plot(tt(1:rate*eye_num),...
        recv(rate*eye_num*(i-1)+1:rate*eye_num*i),...
        'Color',[0 0.4470 0.7410] );
end
title('眼图');