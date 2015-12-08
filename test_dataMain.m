filenameT='testing_data.xlsx';

[featuresT,classT]=xlsread(filenameT);

[row_classT, column_classT]=size(classT);
class_matT = zeros(row_classT,1);
for i=1:row_classT
    if (classT{i} == 's')
        class_matT(i)=1;
    else 
        class_matT(i)=-1;
    end
end

%standardizing the data
for j=1:31
    for i=1:row_classT
        
        featuresT(i,j)=featuresT(i,j)-mean_training(1,j);
        featuresT(i,j)=featuresT(i,j)/std_training(1,j);
    end
end
featuresT = [ones(row_classT,1),featuresT];
yhat_leastsquareT=featuresT*b;
for i=1:row_classT
    yhat_leastsquareT(i)=sign(yhat_leastsquareT(i));
end
%error_leastsquare=(sum(yhat_leastsquare-class_mat));
countT=0;
for i=1:row_classT

if (class_matT(i)==(yhat_leastsquareT(i)))
    countT=countT+0;
else
    countT=countT+1;
end 
end
   err_rateT= (countT/row_classT)*100;
   
   
   %Log regression
yhat_logregT=logregPredict(model_logR,featuresT);

countT=0;
for i=1:row_classT

if (class_matT(i)==(yhat_logregT(i)))
    countT=countT+0;
else
    countT=countT+1;
end 
end
   err_rateT= (countT/row_classT)*100;
   
   %SVM lin

 yhat_SVMlinT=logregPredict(model_SVMlin,featuresT);

countT=0;
for i=1:row_classT

if (class_matT(i)==(yhat_SVMlinT(i)))
    countT=countT+0;
else
    countT=countT+1;
end 
end
   err_rateT= (countT/row_classT)*100; 
   
   %SVM rbf
   
   yhat_SVMrbfT=logregPredict(model_SVMrbf,featuresT);

countT=0;
for i=1:row_classT

if (class_matT(i)==(yhat_SVMrbf(i)))
    countT=countT+0;
else
    countT=countT+1;
end 
end
   err_rateT= (countT/row_classT)*100; 
   
   %random forest
   
   yhat_forestT=logregPredict(model_forest,featuresT);

countT=0;
for i=1:row_classT

if (class_matT(i)==(yhat_forest(i)))
    countT=countT+0;
else
    countT=countT+1;
end 
end
   err_rateT= (countT/row_classT)*100; 