%% Question 1

A=[1 1 -1;1 2 -2;-2 1 1];
b=[1;1;1];
disp("Input :");
disp("A :");
disp(A);
disp("b :");
disp(b);
n=size(A);
root=zeros(3,1);
L=eye(n);
% U=zeros(n); 
for p=2:n
for i=p:n
    m_A=A(i,p-1)/A(p-1,p-1);
    L(i,p-1)=m_A;
    for j=1:n
       A(i,j)=A(i,j)- m_A*A(p-1,j);
    end
end
end
U=A; %Mattrix A has become upper triangle mattrix
disp("Question 1(a) :");
disp("L: ");
disp(L);
disp("U: ");
disp(U);
X=zeros(3,1);%Computing L*U*Root=b as L*X=b then U*Root=X 
for i=1:size(A)%forward substitution for computing L*X=b
    temp=0;
    for j=1:i-1
        temp=temp+L(i,j)*X(j,1);
    end
    X(i,1)=(b(i)-temp)/L(i,i);
end

for i=size(A):-1:1%Backward substitution for computing U*Root=X
        temp=0;
    for j=i+1:size(A)
        temp=temp+U(i,j)*root(j,1);
    end
    root(i,1)=(X(i)-temp)/U(i,i);
end
disp("Question 1(b) :");
disp("Root :");
disp(root);
