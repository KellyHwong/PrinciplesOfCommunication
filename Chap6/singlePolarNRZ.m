function spnrz = singlePolarNRZ(msg_code,r)
% singlePolarNRZ
% @Author: KellyHwong
% @Update: 2015.5.14
% r �������ʣ�ÿ����Ԫ���ٸ���

%�ܹ�r*length(msg_code)����
%��Ȼ�ǵ������źţ���������AMI�������ĵ������źţ�˫���ԣ���
spnrz = zeros(1,r*length(msg_code));
for i = 1:length(msg_code)
    if(1==abs(msg_code(i)))
        spnrz(r*(i-1)+1:r*i) = msg_code(i);
    end
end
end