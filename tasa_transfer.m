% Frecuencias en GHz
f_micro = 2.5; % Frecuencia típica de microondas para WiFi
f_milli = 28;  % Frecuencia típica de ondas milimétricas para 5G

% Ancho de banda en GHz
B_micro = 0.08;  % Ancho de banda típico para microondas (ej. WiFi)
B_milli = 1;     % Ancho de banda típico para ondas milimétricas (ej. 5G)
% Relación señal-a-ruido (SNR)
SNR = 30; % en dB, suponiendo un SNR alto para ambos casos

% Convertir SNR de dB a una relación lineal
SNR_linear = 10^(SNR/10);

% Calculo de la capacidad del canal (Shannon Capacity) en bps
C_micro = B_micro * 1e9 * log2(1 + SNR_linear);
C_milli = B_milli * 1e9 * log2(1 + SNR_linear);
figure;
bar([1, 2], [C_micro, C_milli] / 1e9); % Convertir a Gbps para la visualización
set(gca, 'XTickLabel', {'Microondas 2.5 GHz', 'Ondas Milimétricas 28 GHz'});
ylabel('Capacidad de transmisión (Gbps)');
title('Comparación de la capacidad de transmisión');
grid on;
