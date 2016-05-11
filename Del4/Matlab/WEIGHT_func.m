
%Give weights in dB
function [ output_signal ] = WEIGHT_func(input_signal,weight,weight2,weight3,weight4,weight5)
% Opdeler signalet i 5 forskellige frekvensbånd, der ligger i båndet for
% menneskeligt tale

x = IIR_lavpas();
b1=x.sosMatrix(:,5);
a1=x.sosMatrix(:,6);
[LP] = filter(b1,a1,input_signal);

[BP1, ~] = FIR_bandpass_function(input_signal, 400, 600);
[BP2, ~] = FIR_bandpass_function(input_signal, 600, 1000);
 x1 = hoereapparat; %1000-2000Hz
 b2=x1.sosMatrix(:,5);
 a2=x1.sosMatrix(:,6);
 [BP3] = filter(b2,a2,input_signal);

 x2 = IIR_highpas(); %2000-3400Hz
 b3=x2.sosMatrix(:,5);
 a3=x2.sosMatrix(:,6);
 [HP] = filter(b3,a3,input_signal);

% Vægt de 5 forskellige frekvens bånd, så de tilpasser sig til personens
% individuelle behov:
LP = LP * weight;
BP1 = BP1 * weight2;
BP2 = BP2 * weight3;
BP3 = BP3 * weight4;
HP = HP * weight5;

% clc;
% figure(1)
% subplot(5,1,1)
% plot(LP);
% subplot(5,1,2)
% plot(BP1);
% subplot(5,1,3)
% plot(BP2);
% subplot(5,1,4)
% plot(BP3);
% subplot(5,1,5)
% plot(HP);

output_signal = LP + BP1 + BP2+ BP3+ HP;

output_signal = FIR_bandpass_function(output_signal,300,3400);

%[output_signal] = filter(b4,a4,input_signal);
