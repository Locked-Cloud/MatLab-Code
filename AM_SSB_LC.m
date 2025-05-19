%AM_SSB_LC
fs = 10000;
t = 0:1/fs:0.1;
fm = 100;
fc = 1000;
A = 1;
C = 2;

m = A * cos(2 * pi * fm * t);
carrier = C * cos(2 * pi * fc * t);
m_hilbert = imag(hilbert(m));

ssb_lc = carrier + m .* cos(2 * pi * fc * t) - m_hilbert .* sin(2 * pi * fc * t);

figure;
subplot(3,1,1);
plot(t, m, 'b');
title('Message Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(t, carrier, 'g');
title('Carrier Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(t, ssb_lc, 'r');
title('SSB-LC Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
