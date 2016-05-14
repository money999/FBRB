function [ rule, par ] =  initRuleGivenData()
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

preN = 4;%前提属性个数
rNum = 4;%规则数
BNum = 12;%等级评价数量

prAwFlag = false;%前提属性权重是否参与计算


gB = ones(rNum,BNum);
gB = gB./BNum;
%gB = [0.6 0.1 0.3; 0.1 0.5 0.4;0 0.6 0.4; 0.4 0.1 0.5];

gwR = ones(rNum,1);%%%%%注意这两个都是列向量
%gwR = [0.7086; 0.7672; 0.1342; 0.9873];

gPraW = ones(preN,1);

%glass gPraW = [1;1;1;1;1;1;1;1;1];%%%%%注意这两个都是列向量

%给出gPraA的前后最大最小值，初始值采用等分的策略简单赋值
%iris 
access = [4.2 8; 1.9 4.5; 0.9 7; 0 2.6];
%glass access = [1.510 1.534; 10.72 17.38; 0 4.5; 0.28 3.6; 69.80 75.41; 0 6.22; 5.42 16.20; 0 3.16; 0 0.52];
if size(access, 1) ~= preN
    error('access个数出错');
end
gPraA = zeros(rNum, preN);
gPraA = [4.2   1.9   0.9  0
   5.5   2.76   2.93   0.86
   5   2   3   1
   8.00   4.50   7.0  2.60];
% for i = 1:size(access,1)
%     gPraA(:,i) = linspace(access(i,1), access(i,2), rNum)';
% end
% access = [4.3 7.9; 2 4.4; 1 6.9; 0.1 2.5];
% gPraA = [4.3 2 1 0.1;7.4055 3.5609 3.4109 1.6435;
%     5.3937 2.2674 3.7394 1.4519; 7.9 4.4 6.9 2.5];



if (size(gB,1) ~= rNum || size(gB,2) ~= BNum)
    error('置信度矩阵gB出错');
end

if size(gwR, 1) ~= rNum;
    error('规则权重gwR出错');
end

if size(gPraW, 1) ~= preN;
    error('前提属性权重gPraW出错');
end

if (size(gPraA,1) ~= rNum || size(gPraA,2) ~= preN)
    error('前提属性候选值gPraA出错');
end

rule.PraA = gPraA;
rule.PraW = gPraW;
rule.wR = gwR;
rule.B = gB;

par.BNum = BNum;
par.rNum = rNum;
par.preN = preN;
par.access = access';%注意为了方便拼接这里特意转置,定义时候不转置是为了好看
par.prAwFlag= prAwFlag;

