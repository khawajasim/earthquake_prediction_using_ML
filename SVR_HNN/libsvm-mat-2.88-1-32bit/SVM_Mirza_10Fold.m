% clc;
% clear all; 
load ('D:\Books\Ph.D\Paper Work1\HOG_Ludwig_PS');
M=size(FS);
PL=ones(M(1),1); % PL = Positive labels
FST=FS; % FST = Feature Space
load ('D:\Books\Ph.D\Paper Work1\HOG_Ludwig_NS');
M=size(FS);
NL=-1*ones(M(1),1); % NL = Positive labels
FST=[FST;FS];
LBZ=[PL;NL]; %LBZ=Labels
M=size(FST);

RRI=randperm(M(1)); % RRI=Random Row Index
SFST=FST(RRI,:); %Shuffled Feature Space
SLBZ=LBZ(RRI); % Shuffled Labels
Fold=10;
N=floor(M(1)/11)-100;
for n=1:N
    MODEL=svmtrain(SLBZ(11*n-10:11*n-1), SFST(11*n-10:11*n-1,:),'-c 5 -g 0.7');
    [PL, Acc, DV]=svmpredict(SLBZ(11*n), SFST(11*n,:), MODEL);
    %PL=Prodict Label, Acc=Accuracy, DV=Decision Value
end
[PL, Acc, DV]=svmpredict(SLBZ(1814:1922), SFST(1814:1922,:), MODEL);






