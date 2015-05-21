function PWMsample = PWMgen(signal, Ns)
% PWM������
% Ns: һ�������ڵĵ���

%���Ƚ�signal��һ��
minOf = min(signal); maxOf = max(signal);
signal = signal-minOf;
signal = signal/(maxOf-minOf);
for i = 1:length(signal)
    duty = signal(i);
    PWMsample(Ns*(i-1)+1:Ns*i) = [ones(1,ceil(Ns*duty)),...
        zeros(1,floor(Ns*(1-duty)))];
end