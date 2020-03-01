
N = 200;
S1=0;
S2=0;
output2=zeros(N,1);
input = sort((200-1)*rand(N,1)+1,'descend');

output1 = rand(N,1);
inputmatr = toeplitz(input,[input(1),zeros(1,N-1)]);


%x = inputmatr\output1;
auxtau=0;
[R,U,beta]=TORT(inputmatr);
[m,n]=size(inputmatr);

for k=1:n
    for i=k:m
        auxtau=auxtau+U(i,k)*output1(i);
    end
    tau=auxtau/beta(k);
    for i=k:m
        output1(i)=output1(i)-tau*U(i,k);
    end
end
x=UTRIS(R(1:n,:),output1(1:n));






for i=1:N
    for j=1:i
        output2(i)=output2(i)+inputmatr(i,i+1-j)*x(j);
    end
end


plot(input,output1,'r')
hold on;
plot(input,output2,'g')

for v=1:N
    S1=S1+abs(output1(v));
    S2=S2+abs(output2(v));
end
S1=S1/N;
S2=S2/N;
aux=abs(S1-S2);
eroare=aux/S1*100


clear all
