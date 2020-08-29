array(5,5)= double(zeros);
for i=1:5
    for j=1:5
    array(i,j)=i*2;
    end
end

% randIdcs = randperm(25,2);
% randval1=randIdcs(1);
% randval2=randIdcs(2);
% value1=array(1,randval1);
% value2=array(1,randval2);
% if(value1>value2)
%     cmin=value2;
%     cmax=value1;

[idx,c]=kmeans(array,2);