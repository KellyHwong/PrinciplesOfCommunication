function hdb3_code = HDB3_encode(msg_code)
% HDB3_encode HDB3编码
% @Author: KellyHwong
% @Update: 2015.5.13
% 输入消息码
% 输出HDB3码

%先编AMI码
ami_code = AMI_encode(msg_code);
zeroCounter = 0;
amiCount = 0;
for i = 1:length(ami_code)
    if 0~=ami_code(i)
        %当前AMI码的正负
        amiFlag = ami_code(i);
        amiCount = amiCount + 1;
        %初始化标记，第一个V与第一个非零AMI码相同，后面则要交替
        if 1==amiCount
            %V也要交替
            hdbFlag = amiFlag;
        end
        zeroCounter = 0;
    else
        %数0的个数
        zeroCounter = zeroCounter + 1;
        %如果达到4个重复的0
        if 4==zeroCounter && 0~=amiCount
            %当前位置的HDB3码为hdbFlag
            ami_code(i) = hdbFlag;
            %V的交替
            hdbFlag = -hdbFlag;
            %如果V与AMI码相同，则应该插入B，B符号与V相同
            if ami_code(i)~=ami_code(i-4)
                ami_code(i-3) = ami_code(i);
            end
            %重置0计数器
            zeroCounter = 0;
        end
    end
end
hdb3_code = ami_code;
end