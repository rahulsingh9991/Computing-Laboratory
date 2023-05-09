%% q3
% On Comparing the result of part(d) with the results obtained in parts (a),(b)&(c)
% Conclusion :
% We can see by analysing true error values 
% Two point Gaussian Quadrature is more accurate than part(a)&(b)
% but less accurate than part(c)result in this question.
% Reason:
% True Errors values obtained for part (a)&(b) are large because
% 1. Function given is not linear.
% 2. Interval given is large.
% True Errors values obtained for part (c) are small because
% On Breaking the interval length into smaller sub-intervals,approximation is improved. 

g=@(x) (1/(1+x*x));

disp("Actual value of definite integral : 2.6516");
disp("Part(a) Result :");
[E1]=trapezoidal(1,g,-4,4);
disp("Estimation with Simple Trapezoidal :"+E1);
disp("True Error : "+abs(E1-2.6516));

[E2]=simpson(2,g,-4,4);
disp("Part(b) Result :");
disp("Estimation with Simple Simpson :"+E2);
disp("True Error : "+abs(E2-2.6516));

[E3]=trapezoidal(10,g,-4,4);
disp("Part(c) Result :");
disp("Estimation with Composite Trapezoidal :"+E3);
disp("True Error : "+abs(E3-2.6516));

[E4]=simpson(10,g,-4,4);
disp("Estimation with Composite Simpson :"+E4);
disp("True Error : "+abs(E4-2.6516));

%Two point Gaussian Quadrature
a=-4;
b=4;
h=(b-a)/2;
c=(a+b)/2;
%p=@(x) (hx+c);
%g_change=@(x) (h*g(p(x)));%Change of Interval
g_change=@(x) (4/(1+16*x*x));
E5=g_change(1/sqrt(3))+g_change(-1/sqrt(3));
disp("Part(d) Result :");
disp("Two point Gaussian Quadrature Estimation :"+E5);
disp("True Error : "+abs(E5-2.6516));

function [sum] = trapezoidal(n,f,a,b)
h=(b-a)/n;

X=zeros(1,n+1);
sum=a;
X(1,1)=a;
for i=2:n+1
    sum=sum+h;
    X(1,i)=sum;
end
sum=0;
for i=1:n+1
    if(i==1 || i==n+1)
        sum=sum+(h/2)*(f(X(1,i)));
    else
        sum=sum+h*(f(X(1,i)));
    
    end
end
end

function [sum]=simpson(n,f,a,b)
h=(b-a)/n;
X=zeros(1,n+1);
sum=a;
X(1,1)=a;
for i=2:n+1
    sum=sum+h;
    X(1,i)=sum;
end
sum=0;
for i=1:2:n-1
    sum=sum+(h/3)*(f(X(1,i))+4*f(X(1,i+1))+f(X(1,i+2)));
end
end

