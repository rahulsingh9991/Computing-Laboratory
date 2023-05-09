%% Question 4
%Points: Bisection Method Break At [-0.625,0.9375]
% we proceed further with Newton method taking intial guess 
% to be (a+b)/2 to compute final root value which is 0.

%Bisection method
f=@(x) tanh(x);
a=-10;
b=15;
s=0.1;
tol=s*abs(b-a);
steps=0;
while(abs(b-a)>=tol)
mid=(a+b)/2;
if(f(mid)==0)
disp("root"+mid);
break;
end
steps=steps+1;
if(f(mid)*f(a)<0)
b=mid;
else
a=mid;
end

end
disp("Bisection Break Point ["+a+","+b+"]");
disp("Steps Taken in Bisection Method :"+steps);
%Mid Value is one of the end point of interval[a,b]

% Newton method
g=@(x) 1/(cosh(x)*cosh(x));
%Adjust guess upper and lower bound of interval [l,u] 
u=b;
l=a;
guess=(a+b)/2;%Intial guess value
iter=0;
while(abs(f(guess))>=1e-10 && (guess<=u) && (guess>=l))
    disp("Guess in Newton Method "+" "+iter+": "+guess);
    iter=iter+1;
    guess=guess-(f(guess)/g(guess));
end
% disp("Iterations "+iter);
if(guess>u || guess<l) 
    disp(" Newton Method Not able to find root in the given interval");

else
disp("Guess in Newton Method "+" "+iter+": "+guess);       
disp("Root Value :"+guess);
end
%end of function