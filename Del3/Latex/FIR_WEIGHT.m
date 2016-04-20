
%Give weights in dB
function [ output_signal ] = FIR_WEIGHT(input_signal,weight,weight2,weight3,weight4,weight5)

[LP, notused] = FIR_bandpass_function(input_signal, 0, 1000);
[BP1, notused] = FIR_bandpass_function(input_signal, 1000, 3000);
[BP2, notused] = FIR_bandpass_function(input_signal, 3000, 6500);
[BP3, notused] = FIR_bandpass_function(input_signal, 6500, 11500);
[HP, notused] = FIR_bandpass_function(input_signal, 11500, 18000);

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
