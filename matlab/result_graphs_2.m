% Δημιουργία σχήματος
figure;
scatter(1:length(CPI), CPI, 100, 'filled'); % Scatter plot με μεγάλες κουκίδες
title('CPI vs Benchmark');
xlabel('Benchmark spechmmer');
ylabel('CPI');
grid on;

% Προσαρμογή των labels στον οριζόντιο άξονα
xticks(1:length(Benchmark));
xticklabels(Benchmark);
xtickangle(45); % Περιστροφή των labels για ευκρίνεια