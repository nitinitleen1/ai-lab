#linear regression

[a1,a2,a3,a4,y1]=textread("Iris_data_norm_train.txt","%f,%f,%f,%f,%f");
[b1,b2,b3,b4,y2]=textread("iris_data_norm_test.txt","%f,%f,%f,%f,%f");

x1=[a1,a2,a3,a4];
x2=[b1,b2,b3,b4];

w=inv(x1'*x1)*x1'*y1;

h=sign(x2*w);
h1=sign(x1*w);
N=length(y2);
count=0;
n1=length(y1);

count1=0;
for i=1:n1

	if h1(i)!= y1(i)
	count1++;
	end
end

for i=1:N

	if h(i)!= y2(i)
	count++;
	end
end
printf("The weight vector is \n");
w
printf("\nThe no of missclassification in test data are\n");
Eout=count
printf("\nThe no of missclassification in train data are\n");
Ein=count1



