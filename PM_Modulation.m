fs = 10000;
t = 0:1/fs:0.1;
fm = 100;
fc = 1000;
Am = 1;
Ac = 2;
kp = 5*pi; % Phase sensitivity

% Generate signals
modulating_signal = Am * cos(2 * pi * fm * t);
carrier_signal = Ac * cos(2 * pi * fc * t);
pm_signal = Ac * cos(2 * pi * fc * t + kp * modulating_signal);



% Plot results
figure;

subplot(4,1,1);
plot(t, modulating_signal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Message)');

subplot(4,1,2);
plot(t, carrier_signal, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Carrier Signal');

subplot(4,1,3);
plot(t, pm_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Phase Modulated (PM) Signal');

