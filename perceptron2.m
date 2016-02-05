clear all;
close all;


percentage=0;
printf("\nEnter the percentage to train\n");
percentage=input("");

 total_count=0;
 Ein(1:150)=0;
 Eout(1:150)=0;
 ein(1:50)=0;
 eout(1:50)=0;
x=load("Iris_data_norm_train-test.txt");
size1=size(x);
row_size=size1(1);
column_size=size1(2); 


  weight(1:4)=[0.5 0.5 0.5 0.5];
  threshold=0;
   
  train=(percentage/100)*row_size
  error_train=row_size-train
 for l=1:50
     weight1=weight;
    
for k=1:train
    
     point=x(k,1:column_size-1); 
     #plot3(petal_length(1:50),petal_width(1:50),sepal_length(1:50),'r*')
     #grid on
     #hold on
     #plot3(petal_length(50:100),petal_width(50:100),sepal_length(50:100),'b*')
     #grid on
     #hold on
     #plot3(petal_length(100:150),petal_width(100:150),sepal_length(100:150),'g*')
     

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     y=dot(weight1,point);
      
      if((y<threshold)&&(x(k,column_size)==1))
       %weight= weight + point;
       Ein(l)++;
      endif
      if((y>threshold)&&(x(k,column_size))==-1)
       %weight= weight - point;
       Ein(l)++;
      endif
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      y=dot(weight,point);
      
      if((y<threshold)&&(x(k,column_size)==1))
       weight= weight + point;
       %Ein(l)++;
      endif
      if((y>threshold)&&(x(k,column_size))==-1)
       weight= weight - point;
       %Ein(l)++;
      endif
    
   end  

  ein(l)=Ein(l);
 



 ############################################################################################################################
 for j=error_train:row_size
        
    point=x(j,1:column_size-1); 
    y=dot(weight1,point);
    
     if((y<threshold)&&(x(j,column_size)==1))
      total_count++;
      Eout(l)++;
     endif
     if((y>threshold)&&(x(j,column_size)==-1))
       total_count++;
      Eout(l)++;
      endif
  end   
  eout(l)=Eout(l);
 end
weight1
%if(total_count!=0) 
 %printf("\nThe error percentage is :%f\n",((total_count/50)*100))
 
l=1:1:50;
plot(l,ein(l),'r')
hold on
grid on
plot(l,eout(l),'g')
hold on
grid on





