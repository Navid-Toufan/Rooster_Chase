function [movechoose]=RouterRoster(chessboard)
stateleft=[0,0,0];row=0;col=0;stateright=[0,0,0];stateup=[0,0,0];statebottom=[0,0,0];movechoose=[0,0,0];allchoose=[0,0,0];
for i=1:8
    for j=1:8
        if chessboard{i,j}==8
            if j-1>=1
                left=chessboard{i,j-1};
                row=i;
                col=j-1;
                stateleft=[row col left];
            end
            if j+1<=8
                right=chessboard{i,j+1};
                row=i;
                col=j+1;
                stateright=[row col right];
            end
            if i-1>=1
                up=chessboard{i-1,j};
                row=i-1;
                col=j;
                stateup=[row col up];
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
allchoose=[ stateleft ;stateright;stateup; statebottom];
movechoose = allchoose(any(allchoose,2),:);
return;