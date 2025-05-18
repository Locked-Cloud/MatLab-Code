fs = 10000;
t = 0:1/fs:0.1;
fm = 100;
fc = 1000;
Am = 1;
Ac = 2;
kf = 8200; % Frequency sensitivity (adjust as needed)

massge = Am * cos(2 * pi * fm * t);
carr = Ac * cos(2 * pi * fc * t);
fm_signal = Ac * cos(2 * pi * fc * t + kf * cumsum(massge)/fs);

figure;

subplot(3,1,1);
plot(t, massge, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Message)');

subplot(3,1,2);
plot(t, carr, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Carrier Signal');

subplot(3,1,3);
plot(t, fm_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Frequency Modulated (FM) Signal');
