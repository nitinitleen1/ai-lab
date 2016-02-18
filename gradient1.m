%linear regression using gradient descent algorithm to find the coefficients, 



file = load('ex2data2.txt');

size1=size(file);
row_size=size1(1);
column_size=size1(2); 
x=file(1:row_size,1:column_size-1);
y=file(1:row_size,column_size);

figure % open a new figure window
plot(x(1:row_size,1), x(1:row_size,2), 'o');
ylabel('feature 1')
xlabel('feature 2')

m = length(y); % store the number of training examples
x = [ones(m, 1),x]; % Add a column of ones to x
n = size(x,2);


%this part is for minimizing the Theta_vec: coefficients.
theta_vec = [0 0 0]';
alpha = 0.07;
err = [0 0 0]';
for iteration = 1:10000
 h_theta = (x*theta_vec);
 h_theta_v = h_theta*ones(1,n);
 y_v = y*ones(1,n);
 theta_vec = theta_vec - alpha*1/m*sum((h_theta_v - y_v).*x).';
 err(:,iteration) = 1/m*sum((h_theta_v - y_v).*x)';
end

theta_vec

h=sign((x*theta_vec)');
N=length(y);
count=0;
for i=1:N

	if h(i)!= y(i)
	count++;
	end
end
eout=count/118

plotData(x(:,2:3), y);
ylabel('feature 1')
xlabel('feature 2')
hold on
plot(x(:,2),x*theta_vec,'rp-');
legend('measured', 'predicted');
grid on;
xlabel('x');
ylabel('y');
title('Measured and predicted ');























