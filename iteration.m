%Initialize Q first
Q=randi(10,[50,50,3,6,6,6]);
R = [];
%Run the iteration
for t= 1: 10
sim('IterationExample.slx')
Q=Qnew;
x = Qnew(1,2,1,2,1,2)
R = [R;ep_r] 
end

plot(R)