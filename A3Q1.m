%% q1
f=@(x,y) (y/x)-((y*y)/(x*x));
x_intial=1;
y_intial=1;
h=0.01;
x =[x_intial];
y =[y_intial];
for i = 1:100
        k1=h*f(x(end),y(end));
        k2=h*f(x(end)+h/2, y(end)+k1/2);
        k3=h*f(x(end)+h/2,y(end)+k2/2);
        k4=h*f(x(end)+h,y(end)+k3);
        y(end+1)=y(end)+(k4+k1+2*k3+2*k2)/6;
        x(end+1)=x(end)+h;
end
disp('Approximation Values upto y(2) :');
for i=1:100
    disp(y(i+1));
end
plot(x,y,'r');
xlabel('X-values');
ylabel('Approximate values');