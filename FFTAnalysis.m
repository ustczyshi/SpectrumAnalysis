% FFT����
% Y �����Ƶ
% f ��Ӧ��Ƶ��
% y ��������ź�
% L Ϊ�����źŵ����ڵ���
% Ts = 1/fs;
function [Y , f] = FFTAnalysis(y,fs)
L  = length(y);
NFFT = 2^nextpow2(L);
y = y - mean(y);% ȥ��ֱ��������
%%ֱ��������ϵ��Ϊ1/L,����Ƶ�ʷ���Ϊ2/L.
Y = fft(y,NFFT)/L;
Y = 2*abs(Y(1:NFFT/2+1));
f = fs/2*linspace(0,1,NFFT/2+1); %% Ƶ�ʷֱ���ΪFs/NFFT
end