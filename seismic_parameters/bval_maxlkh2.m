function [bvalue, avalue, std_err] = bval_maxlkh2(mag)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function take an earthquake catalog in a specific format and
% calculate b-value, a-value and associated error using maximum likelihood
% method given by Aki, 1965
%
% Input:
% mag = Earthquake catalog with magnitudes only 
% bin = bin length (not required in this method)
%
% Output:
% bvalue = b-value
% avalue = a-value
% std_err = standard error given by Shi and Bolt, 1982
%
% Written by Abhijit Ghosh
% modified by AVN
%
% Last modified on  Fri Jul 27 11:45:11 EDT 2007
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

neq = length (mag);
mean_mag = mean(mag);
min_mag = min (mag);

bvalue = (1/(mean_mag-min_mag))*log10(exp(1));
% bvalue=1;  % Added by Christine for CEUS

% Calculate the a-value (taken from Zmap)
avalue = log10(neq) + bvalue*min_mag;


std_dev = (sum((mag-mean_mag).^2))/(neq*(neq-1));
std_err = 2.30 * sqrt(std_dev) * (bvalue)^2; 