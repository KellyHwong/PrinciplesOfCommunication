clc,clear,close all;
%%对c/A码进行BPSK调制
length=10;
n_boc=1;
m_boc=2;
Nc=32; %一个周期内的采样点的数目
Rs=1023000;%基本频率为1.023MHz

N=length*m_boc*Nc; %采样的数量
n=1:N;
%产生一个C/A码
code=ca_code_generator(length);

wave=zeros(1,N);
for i=0:length-1
    for j=1:m_boc*Nc;
        wave(m_boc*Nc*i+j)=code(i+1);
        
    end
end
%C/A码的波形
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

%%调制
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
title('C/A码');

subplot(3,1,2);
plot(cn,square);
xlabel('Ts/m_boc=1/(m_boc*Rs)');
title('square wave');
axis([0,m_boc*length,-0.1,1.1]);
subplot(3,1,3);
%画BOC调制信号时域波形
plot(cn,x_square);
xlabel('Ts=1/Rs');
title('C/A code modulation');
axis([0,m_boc*length,-1.1,1.1]);

%频域分析
fs2=n*Rs;
B2=0.5*fs2; 
df2=fs2/N;  
f2=-B2:df2:B2-df2; 
X_square=fft(square);
MOD_X_square=fft(x_square);
figure(); 
subplot(3,1,1); 
%画C/A码频域波形 
plot(f2,fftshift(abs(fft_wave))); 
xlabel('Hz');
ylabel('Aplitude');
title('frequence spectrum of C/A code');
subplot(3,1,2); 
%画方波载波信号频域波形 
plot(f2,fftshift(abs(X_square)));
xlabel('Hz');
ylabel('|X_square|');
title('fft of square wave');
subplot(3,1,3); 
%画BOC调制信号频域波形 
plot(f2,fftshift(abs(MOD_X_square)));
xlabel('Hz');
ylabel('|MOD_X_square|');
title('fft of C/A code modulation'); 



