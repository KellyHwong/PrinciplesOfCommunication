%仿真PWM信号
clc,clear,close all;
f0 = 1000;
fS = 13000;
tx = 0:1/fS:2-1/fS;%2s的信号
x = sin(2*pi*f0*tx);
figure();
plot(tx,x);

X = fft(x);
omiga = 0:2*pi/length(x):2*pi;omiga = omiga(1:length(x));
fX=omiga*fS/2/pi;
figure();
plot(fX,abs(X));

Ns = 1000;
fPWM = fS;
fSamplePWM = Ns*fPWM;
pwm = PWMgen(x,Ns);
tpwm = 0:1/fSamplePWM:2-1/fSamplePWM;%2s的PMW信号
figure();
plot(tpwm,pwm);
%数字域频率
omiga = 0:2*pi/length(pwm):2*pi;omiga = omiga(1:length(pwm));
%模拟域频率
ff=omiga*fSamplePWM/2/pi;
pwm_fft = fft(pwm);
figure();
plot(ff,abs(pwm_fft));axis tight;