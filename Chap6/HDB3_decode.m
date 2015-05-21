function ami_code = HDB3_decode(hdb3_code)
% AMI_encode AMI����
% @Author: KellyHwong
% @Update: 2015.5.14
% ����AMI��
% �����Ϣ��

% @Quote: ����ԭ����������������򿴳���ÿһ���ƻ�����V������ǰһ����
%         ����ͬ���ԣ�����B���ڣ������Ժ������ҵ��ƻ��㣬���Ҷ϶�V�Լ�
%         ǰ���������űض���������3��0���ɴ˿��Խ��AMI�롣

amiFlag = 0;
for i = 1:length(hdb3_code)
    if 0~=hdb3_code(i)
        if 1==amiFlag
            %���������ͬ�ˣ���֤����V
            if hdb3_code(i)~=expectNext
                hdb3_code(i-3:i) = 0;
                amiFlag = 0;
            %���Ų�ͬ��֤����AMI��
            else
                amiFlag = 1;
                expectNext = -hdb3_code(i);
            end
        end
        if 0~=hdb3_code(i)
            %�ҵ���AMI��
            amiFlag = 1;
            expectNext = -hdb3_code(i);
        end
    end
end
ami_code = hdb3_code;
end