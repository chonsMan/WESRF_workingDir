%%
close all
clc
clear
format compact
%%
testSignalMean = 0;
testSignalStddev = 12;
testSignalSignalLength = 60*10; % seconds
testSignalSampleTime = 0.001;
fCutoff = 10;   % Hz

for i=1:6
    x = testSignalMean+testSignalStddev*randn(testSignalSignalLength/testSignalSampleTime-1,1);

    L = length(x);                % Length of signal

    % Make signal odd
    if mod(L,2) ~= 1
        x(end) = [];
    end

    X = fft(x);
    Xtwoside = [flipud(X(2:(L+1)/2)) ; X(1) ; X(2:(L+1)/2)];
    ftwoside = 1/testSignalSampleTime*[-(L-1)/2:(L-1)/2]/L;

    foneside_idx = ftwoside>=0;
    Xoneside = Xtwoside(foneside_idx);
    foneside = ftwoside(foneside_idx);

    % Filter
    Xoneside(foneside>=fCutoff) = 0;

    % Reconstruct
    Xfilt = [Xoneside ; conj(flipud(Xoneside(2:end)))];
    xFilt = ifft(Xfilt);
    
    save(['rand_noise' num2str(i) '.mat'], 'xFilt')
end

%plotting_data