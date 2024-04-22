function plot_signal_attenuation()
    frequencies = [28e9, 6e9];  % Frequencies in Hz
    labels = {'Millimeter Wave (28 GHz)', 'Microwave (6 GHz)'};
    distances = linspace(100, 2000, 100);  % Distances from 100 to 2000 meters
    rain_rate = 10;  % Rain rate in mm/h
    colors = ['b', 'r'];

    figure;
    hold on;
    for i = 1:length(frequencies)
        attenuation = signal_attenuation(frequencies(i), distances, rain_rate);
        plot(distances, attenuation, 'Color', colors(i), 'DisplayName', labels{i});
    end
    hold off;
    
    title('Signal Attenuation vs. Distance');
    xlabel('Distance (m)');
    ylabel('Total Attenuation (dB)');
    legend('show');
    grid on;
end

function total_attenuation = signal_attenuation(frequency, distances, rain_rate)
    c = 3e8;  % Speed of light in m/s
    wavelength = c / frequency;
    PL_free_space = (4 * pi * distances / wavelength).^2;
    PL_free_space_db = 10 * log10(PL_free_space);  % Convert to dB
    
    % Rain attenuation coefficients (simplified)
    k = 0.1;  % Specific absorption coefficient for rain
    a = 1;    % Rain rate exponent
    PL_rain = k * rain_rate^a .* distances / 1000;  % Attenuation in dB/km
    
    total_attenuation = PL_free_space_db + PL_rain;
end
