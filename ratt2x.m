function [ x ] = ratt2x( rule, par)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   x���η�ÿ�������B�� ǰ������Ȩ�غ�ѡֵ, wR, ǰ������Ȩ��

x = [];
B = reshape(rule.B, par.rNum * par.BNum, 1);%ע�������ǰ���ȡ������ȡ��ȥҲҪ %�������������ȡ��ȥ
x = [x;B];                               


PraAT = rule.PraA(2:par.rNum-1,:);%%%ͷβ���ǲ�����ѵ��
PraA = reshape(PraAT, (par.rNum - 2) * par.preN, 1);
x = [x;PraA];


x = [x;rule.wR];


if par.prAwFlag
    x = [x;rule.PraW];
end

end

