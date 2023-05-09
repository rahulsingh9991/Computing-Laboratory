%% Question 3
% Points: Sequences uk and vk are stored in form matrix(1*n)
% where n represents Number of Terms in the Sequence.

f=@(x) sin(x);
u0=1;
v0=2;
iter=0;
n=10;
U=zeros(1,n);
V=zeros(1,n);
while(iter<n)
    iter=iter+1;
    U(1,iter)=(u0);
    V(1,iter)=(v0);
    w=(u0*f(v0)-v0*f(u0))/(f(v0)-f(u0));
    if(f(w)*f(u0)>0)
        u0=w;
        
    else
        v0=w;
        
    end
    
end
disp("Sequence uk :");
disp(U);
disp("Sequence vk :");
disp(V);