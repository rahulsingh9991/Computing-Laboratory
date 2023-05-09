%% question 2
% Using ODE as: y"=6*x with y(0)=0 and y(1)=1
p = @(x) 0;
q = @(x) 0;
f = @(x) -6*x;
g0 = 0;
g1 = 1;
a=0;
b=1;
n = 10;
h = (b - a)/(n);
x = @(x) a+h*x;
b = zeros(n-1,1);
A = zeros(n-1,n-1);

for i = 2:n-2
    A(i, i)=2+h*h*q(x(i));
    A(i, i-1)= -(1+p(x(i))*h/2);
    A(i, i+1)= -(1-p(x(i))*h/2);
end
A(1, 1)=2+h*h*q(x(1));
A(1, 2)= -(1-p(x(1))*h/2);
A(n-1, n-1)=2+h*h*q(x(n-1)); 
A(n-1, n-2)= -(1+p(x(n-1))*h/2);

for i = 1:n-1
    b(i) = h*h*f(x(i));
end
b(1) = b(1) + g0*(1+p(x(1))*h/2);
b(n-1) = b(n-1) + g1*(1-p(x(n-1))*h/2);

%Now Solving A*w=b to get values of w=[w1,w2,...,wn-1]
w = A\b;
disp('Approximation Values are :');
disp(w);
w=[g0;w;g1];%Placing w0 & wn values

x=[a];
for i=1:n
    x(end+1)=x(end)+h;
end

plot(x,w,'g')
xlabel('X-values');
ylabel('Approximate Values');
