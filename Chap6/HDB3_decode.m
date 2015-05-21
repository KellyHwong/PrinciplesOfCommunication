function ami_code = HDB3_decode(hdb3_code)
% AMI_encode AMI编码
% @Author: KellyHwong
% @Update: 2015.5.14
% 输入AMI码
% 输出消息码

% @Quote: 书上原话：从上述编码规则看出，每一个破坏脉冲V总是与前一非零
%         脉冲同极性（包括B在内）。可以很容易找到破坏点，并且断定V以及
%         前面三个符号必定是连续的3个0，由此可以解出AMI码。

amiFlag = 0;
for i = 1:length(hdb3_code)
    if 0~=hdb3_code(i)
        if 1==amiFlag
            %如果符号相同了，则证明是V
            if hdb3_code(i)~=expectNext
                hdb3_code(i-3:i) = 0;
                amiFlag = 0;
            %符号不同则证明是AMI码
            else
                amiFlag = 1;
                expectNext = -hdb3_code(i);
            end
        end
        if 0~=hdb3_code(i)
            %找到了AMI码
            amiFlag = 1;
            expectNext = -hdb3_code(i);
        end
    end
end
ami_code = hdb3_code;
end