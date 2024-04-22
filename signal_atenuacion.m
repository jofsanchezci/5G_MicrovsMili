function [PL_free_space, PL_rain] = signal_attenuation(frequency, distance, rain_rate)
    % Constantes
    c = 3e8; % Velocidad de la luz en m/s

    % Pérdida por espacio libre
    wavelength = c / frequency;
    PL_free_space = (4 * pi * distance / wavelength).^2;
    PL_free_space = 10 * log10(PL_free_space); % Convertir a dB

    % Atenuación por lluvia
    % Coeficientes aproximados para la atenuación por lluvia (valores simplificados)
    k = 0.1; % Coeficiente de absorción específico por lluvia
    a = 1;   % Exponente de la tasa de lluvia
    PL_rain = k * rain_rate^a * distance / 1000; % Atenuación en dB/km

    % Mostrar resultados
    fprintf('Frecuencia: %.2f GHz\n', frequency / 1e9);
    fprintf('Distancia: %.2f km\n', distance / 1000);
    fprintf('Tasa de lluvia: %.2f mm/h\n', rain_rate);
    fprintf('Pérdida de espacio libre: %.2f dB\n', PL_free_space);
    fprintf('Atenuación adicional por lluvia: %.2f dB\n', PL_rain);
end

[PL_free_28GHz, PL_rain_28GHz] = signal_attenuation(28e9, 500, 10);
[PL_free_6GHz, PL_rain_6GHz] = signal_attenuation(6e9, 500, 10);

