clear

[x Fsample] = audioread('Symphony-sounds.wav');

Fsample = 44100;

% ***** Antal samples og varighed i sekunder ********************
N = length(x);
Tlength = N/Fsample;


% ***** Filtrering i pasband ************************************
F1 = filterone();
F2 = filtertwo();
F3 = filterthree();

% ***** Beregn DFT på signalet **********************************
b = F1.sosMatrix(:,5); 
a = F1.sosMatrix(:,6);

df = filter(b,a,x);

b1 = F2.sosMatrix(:,5); 
a1 = F2.sosMatrix(:,6);

df1 = filter(b1,a1,x);


b2 = F2.sosMatrix(:,5); 
a2 = F2.sosMatrix(:,6);

df2 = filter(b2,a2,x);


% ****** ***********************************
R1 =fft(df);
R2 =fft(df1);
R3 =fft(df2);

% ***** Plots ***************************************************
figure(1); clf
subplot(4,1,1);
%plot(R1);
semilogx(abs((2/N)*R1(1:0.5*end)));
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('filtreret signal i fft')
grid on

subplot(4,1,2);
%plot(df1);
semilogx(abs((2/N)*R2(1:0.5*end)));
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('filtreret signal')
grid on

subplot(4,1,3);
%plot(df2);
semilogx(abs((2/N)*R3(1:0.5*end)));
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('filtreret signal')
grid on


