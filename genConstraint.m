function [ A, b, Aeq, beq, lb, ub ] = genConstraint( x, par )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

preN = par.preN;
rNum = par.rNum;
BNum = par.BNum;
xNum = length(x);
access = par.access;

% Aeq = [];
% beq = [];
%%%%%置信度为1的等式约束%%%%%%%%%%%%%%%%%%%5
%Aeq = zeros(rNum, xNum);
beq = ones(rNum, 1);
sub = eye(rNum, rNum);
Aeq = repmat(sub, 1, BNum);
Aeq = [Aeq zeros(rNum, (par.rNum - 2) * par.preN + rNum)];
if par.prAwFlag
    Aeq = [Aeq zeros(rNum, preN)];
end



%%%%%不等式约束%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%没有，因为候选值之间是乱序的！
A = [];
b = [];


%%%最大最小值约束
%所有都是先0~1然后再改候选值的最大最小值
lb = zeros(xNum, 1);
ub = ones(xNum, 1);

iter = rNum * BNum;
for i = 1:preN
    lb(iter+1:iter+rNum-2) = repmat(access(1,i), rNum-2, 1);
    ub(iter+1:iter+rNum-2) = repmat(access(2,i), rNum-2, 1);
    iter = iter + rNum-2;
end

end

