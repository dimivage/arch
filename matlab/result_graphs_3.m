
% Ορισμός σταθερής συχνότητας
CPU_Frequency = 2.0; % GHz

% Μετατροπή από categorical σε κελί κειμένου
L1I_Size_Cell = cellstr(L1I_Size);
L1D_Size_Cell = cellstr(L1D_Size);
L2_Size_Cell = cellstr(L2_Size);

% Αφαίρεση του "kB" και μετατροπή σε αριθμούς
L1I_Size_Numeric = cellfun(@(x) str2double(erase(lower(x), 'kb')), L1I_Size_Cell);
L1D_Size_Numeric = cellfun(@(x) str2double(erase(lower(x), 'kb')), L1D_Size_Cell);

% Αρχικοποίηση πίνακα για αποθήκευση των αριθμητικών τιμών
L2_Size_Numeric = zeros(size(L2_Size));
cost = zeros(size(L2_Size));
mull = zeros(size(L2_Size));

% Βρόγχος for για τη μετατροπή, καθώς υπαρχουν και KB, MB
for i = 1:length(L2_Size_Cell)
    current_value = L2_Size_Cell{i}; % Παίρνουμε το τρέχον στοιχείο
    
    if contains(current_value, 'MB')
        % Αν το στοιχείο περιέχει "MB", αφαιρούμε το "MB" και μετατρέπουμε σε αριθμό
        numeric_value = str2double(erase(current_value, 'MB')) * 1024;
    else
        % Αν το στοιχείο περιέχει "kB", αφαιρούμε το "kB" και μετατρέπουμε σε αριθμό
        numeric_value = str2double(erase(current_value, 'kB'));
    end
    
    % Αποθηκεύουμε το αριθμητικό αποτέλεσμα στο αντίστοιχο σημείο
    L2_Size_Numeric(i) = numeric_value;
end

for j = 1:length(L2_Size_Cell)
% Υπολογισμός της συνάρτησης κόστους
    cost(j) = 2.0 .* (L1I_Size_Numeric(j) + L1D_Size_Numeric(j)) + 1.0 .* L2_Size_Numeric(j) + 0.5 .* L1_Assoc(j) + 0.5 .* L2_Assoc(j) + 0.2 .* Cacheline_Size(j) + 3.0 .* CPU_Frequency;
    mull(j) = CPI(j) * cost(j);
end

% Υπολογισμός του Performance-Cost Ratio
Performance_Cost_Ratio = 1 ./ mull;

% Δημιουργία σχήματος
figure;
scatter(1:length(L2_Size), Performance_Cost_Ratio, 100, 'filled'); % Scatter plot με μεγάλες κουκίδες
title('Performance-Cost ratio vs values specmcf');
xlabel('components values');
ylabel('Performance-Cost Ratio');
grid on;

% Προσαρμογή των labels στον οριζόντιο άξονα
xticks(1:length(benchmark));
xticklabels(benchmark);
xtickangle(45); % Περιστροφή των labels για ευκρίνεια