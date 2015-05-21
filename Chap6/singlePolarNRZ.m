function spnrz = singlePolarNRZ(msg_code,r)
% singlePolarNRZ
% @Author: KellyHwong
% @Update: 2015.5.14
% r 采样比率，每个码元多少个点

%总共r*length(msg_code)个点
%虽然是单极性信号，但是输入AMI码后即特殊的单极性信号（双极性？）
spnrz = zeros(1,r*length(msg_code));
for i = 1:length(msg_code)
    if(1==abs(msg_code(i)))
        spnrz(r*(i-1)+1:r*i) = msg_code(i);
    end
end
end