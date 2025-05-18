fs = 50000;
t = 0:1/fs:0.02;
fm = 200;
fc = 2000;
Am = 1;
Ac = 2;
kf = 5000; % Frequency sensitivity (adjust as needed)

modulating_signal = Am * cos(2 * pi * fm * t);
carrier_signal = Ac * cos(2 * pi * fc * t);
% FM signal: frequency changes with integral of m(t)
fm_signal = Ac * cos(2 * pi * fc * t + kf * cumsum(modulating_signal)/fs);

figure;

subplot(3,1,1);
plot(t, modulating_signal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Message)');

subplot(3,1,2);
plot(t, carrier_signal, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Carrier Signal');

subplot(3,1,3);
plot(t, fm_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Frequency Modulated (FM) Signal');
