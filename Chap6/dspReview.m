% ��ϰ�����źŴ���
clear,close all;
%�����������Ҳ��ĵ���
f1 = 10; f2 = 20; f3 = 30;
fs = 1000;%����Ƶ��100Hz
tt = 0:1/fs:1;
%����Ƶ�ʲ�ͬ�ĵ�������Ҳ��ĵ���
x=sin(2*pi*f1*tt)+sin(2*pi*f2*tt)+sin(2*pi*f3*tt);
%fft�任����������ɢ����Ҷ�任
X=fft(x);
%DTFT�Ƕ�CTFT��Ƶ�ʹ�һ����omiga=Omiga*Ts=2*pi*f/fs
%���ߣ�f=omiga*fs/2/pi
%DFT/FFT�Ƕ�DTFT��ȡ��
omiga = 0:2*pi/length(x):2*pi;omiga = omiga(1:length(x));
stem(omiga,abs(X));
%ģ����Ƶ��
f=omiga*fs/2/pi;
figure();
stem(f,abs(X));
xlabel('ģ����Ƶ��/Hz');ylabel('�źŷ���');