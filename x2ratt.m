function [ rule ] = x2ratt( x, par )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

iter = 0;
B = x(iter+1:iter+par.rNum * par.BNum);
rule.B = reshape(B, par.rNum , par.BNum);


iter = iter + par.rNum * par.BNum;
PraA = x(iter+1:iter+(par.rNum-2) * par.preN);
PraA = reshape(PraA, (par.rNum-2), par.preN);
rule.PraA = [par.access(1,:); PraA; par.access(2,:)];%%%�Ѻ�ѡֵͷβ����


iter = iter + (par.rNum-2) * par.preN;
wR = x(iter+1:iter+par.rNum);
rule.wR = wR;

if par.prAwFlag
    iter = iter + par.rNum;
    praW = x(iter+1:iter+par.preN);
    rule.praW = praW;
end

end

