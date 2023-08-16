clc, clear
follower= readmatrix("Follower.xlsx")
leader = readmatrix("Leader.xlsx")
follower, leader
T=0.1
t= follower(:,1)
pos_subject = follower(:,3)
vel_subject = follower(:,4)
acc_subject = follower(:,5)
pos_leader = leader(:,3)
vel_leader = leader(:,4)

follower{t+T}(:,5)= alpha*follower{t+T}(:,4)^m*(leader{t}(:,4)-follower{t}(:,4))/(leader{t}(:,3)-follower{t}(:3))^leader

