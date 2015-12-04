%load trainign_dataMat.mat;
filename='Training_dataNew';
[features,class]=xlsread(filename);

[row_class, column_class]=size(class);
class_mat = zeros(row_class,1);
for i=1:row_class
    if (class{i} == 's')
        class_mat(i)=1;
    else 
        class_mat(i)=-1;
    end
end



%z score
mean_training=zeros(1,31);
std_training=zeros(1,31);
for i=1:31
mean_training(1,i)=mean(features(:,i));
std_training(1,i)=std(features(:,i));
end

%standardizing the data
for j=1:31
    for i=1:row_class
    
        features(i,j)=features(i,j)-mean_training(1,j);
        features(i,j)=features(i,j)/std_training(1,j);
    end
end

%features = [ones(row_class,1),features];

%least square

features_trans=transpose(features);
b1=(features_trans)*(features);
b2=(features_trans)*class_mat;
b=pinv(b1)*b2;

% % error rate

yhat_leastsquare=features*b;
for i=1:row_class
    yhat_leastsquare(i)=sign(yhat_leastsquare(i));
end
%error_leastsquare=(sum(yhat_leastsquare-class_mat));
count=0;
for i=1:row_class

if (class_mat(i)==(yhat_leastsquare(i)))
    count=count+0;
else
    count=count+1;
end 
end
   err_rate= (count/row_class)*100;
   
   


% %ridge regression
%seperating validation set and data set
% class_validation=zeros(4002,1);
% 
%  validation_set(1:2000,:)=features(1:2000,:);
%  class_validation(1:2000)=class_mat(1:2000);
%  validation_set(2001:4002,:)=features(10000:12001,:);
%  class_validation(2001:4002)=class_mat(10000:12001);
%  training_set=features(2001:9999,:);
%  class_training=class_mat(2001:9999);
%  %class_training=cell2mat(class_training);
%  %class_validation=cell2mat(class_validation);
%  
% k=0.1:0.2:100;
% b_ridge=ridge(class_training,training_set,k);
% 
% % validation
% [m, n]=size(k);
% for i=1:n
%     
% result(:,i)=validation_set*b_ridge(:,i);
% end
% 
% result=sign(result);
% count_ridge=zeros(n,1);
% 
% 
% for j=1:n
% for i=1:4002
% if result(i,j)==class_validation(i,1)
%     count_ridge(j,1)=count_ridge(j,1)+0;
% else
%     count_ridge(j,1)=count_ridge(j,1)+1;
% end
% end
% end
% 
% error_function=(count_ridge/4002)*100;
% error_ridge=min(error_function);

k = 0:1e-5:5e-3;
b_ridge=ridge(class_mat,features,k);
result=features*b;
result=sign(result);
count1=0;
for i=1:12001
    if result(i,1)==class_mat(i)
    count1=count1+0;
    else
        count1=count1+1;
    end
end




        