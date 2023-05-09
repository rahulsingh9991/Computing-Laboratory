%% Question 1 
% Using Newtons method
% Function f = a-1/x and we have to find the root of function f.
% By Newton Method , sequence xn+1=xn-f(xn)/df(xn).
% On simplyfing the sequence we get an expression which can be 
% Computed using addition,subtraction,multiplication
% By creating a sequence xn+1=xn(2-a*xn) which converges to 1/a
% Provided intial guess is taken close to 1/a (where a~=0).
a=199;
f=@(x) a-1/x;
guess=0.01;
iter=0;
while(abs(f(guess))>=1e-10 )
%     disp("Guess value at iteration "+iter+" : "+guess);
    if(f(guess)==0)
        break;
    end
    iter=iter+1;
    guess=2*guess-a*guess*guess;
end
disp("Approximate :"+guess);
% disp("Total iterations "+iter);
%end of function
