clear
load('data\glass.mat')

resall = zeros(1,10);
iteall = 0;
for rtt = 1:10
    rtt
    
    testdata = glass(iteall + 1: iteall + 21 , :);
    traindata = glass;
    traindata(iteall + 1: iteall + 21 , :) = [];
    iteall = iteall + 21;
    
    [rule, par] =  initRuleGivenData();
    x0 = ratt2x(rule, par);
    [ A, b, Aeq, beq, lb, ub ] = genConstraint( x0, par );
    Lx = lb;
    Ux = ub;
    
    
    
    %%%染色体是行向量%%%
    Lx = Lx';
    Ux = Ux';
    
    Gm = 2000;
    F0 = 0.5;
    Np = 50;%每代染色体个数
    CR = 0.9;%交叉概率
    G = 1;%初始化代数
    D = length(Lx);%所求问题的维数
    best_x = zeros(Gm, D);
    value = zeros(1, Np);
    
    %产生初始种群矩阵
    Gx = (repmat(Ux, Np, 1) - repmat(Lx, Np, 1)).*rand(Np, D) + repmat(Lx, Np, 1);
    %%%%-----各规则置信度为1的等式约束----%%%%%%
    for npi = 1:Np
        xx = Gx(npi,:);
        iter = 0;
        for ri = 1:par.rNum
            Btmp = xx(iter + 1 : iter + par.BNum);
            Btmp = Btmp/sum(Btmp);
            xx(iter + 1 : iter + par.BNum) = Btmp;
            iter = iter + par.BNum;
        end
        Gx(npi,:) = xx;
    end
    %%%%-----各规则置信度为1的等式约束----%%%%%%
    
    Gx_next_1 = zeros(Np, D);
    Gx_next_2 = zeros(Np, D);
    Gx_next = zeros(Np, D);
    Gmin = zeros(Gm,1);
    
    while G<=Gm
        %%%%%%%%%%%%%%%%%%%-------变异操作-------%%%%%%%%%%%%%%%%%%
        for i=1:Np
            tmpx = randperm(Np);
            j = tmpx(1);
            k = tmpx(2);
            p = tmpx(3);
            if j == i
                j = tmpx(4);
            elseif k == i
                k = tmpx(4);
            elseif p == i
                p = tmpx(4);
            end
            lamda = exp(1-Gm/(Gm+1-G));
            F = F0*2^lamda;
            
            son = Gx(p,:) + F*(Gx(j,:) - Gx(k,:));
            for j = 1:D
                if son(1,j)>=Lx(j) && son(1,j)<=Ux(j)
                    Gx_next_1(i,j) = son(1,j);
                else
                    Gx_next_1(i,j) = (Ux(j) - Lx(j))*rand() + Lx(j);
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%-------交叉操作-------%%%%%%%%%%%%%%%%%%
        for i=1:Np
            randx = randperm(D);
            for j=1:D
                if rand >= CR && randx(1)~=j
                    Gx_next_2(i,j) = Gx(i,j);
                else
                    Gx_next_2(i,j) = Gx_next_1(i,j);
                end
            end
        end
        
        %%%%-----各规则置信度为1的等式约束----%%%%%%
        for npi = 1:Np
            xx = Gx_next_2(npi,:);
            iter = 0;
            for ri = 1:par.rNum
                Btmp = xx(iter + 1 : iter + par.BNum);
                Btmp = Btmp/sum(Btmp);
                xx(iter + 1 : iter + par.BNum) = Btmp;
                iter = iter + par.BNum;
            end
            Gx_next_2(npi,:) = xx;
        end
        %%%%-----各规则置信度为1的等式约束----%%%%%%
        %%%%%%%%%%%%%%%%%%%-------选择操作-------%%%%%%%%%%%%%%%%%%
        for i=1:Np
            %%%---必须以列的方式传入---%%%
            Gn = fmin_fun_DE(par, traindata, Gx_next_2(i,:)');
            Gt = fmin_fun_DE(par, traindata, Gx(i,:)');
            if  Gn<Gt
                Gx_next(i,:) = Gx_next_2(i,:);
                value(i) = Gn;
            else
                Gx_next(i,:) = Gx(i,:);
                value(i) = Gt;
            end
        end
        
        %%%%%记录该代的最优解%%%
        [v_min, p_min] = min(value);
        Gmin(G) = v_min;
        best_x(G,:) = Gx_next(p_min);
        
        Gx = Gx_next;
        G = G + 1;
    end
    
    [v_min, p_min] = min(Gmin);
    best_value = v_min;
    best_vector = best_x(p_min, :);
    
    resall(rtt) = fmin_fun_DE(par, testdata, best_vector')
end
