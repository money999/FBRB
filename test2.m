% [rule, par] =  initRuleGivenData();
% x0 = ratt2x(rule, par);
% ruleNew= x2ratt( x0, par );
% [ A, b, Aeq, beq, lb, ub ] = genConstraint( x0, par );
% 
% 
% 
% indata = [5 2.1 5 2];
% [B, BA] = activeRule(rule, par, indata);
% alln = 10;
% strr = ['sheet' num2str(alln)];
% 
% xlswrite('c:\save.xls',Aeq,strr);
% 
% xlswrite('c:\save.xls',beq,'sheet5');


% trainiris = [NUM(1:25,:); NUM(51:75,:); NUM(101:125,:)];
% testiris = [NUM(26:50,:); NUM(76:100,:); NUM(126:150,:)];

max([testglass;trainglass])
min([testglass;trainglass])

% trainglass= [];
% testglass= [];
% 
% for i = 1:7
%     aa = num(num(:,10) == i,:);
%     row = size(aa,1);
%     prerow = round(row/2);
%     trainglass = [trainglass;aa(1:prerow,:)];
%     testglass = [testglass;aa(prerow+1:row,:)];
% end