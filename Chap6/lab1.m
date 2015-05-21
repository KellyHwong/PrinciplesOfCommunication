%仿真各种基带波形及其频谱
clc,clear,close all;
%随机产生消息码
num_of_msg = 1000;
msg_code = randi([0,1],1,num_of_msg);
ami_code=AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

%码元速率
Rs = 100;
%采样频率
r=20;
Fs = r*Rs;
%时间轴
totalTime = length(msg_code)/Rs;
deltaTime = 1/Rs/r;
tt = 0:deltaTime:totalTime-deltaTime;


%% 使用原消息码
%单极性NRZ波形
msg_spnrz = singlePolarNRZ(msg_code,r);
%单极性RZ波形（占空比50%）
msg_sprz = singlePolarRZ(msg_code,r);

N = length(msg_spnrz);
%画时域图像
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,0,2]);
title('原始信息码的单极性NRZ');xlabel('时间/s');ylabel('信号幅值');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,0,2]);
title('原始信息码的单极性RZ');xlabel('时间/s');ylabel('信号幅值');

%功率谱
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%模拟域频率
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('原始信息码的单极性NRZ');xlabel('频率/Hz');ylabel('功率谱');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('原始信息码的单极性RZ');xlabel('频率/Hz');ylabel('功率谱');

%% 使用AMI码
%单极性NRZ波形
msg_spnrz = singlePolarNRZ(ami_code,r);
%单极性RZ波形（占空比50%）
msg_sprz = singlePolarRZ(ami_code,r);

N = length(msg_spnrz);
%画时域图像
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,-2,2]);
title('AMI的单极性NRZ');xlabel('时间/s');ylabel('信号幅值');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,-2,2]);
title('AMI的单极性RZ');xlabel('时间/s');ylabel('信号幅值');

%功率谱
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%模拟域频率
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('AMI的单极性NRZ');xlabel('频率/Hz');ylabel('功率谱');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('AMI的单极性RZ');xlabel('频率/Hz');ylabel('功率谱');

%% 使用HDB3码
%单极性NRZ波形
msg_spnrz = singlePolarNRZ(hdb3_code,r);
%单极性RZ波形（占空比50%）
msg_sprz = singlePolarRZ(hdb3_code,r);

N = length(msg_spnrz);
%画时域图像
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,-2,2]);
title('HDB3的单极性NRZ');xlabel('时间/s');ylabel('信号幅值');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,-2,2]);
title('HDB3的单极性RZ');xlabel('时间/s');ylabel('信号幅值');

%功率谱
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%模拟域频率
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('HDB3的单极性NRZ');xlabel('频率/Hz');ylabel('功率谱');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('HDB3的单极性RZ');xlabel('频率/Hz');ylabel('功率谱');
