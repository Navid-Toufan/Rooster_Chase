function [answer]=movefarmer(boardstate,iter,farmer)
answer=0;
distancerow=boardstate(iter-1,1)-boardstate(iter-2,1);
distancecolumn=boardstate(iter-1,2)-boardstate(iter-2,2);
d = max(distancerow,distancecolumn);
if distancecolumn>distancerow
    answer=farmer(1,1:2);
elseif distancerow>distancecolumn
    answer=farmer(2,1:2);
end
return;