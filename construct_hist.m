% This file constructs the histogram model for each of the videos given the
% centroid clusters saved in the clustering_information.

clc;
clear;

% Loading the cluster centers
load('clustering_information.mat');

% Constructing the Histogram for class handshake
class = 'holly_hand_';

for i=1:28
    str = [['HOG/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(50,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST/',class],num2str(i)];
    save(str,'hist'); 
end


% Constructing the Histogram of each video belonging to the "Talking on a
% phone class"
class = 'holly_phone_';

for i=1:28
    str = [['HOG/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(50,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST/',class],num2str(i)];
    save(str,'hist'); 
end