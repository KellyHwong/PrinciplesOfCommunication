function encode = AMI_encode(msg_code)
% AMI_encode AMI编码
% @Author: KellyHwong
% @Update: 2015.5.14
% 输入消息码
% 输出AMI码

%从-1开始编码
flag = -1;
encode = zeros(1,length(msg_code));
for i = 1:length(msg_code)
    if 1==msg_code(i)
        %传号交替
        encode(i)=flag;
        flag = -flag;
    end
end
end