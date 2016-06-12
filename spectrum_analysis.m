%% ������������fft�׷�����
% ��������ֱ�
% ��Ƶ��Amp_spectrum
% ��Ƶ��Phase_spectrum 
% Ƶ�ʷ�Χ��frequency
function  [Amp_spectrum,Phase_spectrum,frequency] = spectrum_analysis(seq_in,fs)
pointers_sampling = length(seq_in);
seq_in = seq_in -mean(seq_in);
frequency = linspace(0,1,ceil(pointers_sampling/2))'.*fs./2; %% Ƶ�ʷֱ���ΪFs/pointers_sampling
DFT_seq = fft(seq_in);
Amp_spectrum = abs(DFT_seq(1:ceil(pointers_sampling/2)))./pointers_sampling.*2;%%ֱ��������ϵ��Ϊ1/pointers_sampling,����Ƶ�ʷ���Ϊ2/pointers_sampling.
Phase_spectrum = angle(DFT_seq(1:ceil(pointers_sampling/2)));
end
