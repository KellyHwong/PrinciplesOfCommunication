%����PWM�ź�
clc,clear,close all;
f0 = 1000;
fS = 13000;
tx = 0:1/fS:2-1/fS;%2s���ź�
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
tpwm = 0:1/fSamplePWM:2-1/fSamplePWM;%2s��PMW�ź�
figure();
plot(tpwm,pwm);
%������Ƶ��
omiga = 0:2*pi/length(pwm):2*pi;omiga = omiga(1:length(pwm));
%ģ����Ƶ��
ff=omiga*fSamplePWM/2/pi;
pwm_fft = fft(pwm);
figure();
plot(ff,abs(pwm_fft));axis tight;