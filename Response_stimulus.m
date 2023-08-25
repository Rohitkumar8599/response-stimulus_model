%% Assignment_2 solutions
                      % Group Details:
                      % Pankaj Kumar_22103276
                      % ROHIT KUMAR
                      % KULA VARDHAN REDDY KONKALA
                      % PRASHANT BHAGWAN WARE
%% Response-stimulus model 
follower = xlsread('D:\@IITK_sem1\Computional_CE787A\matlab\Follower.xlsx');
leader = xlsread('D:\@IITK_sem1\Computional_CE787A\matlab\leader.xlsx');

s = size(follower,1);
vdiff=leader(1:end,4)-follower(1:end,4);
xdiff=leader(1:end,3)-follower(1:end,3);
acc_f = follower(2:end,5);
acc= log(acc_f./vdiff(1:end-1));
constatnt = ones(s,1);
c_alpha = constatnt(1:end-1);
logv_f = log(follower(2:end,4));
logx = -log(xdiff(1:(end-1)));
add = [c_alpha,logv_f,logx];
parameter = add\acc
alpha = exp(parameter(1,1))
m= parameter(2,1)
l= parameter(2,1)

%% acceleration of leader
accleader = NaN(size(leader,1),1);
accleader(2:end) = leader(2:(end),4)-leader(1:(end-1),4);
accleader =accleader./0.1;
leader = [leader,accleader];
%% plotting 
plot(leader(:,1),leader(:,6));
hold on
plot(follower(:,1),follower(:,5));
xlabel('Time (sec)') % axis name 
xticks(350:1:370);
ax = gca;
ax.XAxisLocation = 'origin';
ylabel('Acceleration (m/s2)')
title(' acceleration Vs Time Plot') 
legend('leader','follower')
hold off