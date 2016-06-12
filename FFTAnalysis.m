% FFT分析
% Y 输出幅频
% f 对应的频率
% y 是输入的信号
% L 为输入信号的周期点数
% Ts = 1/fs;
function [Y , f] = FFTAnalysis(y,fs)
L  = length(y);
NFFT = 2^nextpow2(L);
y = y - mean(y);% 去除直流分量了
%%直流分量的系数为1/L,其他频率分量为2/L.
Y = fft(y,NFFT)/L;
Y = 2*abs(Y(1:NFFT/2+1));
f = fs/2*linspace(0,1,NFFT/2+1); %% 频率分辨率为Fs/NFFT
end