function [ output_signal, filter1] = FIR_bandpass_function(input_signal,fc1,fc2 )

len = length(input_signal);

fs = 48000;

N = 1000;

df = fs/N;

m1 = round(fc1/df); %bin nummer der passer bedst
m2 = round(fc2/df); %-||-

filter1 = [zeros(1,m1) ones(1,abs(m1-m2)) zeros(1,N/2-m1-abs(m1-m2))];
filter1 = [filter1 zeros(1,N/2-m1-abs(m1-m2)) ones(1,abs(m1-m2)) zeros(1,m1)];

filter_time = fftshift(real(ifft(filter1)));

x1 = filter(filter_time,1,input_signal);

hann = hanning(len)';

output_signal = x1.*hann;

end

