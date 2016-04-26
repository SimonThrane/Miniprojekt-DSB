function [ output_signal ] = IIR_Lowpass( input_signal )
%Load koefficenter for designet IIR-filter:
load LowpassIIR

b=[-1.99958882636935;-1.99881044943430;-1.99814879930370;-1.99766835702012;-1.99741586621321];
a=[0.999590539491295;0.998812161889374;0.998150511191915;0.997670068496728;0.997417577473500];

output_signal=filter(b,a,input_signal);


end

