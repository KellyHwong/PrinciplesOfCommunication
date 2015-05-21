msg_code = [1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1];
ami_code = AMI_encode(msg_code);
hdb3_code = HDB3_encode(msg_code);

%½«HDB3½âÂëÎªAMI
hdb3_decode = HDB3_decode(hdb3_code);