% 2015.12.30  zyshi
% FFT分析
% Y 输出幅频
% f 对应的频率
% y 是输入的信号
% L 为输入信号的周期点数
% NFFT 为FFT的点数
% Ts = 1/fs;
function [FT_coff,Y,P, f] = FFT_analysis(y,fs,varargin)
L  = length(y);% 输入信号序列长度
switch nargin
    case 0
        error('null  input !');
    case 1
        error('please enter the frequency info ');
    case 2
        NFFT = L;
    case 3
        NFFT = varargin{1};
    otherwise
        NFFT = L;
end
NFFT = 2*ceil(NFFT/2);
% y0 = mean(y);
% y = y - y0;% 去除直流分量了
%%直流分量的系数为1/L,其他频率分量为2/L.
Y = fft(y,NFFT)/L;
len  =  NFFT/2;
% FT_coff = Y(1:len);
FT_coff = Y;
y0 = FT_coff(1) ;
Y = 2*abs(Y(1:len));
P = unwrap(angle(Y(1:len)));% 相位谱
Y(1) = abs(y0);
f = fs/2*linspace(0,1,len+1); %% 频率分辨率为Fs/NFFT
f = f(1:len);
end