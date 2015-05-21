function sprz = singlePolarRZ(msg_code,r)
% singlePolarRZ �����Թ����ź�
% @Author: KellyHwong
% @Update: 2015.5.14
% r �������ʣ�ÿ����Ԫ���ٸ���

%�ܹ�r*length(msg_code)����
sprz = zeros(1,r*length(msg_code));
for i = 1:length(msg_code)
    if(1==abs(msg_code(i)))
        % ռ�ձ�50%
        sprz(r*(i-1)+1:r*i) = msg_code(i)*[ones(1,ceil(r/2),1),zeros(1,floor(r/2))];
    end
end
end