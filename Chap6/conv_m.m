function [ y,ny ] = conv_m( x,nx,h,nh )
%conv_m �������Ծ�����������е�λ��
%  x,nx: ����x����λ��
%  h,nh: ����h����λ��

%  ny: ��������y����㡢�յ�����
ny_begin = nx(1)+nh(1);
ny_end = nx(length(x))+nh(length(h));
ny = ny_begin:ny_end;

y=conv(x,h);
end