function hdb3_code = HDB3_encode(msg_code)
% HDB3_encode HDB3����
% @Author: KellyHwong
% @Update: 2015.5.13
% ������Ϣ��
% ���HDB3��

%�ȱ�AMI��
ami_code = AMI_encode(msg_code);
zeroCounter = 0;
amiCount = 0;
for i = 1:length(ami_code)
    if 0~=ami_code(i)
        %��ǰAMI�������
        amiFlag = ami_code(i);
        amiCount = amiCount + 1;
        %��ʼ����ǣ���һ��V���һ������AMI����ͬ��������Ҫ����
        if 1==amiCount
            %VҲҪ����
            hdbFlag = amiFlag;
        end
        zeroCounter = 0;
    else
        %��0�ĸ���
        zeroCounter = zeroCounter + 1;
        %����ﵽ4���ظ���0
        if 4==zeroCounter && 0~=amiCount
            %��ǰλ�õ�HDB3��ΪhdbFlag
            ami_code(i) = hdbFlag;
            %V�Ľ���
            hdbFlag = -hdbFlag;
            %���V��AMI����ͬ����Ӧ�ò���B��B������V��ͬ
            if ami_code(i)~=ami_code(i-4)
                ami_code(i-3) = ami_code(i);
            end
            %����0������
            zeroCounter = 0;
        end
    end
end
hdb3_code = ami_code;
end