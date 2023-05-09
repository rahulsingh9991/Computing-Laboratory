%% Question 2
% Points 1: 
% I have computed the order the convergence by plotting Graph 
% accordingly to the values computed at each iteration for order
% by the formula p=log(en+1/en)/log(en/en-1).
% The Values were ranging from 1 to 2.
% So the least upper bound is 2(approx).
% We conclude it the required order of convergence
% Point 2:
% Sequence for computing the root of the given Function f is decreasing 
% meaning if we put guess value less than 1 which is the root value 
% then method diverges.
% For method to converge we have to take guess value greater than 1
% like 1.5
f=@(x) x.^4-16*x.^3+89*x.^2-194*x+120;
guess=1.5;
iter=0;
en1=0;
en2=0;
en3=0;
while(abs(f(guess))>=1e-10 )
%   disp("Guess Value at Iteration "+iter+" : "+guess);
    iter=iter+1;
    temp=guess;
    guess=guess-(f(guess)*f(guess))/(f(guess+f(guess))-f(guess));
    en0=en1;
    en1=en2;
    en2=abs(guess-temp);
    if(iter>=3)
        order=log(en2/en1)/log(en1/en0);
        disp("Order Value At Iteration "+iter+" :"+order);
     end
end
disp("Root Value:       "+guess);
disp("Total Iterations :"+iter);
%end of function

