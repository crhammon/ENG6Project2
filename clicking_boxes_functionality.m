load plots123
figure(1)
image(plot1)
hold on

for c=1:15:size(plot1,2)
    for b=1:15:size(plot1,1)
    square=rectangle('position',[c b 15 15],'PickableParts','all','visible','off','FaceColor','b','ButtonDownFcn',@boxCallback);
    end
end