#linear regression

y1=load("Iris_data_norm_train.txt");
y2=load("iris_data_norm_test.txt");

size1=size(y1);
size2=size(y2);

x1=y1(1:size1(1),1:size1(2)-1);
x2=y1(1:size2(1),1:size2(2)-1);

w=inv(x1'*x1)*x1'*y1(1:size1(1),size1(2));

h=sign(x2*w);
h1=sign(x1*w);
N=length(y2);
count=0;
n1=length(y1);

count1=0;
for i=1:n1

	if h1(i)!= y1(i,size1(2))
	count1++;
	end
end

for i=1:N

	if h(i)!= y2(i,size2(2))
	count++;
	end
end
printf("The weight vector is \n");
w
printf("\nThe no of missclassification in test data are\n");
Eout=count
printf("\nThe no of missclassification in train data are\n");
Ein=count1



