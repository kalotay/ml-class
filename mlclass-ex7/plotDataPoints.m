function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
colormap(hsv(K + 1)(1:end-1,:));

% Plot the data
scatter(X(:,1), X(:,2), 15, idx);

end
