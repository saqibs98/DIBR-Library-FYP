function [YM,UM,VM,holesV] = InverseMapping(Yl,Ul,Vl,Yr,Ur,Vr,YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline,height,width)
% h=3;
shiftLp= medfilt2(shiftL,[5 5]);
shiftRp= medfilt2(shiftR,[5 5]);

% shiftLp= medfilt2(shiftLp,[5 5]);
% shiftRp= medfilt2(shiftRp,[5 5]);
[u,v]=find(holesV==0);
k=size(u);
for i=1:k
     x=u(i);
     o=v(i);
     a=round(x/2);
     b=round(o/2);
     vy=shiftLp(x,o);
 if ((vy <= width) && (vy > 0))
     YM(x,o)=Yl(x,vy);
            VMD(x,o)=Yld(x,vy);
     UM(a,b)=Ul(a,round(vy/2));
     VM(a,b)=Vl(a,round(vy/2));
     holesV(x,o)=1;
 else
    vy = shiftRp(x,o);
    if ((vy <= width) && (vy > 0 ))
         YM(x,o)=Yr(x,vy);
            VMD(x,o)=Yrd(x,vy);
         UM(a,b)=Ur(a,round(vy/2));
         VM(a,b)=Vr(a,round(vy/2));
         holesV(x,o)=1;
     else
        vy = round(o + zInvL(x,o) * f * baseline); 
        if ((vy <= width) && (vy > 0))
            YM(x,o)=Yl(x,vy);
                VMD(x,o)=Yld(x,vy);
            UM(a,b)=Ul(a,round(vy/2));
            VM(a,b)=Vl(a,round(vy/2));
            holesV(x,o)=1;
        else
            vy = round( o - zInvR(x,o) * f * baseline);
            YM(x,o)=Yr(x,vy);
                VMD(x,o)=Yrd(x,vy);
            UM(a,b)=Ur(a,round(vy/2));
            VM(a,b)=Vr(a,round(vy/2));
            holesV(x,o)=1;
        end
    end
 end 
end 
end