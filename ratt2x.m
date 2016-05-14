function [ x ] = ratt2x( rule, par)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%   x依次放每条规则的B， 前提属性权重候选值, wR, 前提属性权重

x = [];
B = reshape(rule.B, par.rNum * par.BNum, 1);%注意这里是按列取出来，取回去也要 %用这个函数按列取回去
x = [x;B];                               


PraAT = rule.PraA(2:par.rNum-1,:);%%%头尾还是不参与训练
PraA = reshape(PraAT, (par.rNum - 2) * par.preN, 1);
x = [x;PraA];


x = [x;rule.wR];


if par.prAwFlag
    x = [x;rule.PraW];
end

end

