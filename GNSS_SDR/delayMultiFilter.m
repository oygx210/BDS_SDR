function Hd = delayMultiFilter
%DELAYMULTIFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 28-Mar-2017 15:35:02

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are normalized to 1.

Fpass = 0.4;              % Passband Frequency
Fstop = 0.5;              % Stopband Frequency
Dpass = 0.057501127785;   % Passband Ripple
Dstop = 0.0031622776602;  % Stopband Attenuation
dens  = 20;               % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop], [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]