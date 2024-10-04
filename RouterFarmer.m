function [movechoose]=RouterFarmer(chessboard)
row=0;col=0;stateright=[0,0,0];statebottom=[0,0,0];movechoose=[0,0,0];allchoose=[0,0,0];
for i=1:8
    for j=1:8
        if chessboard{i,j}==3
            if j+1<=8
                right=chessboard{i,j+1};
                row=i;
                col=j+1;
                stateright=[row col right];
            end
            if i+1<=8
                bottom=chessboard{i+1,j};
                row=i+1;
                col=j;
                statebottom=[row col bottom];
            end
        end
    end
end
allchoose=[ stateright;statebottom];
movechoose = allchoose(any(allchoose,2),:);
return;