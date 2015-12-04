
filename='Training_dataNew';
[features,class]=xlsread(filename);


% %least square fit
% XT=transpose(num);
% YT=transpose(str);
% [m,n]=size(YT);
% YT{1,1}=NaN;
% for i=2:n
%     if YT{1,i}=='s'
%         YT{1,i}=1;
%     else
%         YT{1,i}=0;
%     end
% end
% YT=cell2mat(YT);
% 
% z=XT*num;
% z1=XT*YT;
% Wmle=inv(z)*z1;

%SVM
% kdata = num(2:end,3:4);
% groupk= str(2:end);
% figure,svmStruct = svmtrain(kdata,groupk,'ShowPlot',true);
% 
% %Tree
% N = size(num,1);
%  figure
% gscatter(num(:,2), num(:,3), str,'rgb','osd');
% xlabel('Sepal length');
% ylabel('Sepal width');
% printPmtkFigure('dtreeIrisData')
% 
% s = RandStream('mt19937ar','seed',0);
% RandStream.setGlobalStream(s);
% cp = cvpartition(str,'k',10);
% 
% % fit tree
% t = classregtree(num(:,2:3), str,'names',{'SL' 'SW' });
% 
% % plot decision boundary
% figure
% [x,y] = meshgrid(4:.1:8,2:.1:4.5);
% x = x(:);
% y = y(:);
% [grpname,node] = t.eval([x y]);
% gscatter(x,y,grpname,'grb','sod')
% title('unpruned decision tree')
% printPmtkFigure('dtreeDboundaryUnpruned')
% 
% % plot tree
% view(t)
% %printPmtkFigure('dtreeTreeUnpruned')
% 
% %Ridge regression
% 

