%% Lab 5 Jesse Layman SID: 861135479

% Professor: Bir Bhanu,
% TA: Vincent On,         
% EE 146 - 021

%% 1)
clear all
close all
load('/Users/jesselayman/Downloads/lab5_2Class_KNN_Data.mat')
figure
scatter(c1(:,1),c1(:,2),'.','R')
hold on
scatter(c2(:,1),c2(:,2),'*','B')
hold on
scatter(c1test(:,1),c1test(:,2),'+','G')
hold on
scatter(c2test(:,1),c2test(:,2),'x','M')
labels(1:100,1) = 1;
labels(101:200,1) = 2;

% learn and test set 1
c1v(1:100,1) = c1(:,1);
c1v(101:200,1) = c1(:,2);
c1Test = c1test(:);
k = 5;
Mdd = fitcknn(c1v,labels,'NumNeighbors',k);
predictedLabels = predict(Mdd,c1Test);
Afalse = 0;
for i = 1:size(c1Test)/2
    if predictedLabels(i)>1
        Afalse = Afalse +1;
    end
end
Bfalse = 0;
for i = size(c1Test)/2+1:size(c1Test)
    if predictedLabels(i)<2
        Bfalse = Bfalse +1;
    end
end
Atrue = uint32(size(c1Test)/2)-Afalse;
Btrue = uint32(size(c1Test)/2)-Bfalse;
confusionMatrix1 = [Atrue(1),Afalse;Btrue(1),Bfalse]

% learn and test set 2
clear Afalse Atrue Bfalse Btrue
c2v(1:100,1) = c2(:,1);
c2v(101:200,1) = c2(:,2);
c2Test = c2test(:);
k = 5;
Mdd = fitcknn(c2v,labels,'NumNeighbors',k);
predictedLabels2 = predict(Mdd,c2Test);
Afalse = 0;
for i = 1:size(c2Test)/2
    if predictedLabels(i)>1
        Afalse = Afalse +1;
    end
end
Bfalse = 0;
for i = size(c2Test)/2+1:size(c2Test);
    if predictedLabels(i)<2
        Bfalse = Bfalse +1;
    end
end
Atrue = uint32(size(c2Test)/2)-Afalse;
Btrue = uint32(size(c2Test)/2)-Bfalse;
confusionMatrix2 = [Atrue(1) Afalse; Btrue(1) Bfalse]

%% 2)

I = imread('peppers.png');
[x,y,z] = size(I);
Ir = I(:);
Isize1 = size(Ir)/3;
Isize2 = (size(Ir)/3)*2;
Isize3 = size(Ir);
featureMatrix(1:Isize1,1) = Ir(1:Isize1,1);
featureMatrix(1:Isize1,2) = Ir(Isize1+1:Isize2,1);
featureMatrix(1:Isize1,3) = Ir(Isize2+1:Isize3,1);
clusterIdx = kmeans(double(featureMatrix),5);

Im = reshape(uint8(clusterIdx),x,y);
imshow(Im,[]);