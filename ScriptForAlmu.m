%1. load data

load('ADHDAll.dat')
load('controlAll.dat')
load('mean_std_controlALL.dat')
load('mean_std_ADHDAll.dat')


% 2. separate only controls with Normal behaviour
controlNormals=controlAll;
controlNormals([8,9,10,12,13,17,31,34,36,38,45],:)=[];


% 3. plotting the figure 1.
plot(controlNormals(:,13),controlNormals(:,3),'r*'); hold on
plot(controlNormals(:,14),controlNormals(:,4),'bs'); hold on
plot(controlNormals(:,15),controlNormals(:,5),'co'); hold on
plot(controlNormals(:,16),controlNormals(:,6),'g^'); hold on
plot(controlNormals(:,17),controlNormals(:,7),'mp'); hold off

for i=1:5
    [h(i) p(i)]=kstest2(ADHDAll(:,i+2), controlAll(:,i+2)); % ks test
    [h2(i) p2(i)]=ttest2(ADHDAll(:,i+2), controlAll(:,i+2),0.05, 'both', 'equal' ) % t-test
end


% separate controls in completed and non-completed
CONcompleted=controlAll;
CONcompleted(CONcompleted(:,2)==0,:)=[];

CONincompleted=controlAll;
CONincompleted(CONincompleted(:,2)==1,:)=[];

% separate ADHD into completed and non completed
ADHDcompleted=ADHDAll;
ADHDcompleted(ADHDcompleted(:,2)==0,:)=[];

ADHDincompleted=ADHDAll;
ADHDincompleted(ADHDincompleted(:,2)==1,:)=[];


% 4. Comparison Controls vs ADHD
% kolmogorov-smirnov test
for i=1:5
    [h(i) p(i)]=kstest2(ADHDcompleted(:,i+2), ADHDincompleted(:,i+2))
    [h2(i) p2(i)]=ttest2(ADHDcompleted(:,i+2), ADHDincompleted(:,i+2),0.05, 'both', 'equal' )
end

figure(1);
%[h,p,ci, stats]=ttest2(meanASD(:,1),meanCON(:,1),0.05, 'both', 'equal' )
shadedErrorBar([1:4],nanmean(ADHDcompleted(:,3:6)),nanstd(ADHDcompleted(:,3:6))/sqrt(10),'-r', 1); hold on
ylim([30 80])
title({'Group comparison'; 'ADHD completed (red) vs ADHD incompleted (blue)'});
shadedErrorBar([1:4],nanmean(ADHDincompleted(:,3:6)),nanstd(ADHDincompleted(:,3:6))/sqrt(13),'-b', 1); hold off


for i=1:5
    [h(i) p(i)]=kstest2(CONcompleted(:,i+2), CONincompleted(:,i+2))
    [h2(i) p2(i)]=ttest2(CONcompleted(:,i+2), CONincompleted(:,i+2),0.05, 'both', 'equal')
end

figure(2);
%[h,p,ci, stats]=ttest2(meanASD(:,1),meanCON(:,1),0.05, 'both', 'equal' )
shadedErrorBar([1:4],nanmean(CONcompleted(:,3:6)),nanstd(CONcompleted(:,3:6))/sqrt(10),'-r', 1); hold on
ylim([30 80])
title({'Group comparison'; 'CON completed (red) vs CON incompleted (blue)'});
shadedErrorBar([1:4],nanmean(CONincompleted(:,3:6)),nanstd(CONincompleted(:,3:6))/sqrt(13),'-b', 1); hold off


for i=1:5
    [h(i) p(i)]=kstest2(ADHDcompleted(:,i+7), ADHDincompleted(:,i+7))
    [h2(i) p2(i)]=ttest2(ADHDcompleted(:,i+7), ADHDincompleted(:,i+7),0.05, 'both', 'equal')
end

figure(3);
%[h,p,ci, stats]=ttest2(meanASD(:,1),meanCON(:,1),0.05, 'both', 'equal' )
shadedErrorBar([1:4],nanmean(ADHDcompleted(:,8:11)),nanstd(ADHDcompleted(:,8:11))/sqrt(10),'-r', 1); hold on
ylim([30 80])
title({'Group comparison'; 'ADHD completed (red) vs ADHD incompleted (blue)'});
shadedErrorBar([1:4],nanmean(ADHDincompleted(:,8:11)),nanstd(ADHDincompleted(:,8:11))/sqrt(13),'-b', 1); hold off


for i=1:5
    [h(i) p(i)]=kstest2(CONcompleted(:,i+7), CONincompleted(:,i+7))
    [h2(i) p2(i)]=ttest2(CONcompleted(:,i+7), CONincompleted(:,i+7),0.05, 'both', 'equal')
end

figure(4);
%[h,p,ci, stats]=ttest2(meanASD(:,1),meanCON(:,1),0.05, 'both', 'equal' )
shadedErrorBar([1:4],nanmean(CONcompleted(:,8:11)),nanstd(CONcompleted(:,8:11))/sqrt(10),'-r', 1); hold on
ylim([30 80])
title({'Group comparison'; 'CON completed (red) vs CON incompleted (blue)'});
shadedErrorBar([1:4],nanmean(CONincompleted(:,8:11)),nanstd(CONincompleted(:,8:11))/sqrt(13),'-b', 1); hold off



% 5. Correlations


[r1 p1]=corr(ADHDcompleted(:,[3:7,18, 19, 20,22, 26]));
[r2 p2]=corr(ADHDincompleted(:,[3:7,18, 19, 20,22, 26]),'rows','pairwise');

[r3 p3]=corr(CONcompleted(:,[3:7,18, 19, 20,22, 26]));
[r4 p4]=corr(CONincompleted(:,[3:7,18, 19, 20,22, 26]),'rows','pairwise');

