%% 功率谱密度计算

function [ Y,P,f] = power_spectrum( y,fs,varargin )
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
y0 = mean(y);
y = y - y0;% 去除直流分量了
%%直流分量的系数为1/L,其他频率分量为2/L.
Y = fft(y,NFFT)/L;
len = NFFT/2;
Y = 2*abs(Y(1:len));
% P = unwrap(angle(Y(1:NFFT/2+1)));% 相位谱
Y(1) = y0;
P = Y.^2;
P(2:end) = P(2:end)./2; 
f = fs/2*linspace(0,1,len+1); %% 频率分辨率为Fs/NFFT
f = f(1:len);
end

