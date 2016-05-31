function   test3
 x1=[];
% call optimization
x0 = [-1 1];
options = optimset('outputfcn',@outfun,'display','iter',... 
'Algorithm','active-set');
xsol = fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options)

 x1 %各次迭代的自变量
 function stop = outfun(x,optimValues,state)
   stop = false;
     switch state
         case 'iter'
          x1 = [ x1; x];
     end
 end
 
 function f = objfun(x)
     f = exp(x(1))*(4*x(1)^2 + 2*x(2)^2 + 4*x(1)*x(2) +... 
                    2*x(2) + 1);
 end
 
 function [c, ceq] = confun(x)
     % Nonlinear inequality constraints
     c = [1.5 + x(1)*x(2) - x(1) - x(2);
         -x(1)*x(2) - 10];
     % Nonlinear equality constraints
     ceq = [];
 end
end