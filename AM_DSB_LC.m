fs = 10000;
t = 0:1/fs:0.1;
fm = 100;
fc = 1000;
Am = 1;
Ac = 2;
m = Am/Ac;

ms = Am * cos(2 * pi * fm * t);
carr = Ac * cos(2 * pi * fc * t);

am_signal = Ac * (1 + m * ms) .* cos(2 * pi * fc * t);

figure;

subplot(3,1,1);
plot(t, ms, 'r');
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
plot(t, am_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Amplitude Modulated (AM) Signal');

