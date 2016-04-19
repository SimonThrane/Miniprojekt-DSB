clear



[s_female, fsample] = audioread('box.wav');

Tsample = 1/fsample;  % sampletid

s_female_left = s_female(:,1)';  % venstre kanal i wave-filen udtages


t_axis = [0:Tsample:Tsample*(length(s_female_left)-1)];  % tidsakse


s_female_left_norm = s_female_left/max(abs(s_female_left));  % normalisering



% ***** Fourier Transformation *********************************

N_dft = length(s_female_left);  % antal punkter

S_female_left = fft(s_female_left_norm, N_dft);  % DFT'en udføres

delta_f = fsample/N_dft  % frekvensopløsning

f_axis = [0:delta_f:fsample-delta_f];  % frekvensakse



% ***** Frekvensspektre (magnitude) ***********************************
S_female_left_MAGdB = 20*log10(abs((2/N_dft)*S_female_left));

figure(1); clf
semilogx(f_axis(1:0.5*end), S_female_left_MAGdB(1:0.5*end))
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude)')
axis([10 inf -100 -40])
grid on
hold on

pause

[f_oct3, S_female_oct3] = oct_smooth(S_female_left, fsample, 3, [20 20000]);
S_female_oct3dB = 20*log10(abs((2/N_dft)*S_female_oct3));

semilogx(f_oct3, S_female_oct3dB,'g','linewidth',2)

pause

[f_oct12, S_female_oct12] = oct_smooth(S_female_left, fsample, 12, [20 20000]);
S_female_oct12dB = 20*log10(abs((2/N_dft)*S_female_oct12));

semilogx(f_oct12, S_female_oct12dB,'r','linewidth',2)



pause
figure(2); clf

[oct_center_freqs, S_oct3_bars] = oct_bandenrgy(S_female_left, fsample, 3);

bar(20*log10(S_oct3_bars))
xlabel('1/3 oktav frekvensbånd')
ylabel('Størrelse i dB')
title('DFT størrelse (magnitude)')
grid on
axis([1 32 0 60])

figure(3)
semilogy(oct_center_freqs,'*')
grid

