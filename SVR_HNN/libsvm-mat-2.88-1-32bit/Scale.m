function scaled = Scale(Data, Lower, Upper)
tic

% scale the elements of all the column vectors in the range of [Lower Upper]. (default [-1 1])

 if (nargin<3) 
    Lower = -1;
    Upper = 1;
  elseif (Lower > Upper)
     disp (['Wrong Lower or Upper values!']);
  end
    Lower = -1;
    Upper = 1;



[MaxV, I]=max(Data);
[MinV, I]=min(Data);

[R,C]= size(Data);

scaled =(Data-ones(R,1)*MinV).*(ones(R,1)*((Upper-Lower)*ones(1,C)./(MaxV-MinV)))+Lower;

toc
%end

