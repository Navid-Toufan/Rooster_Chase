clc
clear all
close all
chessboard=cell(8);
chessboard(:)={0};
Cellsnum=64;
for i=1:Cellsnum
    if (1 < i && i <= 8 ) || ( 17 < i && i <= 24 ) || ( 33 < i && i <= 40 ) || ( 49 < i && i <= 56 )
        if mod(i,2)==0
            chessboard{i}=1;
        elseif mod(i,2)==1
            chessboard{i}=0;
        end
    end
    if (9 <= i && i < 16) || ( 25 <= i && i < 32 ) || ( 41 <= i && i < 48 ) || ( 57 <= i && i < 64)
        if mod(i,2) == 0
            chessboard{i} = 0;
        elseif mod(i,2) == 1
            chessboard{i} = 1;
        end
    end
end
chessboard;
openfig('RoosterCheesB.fig');
iter = 0;
movechoose = [];
move = [];
boardstate = [];
for sequence = repmat([8, 3],Cellsnum); 

    iter = iter+1;
    if sequence == 8
        if iter == 1
            save = chessboard{64};
            chessboard{64} = 8;
            [x] = ShowBoard(chessboard);
            state = [8,8,0,8];
        else
            [movechoose] = RouterRooster(chessboard);
            len = size(movechoose);
            move = movechoose(randi(len(1,1)),:);
            beforset = chessboard{move(1,1),move(1,2)};
            chessboard{move(1,1),move(1,2)} = 8;
            state = [move(1,1),move(1,2),beforset,8];
            chessboard{boardstate(iter-2,1),boardstate(iter-2,2)} = boardstate(iter-2,3);
            [x] = ShowBoard(chessboard);
        end
    end
    if sequence == 3
        pause(0.5)
        delete(x);
        if iter == 2
            save = chessboard{1};
            chessboard{1} = 3 ;
            [x] = ShowFarmer(chessboard);
            state = [1,1,0,3];
        else
            [movechoose] = RouterFarmer(chessboard) ;
            farmer = movechoose;
            [answer] = MoveFarmer(boardstate,iter,farmer);
            beforset = chessboard{answer(1,1),answer(1,2)};
            if chessboard{answer(1,1),answer(1,2)} == 8
                [x] = ShowBoard(chessboard);
                chessboard{answer(1,1),answer(1,2)} = 3;
                state = [answer(1,1),answer(1,2),beforset,3];
                chessboard{boardstate(iter-2,1),boardstate(iter-2,2)} = boardstate(iter-2,3);
                [x] = ShowFarmer(chessboard);
                break;
            else
                chessboard{answer(1,1),answer(1,2)} = 3;
                state = [answer(1,1),answer(1,2),beforset,3];
                chessboard{boardstate(iter-2,1),boardstate(iter-2,2)}=boardstate(iter-2,3);
                [x] = ShowFarmer(chessboard);
            end
        end
    end
    boardstate(end+1,:) = state;
end
chessboard;
step = iter/2;

