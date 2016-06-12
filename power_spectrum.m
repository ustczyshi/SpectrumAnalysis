%% �������ܶȼ���

function [ Y,P,f] = power_spectrum( y,fs,varargin )
L  = length(y);% �����ź����г���
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
y = y - y0;% ȥ��ֱ��������
%%ֱ��������ϵ��Ϊ1/L,����Ƶ�ʷ���Ϊ2/L.
Y = fft(y,NFFT)/L;
len = NFFT/2;
Y = 2*abs(Y(1:len));
% P = unwrap(angle(Y(1:NFFT/2+1)));% ��λ��
Y(1) = y0;
P = Y.^2;
P(2:end) = P(2:end)./2; 
f = fs/2*linspace(0,1,len+1); %% Ƶ�ʷֱ���ΪFs/NFFT
f = f(1:len);
end

