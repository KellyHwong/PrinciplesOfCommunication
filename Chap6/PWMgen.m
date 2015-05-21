function PWMsample = PWMgen(signal, Ns)
% PWM波发生
% Ns: 一个周期内的点数

%首先将signal归一化
minOf = min(signal); maxOf = max(signal);
signal = signal-minOf;
signal = signal/(maxOf-minOf);
for i = 1:length(signal)
    duty = signal(i);
    PWMsample(Ns*(i-1)+1:Ns*i) = [ones(1,ceil(Ns*duty)),...
        zeros(1,floor(Ns*(1-duty)))];
end