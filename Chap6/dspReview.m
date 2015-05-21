% 复习数字信号处理
clear,close all;
%产生几个正弦波的叠加
f1 = 10; f2 = 20; f3 = 30;
fs = 1000;%采样频率100Hz
tt = 0:1/fs:1;
%三个频率不同的等振幅正弦波的叠加
x=sin(2*pi*f1*tt)+sin(2*pi*f2*tt)+sin(2*pi*f3*tt);
%fft变换，即快速离散傅里叶变换
X=fft(x);
%DTFT是对CTFT的频率归一化，omiga=Omiga*Ts=2*pi*f/fs
%或者，f=omiga*fs/2/pi
%DFT/FFT是对DTFT的取样
omiga = 0:2*pi/length(x):2*pi;omiga = omiga(1:length(x));
stem(omiga,abs(X));
%模拟域频率
f=omiga*fs/2/pi;
figure();
stem(f,abs(X));
xlabel('模拟域频率/Hz');ylabel('信号幅度');