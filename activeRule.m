function [B, BA] = activeRule(rule, par, indata)
praA = rule.PraA;
indatamat = repmat(indata, par.rNum, 1);

minpraA = praA - indatamat;
minpraA(minpraA>0) = -Inf;
[minc,mind] = max(minpraA);

maxpraA = praA - indatamat;
maxpraA(maxpraA<0) = Inf;
[maxc,maxd] = min(maxpraA);

actmatrix = zeros(par.rNum, par.preN);
for i = 1:par.preN
    if maxd(i) == mind(i)
        actmatrix(mind(i),i) = 1;
    else
        actmatrix(mind(i),i) = (praA(maxd(i),i) - indata(i)) / (praA(maxd(i),i) - praA(mind(i),i));
        actmatrix(maxd(i),i) = (indata(i) - praA(mind(i),i)) / (praA(maxd(i),i) - praA(mind(i),i));
    end
    
end

if par.prAwFlag
    praW = repmat(rule.ParW',par.rNum,1);%%%因为是列向量要要转行后复制
    actmatrix = actmatrix .^ praW;
end

wact = rule.wR .* sum(actmatrix,2);%横向求和乘以对应规则权重获得分子
wact = wact / sum(wact);

m = repmat(wact,1,par.BNum) .* rule.B;
mw = wact .* (1 - sum(rule.B,2));
mu = 1 - wact;

cu = prod(mu);
cw = prod(mu + mw) - cu;
c = prod(m + repmat(mu + mw , 1, par.BNum)) - (cu + cw);%c变成行向量了

k1 = sum(c) + cu + cw;
c = c ./ k1;
cw = cw / k1;
cu = cu / k1;

B = c ./ (1 - cu);
BA = cw / (1 - cu);
end