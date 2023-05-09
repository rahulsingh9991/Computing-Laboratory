%% Question 2
% N represents conditional number
% Reason for differnt conditional value for different norms :
% Conditional Number depend on which type of norm is being used to calculate it.
% Observations:
% 1.Row norm and column norm obtain same value since H and inv(H) are symmetric mattix.
% 2.Value of condition number obtained is large which suggest that the
%   mattrix is ill-conditioned.
% 3.Value of condition number increases with increasing n value because of
%   the small values in the mattrix as 1/n decreases with increasing n.

n=3;
disp("Question 2 :");
while(n<7)
H=zeros(n);
for i=1:n
for j=1:n
    H(i,j)=1/(i+j-1);
end
end
H_inv=inv(H);
%Row Norm
max=0;flag=0;counter=0;N=1;
while(counter<2)
    counter=counter+1;
    if(flag~=1)
        A=H;
    else
        A=H_inv;
    end
for i=1:n
    temp=0;
    for j=1:n
        temp=temp+abs(A(i,j));
        if(temp>max)
            max=temp;
        end
    end
end
flag=1;
N=N*max;
end
disp("Conditional Number For Row Norm for n-value "+n+" :");
disp(N);

%Column Norm
max=0;flag=0;counter=0;N=1;

while(counter<2)
    counter=counter+1;
    if(flag~=1)
        A=H;
    else
        A=H_inv;
    end
for i=1:n
    temp=0;
    for j=1:n
        temp=temp+abs(A(j,i));
        if(temp>max)
            max=temp;
        end
    end
end
flag=1;
N=N*max;
end
disp("Conditional Number For column Norm for n-value "+n+" :");
disp(N);

%Euclidean Norm
flag=0;counter=0;N=1;


while(counter<2)
    sum=0;
    counter=counter+1;
    if(flag~=1)
        A=H;
    else
        A=H_inv;
    end
for i=1:n
    for j=1:n
        sum=sum+A(i,j)*A(i,j);
    end
end
sum=sqrt(sum);
flag=1;
N=N*sum;
end
disp("Conditional Number For Euclidean Norm for n-value "+n+" :");
disp(N);
n=n+1;
end