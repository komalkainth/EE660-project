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

features = [ones(row_class,1),features];

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
   
%logistic regression   
[model_logR, X, lambdaVec, opt] = logregFit(features, class_mat, 'lambda','5');

 yhat_logreg=logregPredict(model_logR,features);
 
 count=0;
 for i=1:row_class

if (class_mat(i)==(yhat_logreg(i)))
    count=count+0;
else
    count=count+1;
end 
end
   err_rate= (count/row_class)*100;
 
   %svm linear 
   model_SVMLin=svmFit(features,class_mat);
   yhat_SVMlin=svmPredict(model_SVMLin,features);
   
 count=0;
 for i=1:row_class

if (class_mat(i)==(yhat_SVMlin(i)))
    count=count+0;
else
    count=count+1;
end 
end
   err_rate= (count/row_class)*100;
   
   %svm rbf
   model_SVMrbf=svmFit(features,class_mat);
   yhat_SVMlin=svmPredict(model_SVMrbf,features);
   
 count=0;
 for i=1:row_class

if (class_mat(i)==(yhat_SVMrbf(i)))
    count=count+0;
else
    count=count+1;
end 
end
   err_rate= (count/row_class)*100;
   
   %forest
   
  model_forest=fitForest(features,class_mat);
   yhat_forest=predictForest(model_forest,features);
   
 count=0;
 for i=1:row_class

if (class_mat(i)==(yhat_forest(i)))
    count=count+0;
else
    count=count+1;
end 
end
   err_rate= (count/row_class)*100; 
   
        