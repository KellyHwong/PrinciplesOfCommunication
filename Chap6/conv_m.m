function [ y,ny ] = conv_m( x,nx,h,nh )
%conv_m 计算线性卷积并返回序列的位置
%  x,nx: 序列x及其位置
%  h,nh: 序列h及其位置

%  ny: 卷积结果的y的起点、终点坐标
ny_begin = nx(1)+nh(1);
ny_end = nx(length(x))+nh(length(h));
ny = ny_begin:ny_end;

y=conv(x,h);
end