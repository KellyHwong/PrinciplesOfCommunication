function encode = AMI_encode(msg_code)
% AMI_encode AMI����
% @Author: KellyHwong
% @Update: 2015.5.14
% ������Ϣ��
% ���AMI��

%��-1��ʼ����
flag = -1;
encode = zeros(1,length(msg_code));
for i = 1:length(msg_code)
    if 1==msg_code(i)
        %���Ž���
        encode(i)=flag;
        flag = -flag;
    end
end
end