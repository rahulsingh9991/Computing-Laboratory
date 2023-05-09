%% Question 3
% []t represent transpose mattrix.
% Given : A=[a1=0,a2,....an]t B=[b1,b2,...,bn]t C=[c1,c2...,cn-1,cn=0]t
% D=[d1,d2,..dn]t
% Solve : n unknowns X=[x1,x2,x3....xn]t
A=[0;1;2;3];
B=[2;3;4;5];
C=[1;2;3;0];
D=[1;2;1;2];
disp("Question 3 :");
disp("Input :");
disp('A :');
disp(A);
disp('B :');
disp(B);
disp('C :');
disp(C);
disp('D :');
disp(D);
disp("Output :");
n=length(B);
%Computing C' components
C_diff=zeros(n,1);
C_diff(1,1)=C(1,1)/B(1,1);
for i=2:n-1
    C_diff(i,1)=C(i,1)/(B(i,1)-A(i,1)*C_diff(i-1,1));
end
%Computing D' components
D_diff=zeros(n,1);
D_diff(1,1)=D(1,1)/B(1,1);
for i=2:n
    D_diff(i,1)=(D(i,1)-A(i,1)*D_diff(i-1,1))/(B(i,1)-A(i,1)*C_diff(i-1,1));
end

%Computing X=[x1,x2,x3...,xn]
X=zeros(n,1);
X(n,1)=D_diff(n,1);
for i=n-1:-1:1
    X(i,1)=D_diff(i,1)-C_diff(i,1)*X(i+1,1);
end
disp("X :");
disp(X);
% A=[1 0 0;0 1 0;0 0 1];
% b=[1;2;3];
% A\b