%������ֻ������μ���Ƶ��
clc,clear,close all;
%���������Ϣ��
num_of_msg = 1000;
msg_code = randi([0,1],1,num_of_msg);
ami_code=AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

%��Ԫ����
Rs = 100;
%����Ƶ��
r=20;
Fs = r*Rs;
%ʱ����
totalTime = length(msg_code)/Rs;
deltaTime = 1/Rs/r;
tt = 0:deltaTime:totalTime-deltaTime;


%% ʹ��ԭ��Ϣ��
%������NRZ����
msg_spnrz = singlePolarNRZ(msg_code,r);
%������RZ���Σ�ռ�ձ�50%��
msg_sprz = singlePolarRZ(msg_code,r);

N = length(msg_spnrz);
%��ʱ��ͼ��
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,0,2]);
title('ԭʼ��Ϣ��ĵ�����NRZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,0,2]);
title('ԭʼ��Ϣ��ĵ�����RZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');

%������
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%ģ����Ƶ��
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('ԭʼ��Ϣ��ĵ�����NRZ');xlabel('Ƶ��/Hz');ylabel('������');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('ԭʼ��Ϣ��ĵ�����RZ');xlabel('Ƶ��/Hz');ylabel('������');

%% ʹ��AMI��
%������NRZ����
msg_spnrz = singlePolarNRZ(ami_code,r);
%������RZ���Σ�ռ�ձ�50%��
msg_sprz = singlePolarRZ(ami_code,r);

N = length(msg_spnrz);
%��ʱ��ͼ��
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,-2,2]);
title('AMI�ĵ�����NRZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,-2,2]);
title('AMI�ĵ�����RZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');

%������
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%ģ����Ƶ��
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('AMI�ĵ�����NRZ');xlabel('Ƶ��/Hz');ylabel('������');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('AMI�ĵ�����RZ');xlabel('Ƶ��/Hz');ylabel('������');

%% ʹ��HDB3��
%������NRZ����
msg_spnrz = singlePolarNRZ(hdb3_code,r);
%������RZ���Σ�ռ�ձ�50%��
msg_sprz = singlePolarRZ(hdb3_code,r);

N = length(msg_spnrz);
%��ʱ��ͼ��
figure();subplot(2,1,1);
plot(tt,msg_spnrz);axis([0,1,-2,2]);
title('HDB3�ĵ�����NRZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');
subplot(2,1,2);
plot(tt,msg_sprz);axis([0,1,-2,2]);
title('HDB3�ĵ�����RZ');xlabel('ʱ��/s');ylabel('�źŷ�ֵ');

%������
MSG_SPNRZ = fft(msg_spnrz);
MSG_SPRZ = fft(msg_sprz);
P_MSG_SPNRZ = MSG_SPNRZ.*conj(MSG_SPNRZ)/N;
P_MSG_SPRZ = MSG_SPRZ.*conj(MSG_SPRZ)/N;
omiga = 0:2*pi/N:2*pi;omiga = omiga(1:N);
%ģ����Ƶ��
ff=omiga*Fs/2/pi;
figure();subplot(2,1,1);
plot(ff,abs(P_MSG_SPNRZ));axis([0,Fs/2,0,10]);
title('HDB3�ĵ�����NRZ');xlabel('Ƶ��/Hz');ylabel('������');
subplot(2,1,2);
plot(ff,abs(P_MSG_SPRZ));axis([0,Fs/2,0,10]);
title('HDB3�ĵ�����RZ');xlabel('Ƶ��/Hz');ylabel('������');
