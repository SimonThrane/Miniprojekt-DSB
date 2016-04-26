
%Give weights in dB
function [ output_signal ] = FIR_WEIGHT(input_signal,weight,weight2,weight3,weight4,weight5)

[LP] = IIR_Lowpass(input_signal);
[BP1, notused] = FIR_bandpass_function(input_signal, 8, 100);
[BP2, notused] = FIR_bandpass_function(input_signal, 80, 1000);
[BP3, notused] = FIR_bandpass_function(input_signal, 800, 10000);
[HP, notused] = FIR_bandpass_function(input_signal, 8000, 20000);

%weight = ln(10)*(x/(20*ln(10)));
%weight2 = ln(10)*(x/(20*ln(10)));
%weight3 = ln(10)*(x/(20*ln(10)));
%weight4 = ln(10)*(x/(20*ln(10)));
%weight5 = ln(10)*(x/(20*ln(10)));

LP = LP * weight;
BP1 = BP1 * weight2;
BP2 = BP2 * weight3;
BP3 = BP3 * weight4;
HP = HP * weight5;

output_signal = LP + BP1 + BP2 + BP3 + HP;
