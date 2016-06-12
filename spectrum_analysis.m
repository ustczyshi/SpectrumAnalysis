%% 对输入序列做fft谱分析，
% 输出参数分别
% 幅频：Amp_spectrum
% 相频：Phase_spectrum 
% 频率范围：frequency
function  [Amp_spectrum,Phase_spectrum,frequency] = spectrum_analysis(seq_in,fs)
pointers_sampling = length(seq_in);
seq_in = seq_in -mean(seq_in);
frequency = linspace(0,1,ceil(pointers_sampling/2))'.*fs./2; %% 频率分辨率为Fs/pointers_sampling
DFT_seq = fft(seq_in);
Amp_spectrum = abs(DFT_seq(1:ceil(pointers_sampling/2)))./pointers_sampling.*2;%%直流分量的系数为1/pointers_sampling,其他频率分量为2/pointers_sampling.
Phase_spectrum = angle(DFT_seq(1:ceil(pointers_sampling/2)));
end
