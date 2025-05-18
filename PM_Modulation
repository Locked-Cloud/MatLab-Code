fs = 50000;
T = 0.02;
t = 0:1/fs:T;

fc = 2000;
fm = 200;
Am = 2;
Ac = 2;
kp = 5*pi; % Phase sensitivity

% Generate signals
modulating_signal = Am * cos(2 * pi * fm * t);
carrier_signal = Ac * cos(2 * pi * fc * t);
pm_signal = Ac * cos(2 * pi * fc * t + kp * modulating_signal);

% PM Demodulation (Phase detector using Hilbert transform)
analytic_signal = hilbert(pm_signal);                  % Analytic signal
instantaneous_phase = unwrap(angle(analytic_signal));  % Extract phase
carrier_phase = 2 * pi * fc * t;                       % Carrier phase
demodulated_phase = instantaneous_phase - carrier_phase; 
demodulated_signal = demodulated_phase / kp;           % Remove phase sensitivity

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

subplot(4,1,4);
plot(t, modulating_signal, 'r', t, demodulated_signal, 'g--');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
legend('Original Message', 'Demodulated Signal');
title('Demodulation Result');
ylim([-2.5 2.5]); % Match amplitude scale
