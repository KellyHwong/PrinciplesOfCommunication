clc,clear,close all;
%����Ƶ��
Fs = 2000;
Fd = 1000;
alpha = 0.2;
[h,a]=rcosine(Fd,Fs,'fir',alpha);
H=fft(h);

omiga = 0:2*pi/length(h):2*pi;
omiga = omiga(1:length(h));

%ģ����Ƶ��
f=omiga*Fs/2/pi;
subplot(2,1,1);
stem(f,abs(H));
subplot(2,1,2);
stem(h);