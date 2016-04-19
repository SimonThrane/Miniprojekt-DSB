clear

%Create noise signal
t = linspace(-2*pi,2*pi,10000);
rng default
x = sin(t) + 0.25*rand(size(t));

len = length(x);

fs = 48000;
fc1 = 1200;
fc2 = 4800;
N = 10000;

df = fs/N;

m1 = round(fc1/df); %bin nummer der passer bedst
m2 = round(fc2/df); %-||-

filter1 = [zeros(1,m1) ones(1,abs(m1-m2)) zeros(1,N/2-m1-abs(m1-m2))];
filter1 = [filter1 zeros(1,N/2-m1-abs(m1-m2)) ones(1,abs(m1-m2)) zeros(1,m1)];

filter_time = fftshift(real(ifft(filter1)));

figure(1);
plot(filter1);

x1 = filter(filter_time,1,x);

hann = hanning(N)';

x1 = x1.*hann;

X = fft(x1,fs);
F = fft(filter_time);
Y = fft(x,fs);

clc;
figure(2)
subplot(3,1,1)
semilogx(abs((2/N)*X(1:0.5*end)));
subplot(3,1,2)
semilogx(abs((2/N)*F(1:0.5*end)));
subplot(3,1,3)
semilogx(abs((2/N)*Y(1:0.5*end)));



