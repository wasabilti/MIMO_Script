%function ECC=getECC(FILENAME)

% Get ECC from Sparameter data file
% 1 row: comment
% 1 column: frequency
% 2 column: S11 real
% 3 column: S11 imag
% 4 column: S21 real
% 5 column: S21 imag
% 6 column: S12 real
% 7 column: S12 imag
% 8 column: S22 real
% 9 column: S22 imag

% Debug part
FILENAME = 'S.csv';
% end of debug part

PLOT_RESULT  = 1;	% Control fig output

RAW = csvread(FILENAME, 1);
freq = RAW(:, 1);
RAW(:, 1) = [];
S11 = RAW(:, 1) + j*RAW(:, 2);
S21 = RAW(:, 3) + j*RAW(:, 4);
S12 = RAW(:, 5) + j*RAW(:, 6);
S22 = RAW(:, 7) + j*RAW(:, 8);

ECC = abs(conj(S11) .* S12 + conj(S21) .* S22).^2 ./ ((1 - (abs(S11).^2 + abs(S21).^2)) .* (1 - (abs(S22).^2 + abs(S12).^2)));

if PLOT_RESULT
	figure
	title('ECC')
	xlabel('freq')
	ylabel('ECC')
	hold on
	grid on
	plot(freq, ECC)
	hold off
end % end of if PLOT_RESULT

%end % end of function
