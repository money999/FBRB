function [ rule, par ] =  initRuleGivenData()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

preN = 4;%ǰ�����Ը���
rNum = 4;%������
BNum = 12;%�ȼ���������

prAwFlag = false;%ǰ������Ȩ���Ƿ�������


gB = ones(rNum,BNum);
gB = gB./BNum;
%gB = [0.6 0.1 0.3; 0.1 0.5 0.4;0 0.6 0.4; 0.4 0.1 0.5];

gwR = ones(rNum,1);%%%%%ע������������������
%gwR = [0.7086; 0.7672; 0.1342; 0.9873];

gPraW = ones(preN,1);

%glass gPraW = [1;1;1;1;1;1;1;1;1];%%%%%ע������������������

%����gPraA��ǰ�������Сֵ����ʼֵ���õȷֵĲ��Լ򵥸�ֵ
%iris 
access = [4.2 8; 1.9 4.5; 0.9 7; 0 2.6];
%glass access = [1.510 1.534; 10.72 17.38; 0 4.5; 0.28 3.6; 69.80 75.41; 0 6.22; 5.42 16.20; 0 3.16; 0 0.52];
if size(access, 1) ~= preN
    error('access��������');
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
    error('���ŶȾ���gB����');
end

if size(gwR, 1) ~= rNum;
    error('����Ȩ��gwR����');
end

if size(gPraW, 1) ~= preN;
    error('ǰ������Ȩ��gPraW����');
end

if (size(gPraA,1) ~= rNum || size(gPraA,2) ~= preN)
    error('ǰ�����Ժ�ѡֵgPraA����');
end

rule.PraA = gPraA;
rule.PraW = gPraW;
rule.wR = gwR;
rule.B = gB;

par.BNum = BNum;
par.rNum = rNum;
par.preN = preN;
par.access = access';%ע��Ϊ�˷���ƴ����������ת��,����ʱ��ת����Ϊ�˺ÿ�
par.prAwFlag= prAwFlag;

