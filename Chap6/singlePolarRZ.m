function sprz = singlePolarRZ(msg_code,r)
% singlePolarRZ 单极性归零信号
% @Author: KellyHwong
% @Update: 2015.5.14
% r 采样比率，每个码元多少个点

%总共r*length(msg_code)个点
sprz = zeros(1,r*length(msg_code));
for i = 1:length(msg_code)
    if(1==abs(msg_code(i)))
        % 占空比50%
        sprz(r*(i-1)+1:r*i) = msg_code(i)*[ones(1,ceil(r/2),1),zeros(1,floor(r/2))];
    end
end
end