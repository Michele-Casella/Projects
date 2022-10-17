%% 3


%% data
P = 1/6; %probabily for each dice number


%% (a) compute population mean and variance
x = [1, 2, 3, 4, 5, 6];
p = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];

popMean = sum(x.*p);
popVar = sum(((x-popMean).^2).*p);
%% (b) one roll of fair dice simulation

dice = 6*rand;    % Gives a uniform distribution in [0,6]
dice = ceil(dice); % Gives a discrete distribution with population space {1,2,3,4,5,6}
    
fprintf('The roll result is %d \n',dice)
    

%% (c) verify pivotal statistic PDF approaches to Gaussian's one

%Z = (sampleMean - popMean)/(sampleSD/(n^0.5)) %pivotal statistic formula

N = 250;               
n = 700; 

% Compute the PDF of the standard normal
xrange = -5:0.01:5;
pdf = 1/(sqrt(2*pi))*exp(-(xrange.^2)/2);
    
r = 6*rand(N,n);
r = ceil(r);
for i = 1:n
    Xi = mean(r(:,1:n),2);
    Zi = (Xi-popMean)/((popVar/i)^0.5);
    
    histogram(Zi,(-5:0.25:5), 'Normalization','pdf');   
%set the bins for better stability. Otherwise use ksdensity
hold on
plot(xrange,pdf,'LineWidth',2);
hold off
ylim([0,1])     % To fix the range of the vertical axis
xlim([-5,5])      % To fix the range of the horizontal axis
legend('Frequency distribution of $Z_n$','PDF of standard Normal','interpreter','latex')
titlePic = sprintf('Sample size = %d',i);
title(titlePic);
drawnow;
end