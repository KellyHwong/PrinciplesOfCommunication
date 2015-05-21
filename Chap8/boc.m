clc,clear,close all;
%%��c/A�����BPSK����
length=10;
n_boc=1;
m_boc=2;
Nc=32; %һ�������ڵĲ��������Ŀ
Rs=1023000;%����Ƶ��Ϊ1.023MHz

N=length*m_boc*Nc; %����������
n=1:N;
%����һ��C/A��
code=ca_code_generator(length);

wave=zeros(1,N);
for i=0:length-1
    for j=1:m_boc*Nc;
        wave(m_boc*Nc*i+j)=code(i+1);
        
    end
end
%C/A��Ĳ���
cn=0:length/N:length-length/N;
figure();
subplot(2,1,1);
plot(cn,wave);
axis([0,length,-0.1,1.1]);
xlabel('Ts=1/Rs');
title('C/A code');

fs2=Rs;
B2=0.5*fs2;
df2=fs2/N;
f2=-B2:df2:B2-df2;
fft_wave=fft(wave);
subplot(2,1,2);
plot(f2,fftshift(abs(fft_wave)));
xlabel('Hz');
ylabel('Aplitude');
title('frequence spectrum of C/A code ');

%%����
square=zeros(1,N);
for t1=0:Nc:N-Nc
       for t2=1:Nc/2
           square(t1+t2)=1;
       end
end

x_square=zeros(1,N);
for mod=1:N
    x_square(mod)=(2*wave(mod)-1)*square(mod);
end
figure();
subplot(3,1,1);
plot(cn,wave);
axis([0,length,-0.1,1.1]);
xlabel('Ts=1/Rs');
title('C/A��');

subplot(3,1,2);
plot(cn,square);
xlabel('Ts/m_boc=1/(m_boc*Rs)');
title('square wave');
axis([0,m_boc*length,-0.1,1.1]);
subplot(3,1,3);
%��BOC�����ź�ʱ����
plot(cn,x_square);
xlabel('Ts=1/Rs');
title('C/A code modulation');
axis([0,m_boc*length,-1.1,1.1]);

%Ƶ�����
fs2=n*Rs;
B2=0.5*fs2; 
df2=fs2/N;  
f2=-B2:df2:B2-df2; 
X_square=fft(square);
MOD_X_square=fft(x_square);
figure(); 
subplot(3,1,1); 
%��C/A��Ƶ���� 
plot(f2,fftshift(abs(fft_wave))); 
xlabel('Hz');
ylabel('Aplitude');
title('frequence spectrum of C/A code');
subplot(3,1,2); 
%�������ز��ź�Ƶ���� 
plot(f2,fftshift(abs(X_square)));
xlabel('Hz');
ylabel('|X_square|');
title('fft of square wave');
subplot(3,1,3); 
%��BOC�����ź�Ƶ���� 
plot(f2,fftshift(abs(MOD_X_square)));
xlabel('Hz');
ylabel('|MOD_X_square|');
title('fft of C/A code modulation'); 



