% key = [0.1066,0.0844,0.1818,0.5498;0.9618,0.3997,0.2638,0.1449;0.0046,0.2598,0.1455,0.8530;0.7749,0.8000,0.1360,0.6220;0.8173,0.4314,0.8692,0.3509;0.8686,0.9106,0.5797,0.5132];
% % key = [zeros(1,4); key; ones(1,4)];
% indata = [0.3 0.5 0.7 0.9];
% indatamat = repmat(indata, 8, 1);
% 
% minkey = key - indatamat;
% minkey(minkey>0) = -Inf;
% [minc,mind] = max(minkey);
% 
% maxkey = key - indatamat;
% maxkey(maxkey<0) = Inf;
% [maxc,maxd] = min(maxkey);
% 
% actmatrix = zeros(8, 4);
% for i = 1:4
%     actmatrix(mind(i),i) = (key(maxd(i),i) - indata(i)) / (key(maxd(i),i) - key(mind(i),i));
%     actmatrix(maxd(i),i) = (indata(i) - key(mind(i),i)) / (key(maxd(i),i) - key(mind(i),i));
% end

% rule.PraA = key;
% par.rNum = 8;
% par.preN = 4;
% par.access = [0,1;0,1;0,1;0,1]';
% actmatrixx = activeRule(rule, par, indata);
load('NtrainFeature.mat')
load('NtestFeature.mat')
fname = {'D1','D11','D20','D26','D46','D47','D48','D49','D95','D96','D101','D102'};
xin = [];
for i = 1:length(fname)
    xin = [xin; NtrainFeature.(fname{i}); NtestFeature.(fname{i})];
end
mi = min(xin);
ma = max(xin);


[644574,508890,201299,298141,106766,103950]
[-604463,-254497,-229618,-140337,-170549,-108346]


