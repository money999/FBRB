
function [traindata, testdata] = getFoldData(data, ite, fold)

% ite = 10;
% fold = 10;
% data = iris;

[~,M] = size(data);
aclass = unique(data(:,M));

traindata = [];
testdata = [];
for i = 1:length(aclass)
    tda = data(data(:,M) == aclass(i),:);
    tsi = fix(size(tda, 1) / fold);
    if tsi ~= 0
        testdata = [testdata; tda((ite - 1) * tsi + 1:ite * tsi,:)];
        tda((ite - 1) * tsi + 1:ite * tsi,:) = [];
        traindata = [traindata; tda];
    else
        rt = unidrnd(size(tda, 1));
        testdata = [testdata; tda(rt,:)];
        tda(rt,:) = [];
        traindata = [traindata; tda];
    end
end
end
