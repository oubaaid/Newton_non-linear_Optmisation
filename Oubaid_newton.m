clear
x=[1;2;4;6;8;10;13];
y=[7;5;4;3;2.7;2.3;2.1];
t0= [2;-0.33];
t=t0; 
err=8;
iter=1;
chain_err = err
while err>0.00000001
    DJ= [2.*sum(t(1)+7.*exp(t(2).*x)-y); 14.*sum((t(1)+7.*exp(t(2).*x)-y).*(x.*exp(t(2).*x)))];
    Hess= [14,14.*sum(x.*exp(t(2).*x));14.*sum(x.*exp(t(2).*x)),14.*(sum((x.^2).*exp(t(2).*x).*(t(1)+14.*exp(t(2).*x)-y)))];
    j= (Hess\DJ);
    P= t-j;

    err= norm(t-P);
    iter=iter+1;
    iter
    err
    chain_err=[chain_err err];
    t=P;
end

a = P(1);
b = P(2);
z = linspace(1,13);
Y=a+7*exp(b*z);


figure(1)
scatter (x,y)
hold on 
plot(z,Y);
grid on;
figure(2);
plot(chain_err)
