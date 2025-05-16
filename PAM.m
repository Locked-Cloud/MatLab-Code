fs = 10000;
t = 0:1/fs:0.1;
fm = 100;
fc = 1000; % Not used directly in PAM
Am = 1;
Ac = 2;

massge = Am * cos(2 * pi * fm * t);
pam = massage .* (square(2 * pi * fc * t) + 1)/2;
figure;

subplot(3,1,1);
plot(t, massage, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Message)');

subplot(3,1,2);
plot(t, pam, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Pulse Amplitude Modulated (PAM) Signal');
