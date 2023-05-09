%% Q4 Part 1
% Gauss Siedal 

A=[10 1;1 10];
x0=[0.5 0.5];
b=[11 11];

iter=999;
s=1;
n=length(b);
x=x0;
e1=zeros(1,iter);
tol=1e-4;
while(s<=iter)
for i=1:n
    temp=0;
    for j=1:n
        if(j<i)
            temp=temp+A(i,j)*x(j);
        end
        if(j>i)
            temp=temp+A(i,j)*x0(j);
        end
    end
    x(i)=1/A(i,i)*(b(i)-temp);
end
e1(s)=max(abs(x-x0));
if(e1(s)<tol)
    break;
end
x0=x;
s=s+1;
end
e1(s+1:end)=[];
disp('Result for part(a) :');
fprintf('x(%d)=%f\n',[1:n;x]);

%% Q4 part 2
% Gauss Jacobi 
A=[4 1 -1;2 7 1;1 -3 12];
x0=[0 0 0];
b=[3 19 31];

iter=999;
s=1;
n=length(b);
e2=zeros(1,iter);
tol=1e-10;
x=x0;
while(s<=iter)
for i=1:n
    temp=0;
    for j=1:n
        if(i~=j)
        temp=temp+A(i,j)*x0(j);
        end
    end
    x(i)=1/A(i,i)*(b(i)-temp);
end
e2(s)=max(abs(x-x0));%Infinity Norm
if(e2(s)<tol)
    break;
end
x0=x;
s=s+1;
end
e2(s+1:end)=[];
disp('Result for part(b) :');
fprintf('x(%d)=%f\n',[1:n;x]);


