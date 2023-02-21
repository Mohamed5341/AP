function [RMSE, MAE] = ErrorCalculate(X, X1)
%ErrorCalculate This function calculates for 12 states Root Mean Square
%Error and mean absolute error
%Call    :[RMSE, MAE] = ErrorCalculate(X, X1)
%Inputs
%   X   : 12 states calculated at each time instance
%   X1  : output from simulink to compare with calculated data
%Output
%  RMSE : 12 values for states that represents root mean square error
%  MAE  : 12 values for states that represents mean absolute error

% TODO: You need to check if input is a valid inputs

RMSE = zeros(12, 1);
MAE = zeros(12, 1);
N = size(X, 2);

for i = 1:12
    if(i > 6 && i < 10)
        error = wrapToPi(X1(:,i))'-wrapToPi(X(i,:));
    else
        error = X1(:,i)'-X(i,:);
    end
    MAE(i) = sum(abs(error))/N;
    RMSE(i) = sqrt((sum(error).^2)/N);
end

end

