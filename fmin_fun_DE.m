function y = fmin_fun_DE(par, feature ,x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%[Be,BeA] = activeRuleNew(ratt, x0(i,:));

rule = x2ratt(x, par);

yd = 0;
for i = 1:size(feature,1)
    xin = feature(i,1:par.preN);
    
    [B, BA] = activeRule(rule,par, xin);
    
    %     B(feature(i,par.preN+1)) = 1 - B(feature(i,par.preN+1));
    %     yd = yd + sum(B);
    
    
        [v,l] = max(B);
        if l~=feature(i,par.preN+1);
            yd = yd + 1;
        end
    
    
    if isnan(sum(B))
        i
        xin
    end
end

y = yd;

end

