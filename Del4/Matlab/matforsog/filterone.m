function Hd = filterone
%FILTER101 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the Signal Processing Toolbox 7.1.
% Generated on: 04-May-2016 11:23:10

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

N   = 10;  % Order
Fc1 = 300;   % First Cutoff Frequency
Fc2 = 500;   % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]
