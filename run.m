clear
load('trainiris.mat')
load('testiris.mat')

traindata = trainiris;
testdata = testiris;

[rule, par] =  initRuleGivenData();
x0 = ratt2x(rule, par);
[ A, b, Aeq, beq, lb, ub ] = genConstraint( x0, par );

options = optimset( 'Display' , 'Iter' , 'MaxFunEvals'...
    , 10000*length(x0) , 'MaxIter', 10000 , 'TolFun' , 1e-10 , 'TolX' , 1e-6 , 'TolCon', 1e-6);

[x,fval,flag] = fmincon(@(x) fmin_fun(par, traindata, x ) ...
    ,x0, [], [], Aeq, beq, lb, ub,[],options);
ruleNew = x2ratt(x, par);

disp('dddd');

restt = zeros(1,3);
for i = 1:75
    xin = testdata(i,1:par.preN);
    
    [B, BA] = activeRule(ruleNew,par, xin);
    
    [v,l] = max(B);
    if l~=testdata(i,par.preN+1)
        restt(testdata(i,par.preN+1)) = restt(testdata(i,par.preN+1)) + 1;
    end
end

