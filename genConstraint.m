function [ A, b, Aeq, beq, lb, ub ] = genConstraint( x, par )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = par.preN;
rNum = par.rNum;
BNum = par.BNum;
xNum = length(x);
access = par.access;

% Aeq = [];
% beq = [];
%%%%%���Ŷ�Ϊ1�ĵ�ʽԼ��%%%%%%%%%%%%%%%%%%%5
%Aeq = zeros(rNum, xNum);
beq = ones(rNum, 1);
sub = eye(rNum, rNum);
Aeq = repmat(sub, 1, BNum);
Aeq = [Aeq zeros(rNum, (par.rNum - 2) * par.preN + rNum)];
if par.prAwFlag
    Aeq = [Aeq zeros(rNum, preN)];
end



%%%%%����ʽԼ��%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%û�У���Ϊ��ѡֵ֮��������ģ�
A = [];
b = [];


%%%�����СֵԼ��
%���ж�����0~1Ȼ���ٸĺ�ѡֵ�������Сֵ
lb = zeros(xNum, 1);
ub = ones(xNum, 1);

iter = rNum * BNum;
for i = 1:preN
    lb(iter+1:iter+rNum-2) = repmat(access(1,i), rNum-2, 1);
    ub(iter+1:iter+rNum-2) = repmat(access(2,i), rNum-2, 1);
    iter = iter + rNum-2;
end

end

