function [A] = boundary(YM,UM,VM,depthMerge,holesV,height,width,cMedian)

 %calcuting the boundaries
 A=holesV;
 B= bwboundaries(A);
%getting the Size of the row and then we will minus one because we dnt want
%firt row and we will have the count of holes boundaires returned
 [m,n] = size(B);
 holeSize=m-1;
 %starting from 2 because we dnt want row 1 of the B array
 counter=2;
 for i=1:holeSize
     %copying array form the B results
     boundrayArray=B{counter,1};
     [row,column]=size(boundrayArray);
     for j=1:row
            pixelX=boundrayArray(j,1);
            pixelY=boundrayArray(j,2);
            
             %first boundary 8 side
             
                aboves = [pixelX - 1, pixelY];
                belows = [pixelX + 1, pixelY];
                lefts = [pixelX, pixelY - 1];
                rights = [pixelX, pixelY + 1];
                aboveleft = [pixelX - 1, pixelY - 1];
                aboveright = [pixelX-1, pixelY + 1];
                belowleft = [pixelX + 1, pixelY - 1];
                belowright = [pixelX + 1, pixelY + 1]; 
            
                 %boundary Checks
                %calucating the Size of the orginal array
                [AX,AY]=size(A);
                
                Xaxis=aboves(1,1);
                Yabove=aboves(1,2);
               
                Xbelow=belows(1,1);
                Ybelow=belows(1,2);
                
                Xleft=lefts(1,1);
                Yleft=lefts(1,2);
               
                Xright=rights(1,1);
                Yright=rights(1,2);
                
                Xaboveleft=aboveleft(1,1);
                Yaboveleft=aboveleft(1,2);
                
                Xaboveright=aboveright(1,1);
                Yaboveright=aboveright(1,2);
                
                Xbelowleft=belowleft(1,1);
                Ybelowleft=belowleft(1,2);
                
                Xbelowright=belowright(1,1);
                Ybelowright=belowright(1,2);
               
                %Second boundary 16 side
             
             aboveLeft2=[pixelX-2,pixelY-1];
             above2=[pixelX-2,pixelY];
             aboveRight2=[pixelX-2,pixelY+1];
            
             belowLeft2=[pixelX+2,pixelY-1];
             below2=[pixelX+2,pixelY]; 
             belowRight2=[pixelX+2,pixelY+1];
             
             aboveLeftTop2=[pixelX-2,pixelY-2];
             aboveLeftMiddle2=[pixelX-1,pixelY-2];
             left2=[pixelX,pixelY-2];
             belowLeftMiddle2=[pixelX+1,pixelY-2];
             belowLeftLow2=[pixelX+2,pixelY-2];
             
             aboveRightTop2=[pixelX-2,pixelY+2];
             aboveRightMiddle2=[pixelX-1,pixelY+2];
             right2=[pixelX,pixelY+2];
             belowRightMiddle2=[pixelX+1,pixelY+2];
             belowRightLow2=[pixelX+2,pixelY+2];
             
               %boundary Checks
                %calucating the Size of the orginal array
               
                XaboveLeft2=aboveLeft2(1,1);
                YaboveLeft2=aboveLeft2(1,2);
                
                Xabove2=above2(1,1);
                Yabove2=above2(1,2);
              
                XaboveRight2=aboveRight2(1,1);
                YaboveRight2=aboveRight2(1,2);
              %-----------------  
                XbelowLeft2= belowLeft2(1,1);
                YbelowLeft2= belowLeft2(1,2);
                
                Xbelow2=below2(1,1);
                Ybelow2=below2(1,2);
                
                XbelowRight2=belowRight2(1,1);
                YbelowRight2=belowRight2(1,2);
               %------------------
                XaboveLeftTop2= aboveLeftTop2(1,1);
                YaboveLeftTop2= aboveLeftTop2(1,2);
                
                XaboveLeftMiddle2=aboveLeftMiddle2(1,1);
                YaboveLeftMiddle2=aboveLeftMiddle2(1,2);
              
                Xleft2=left2(1,1);
                Yleft2=left2(1,2);
                
                XbelowLeftMiddle2=belowLeftMiddle2(1,1);
                YbelowLeftMiddle2=belowLeftMiddle2(1,2);
             
                XbelowLeftLow2=belowLeftLow2(1,1);
                YbelowLeftLow2=belowLeftLow2(1,2);
                
             %----------------------   
                
                XaboveRightTop2= aboveRightTop2(1,1);
                YaboveRightTop2= aboveRightTop2(1,2);
                
                XaboveRightMiddle2=aboveRightMiddle2(1,1);
                YaboveRightMiddle2=aboveRightMiddle2(1,2);
              
                Xright2=right2(1,1);
                Yright2=right2(1,2);
                
                XbelowRightMiddle2=belowRightMiddle2(1,1);
                YbelowRightMiddle2=belowRightMiddle2(1,2);
             
                XbelowRightLow2=belowRightLow2(1,1);
                YbelowRightLow2=belowRightLow2(1,2);
                
           
                %now boundray is secure now we check if the coordinates
                %values are 1 then we change it to zero
              
               if(Xaxis>0 && Xaxis<=AX)
                     if(A(Xaxis,Yabove)==1)
                        A(Xaxis,Yabove)=0;
                     end 
                     
                     if(Xabove2>0 && Yabove2>0 && Xabove2<=AX && Yabove2<=AY)
                       if(A(Xabove2,Yabove2)==1)
                         A(Xabove2,Yabove2)=0;
                       end
                     end
               end
                
               
               if(Xbelow>0 && Xbelow<=AX)
                    if(A(Xbelow,Ybelow)==1)
                        A(Xbelow,Ybelow)=0;
                    end  
                    
                    if(Xbelow2>0 && Ybelow2>0 && Xbelow2<=AX && Ybelow2<=AY)
                            if(A(Xbelow2,Ybelow2)==1)
                            A(Xbelow2,Ybelow2)=0;      
                            end
                    end
               end
               
                if(Yleft>0 && Yleft<=AY)
                       
                        if(A(Xleft,Yleft)==1)
                        A(Xleft,Yleft)=0;
                        end
                        
                       if(Xleft2>0 && Yleft2>0 && Yleft2<=AY && Xleft2<=AX )
                         if(A(Xleft2,Yleft2)==1)
                           A(Xleft2,Yleft2)=0;
                         end
                       end
                        
                end
                
                if(Yright>0 && Yright<=AY)
                        if(A(Xright,Yright)==1)
                        A(Xright,Yright)=0;
                        end
                        
                        if(Xright2>0 && Yright2>0 && Xright2<=AX && Yright2<=AY )
                            if(A(Xright2,Yright2)==1)
                            A(Xright2,Yright2)=0;
                            end
                        end
                        
                end
                
                if(Xaboveleft>0 && Yaboveleft>0 && Yaboveleft<=AY && Xaboveleft<=AX) 
                        if(A(Xaboveleft,Yaboveleft)==1)
                        A(Xaboveleft,Yaboveleft)=0;
                        end
                        
                        if(XaboveLeft2>0 && YaboveLeft2>0 && XaboveLeft2<=AX && YaboveLeft2<=AY )
                            if(A(XaboveLeft2,YaboveLeft2)==1)
                            A(XaboveLeft2,YaboveLeft2)=0;
                            end
                        end
                        
                        if(XaboveLeftTop2>0 && YaboveLeftTop2>0 && XaboveLeftTop2<=AX && YaboveLeftTop2<=AY )
                            if(A(XaboveLeftTop2,YaboveLeftTop2)==1)
                            A(XaboveLeftTop2,YaboveLeftTop2)=0;
                            end
                        end
                        
                        if(XaboveLeftMiddle2>0 && YaboveLeftMiddle2>0 && XaboveLeftMiddle2<=AX && YaboveLeftMiddle2<=AY )
                            if(A(XaboveLeftMiddle2,YaboveLeftMiddle2)==1)
                            A(XaboveLeftMiddle2,YaboveLeftMiddle2)=0;
                            end
                        end
                        
                end
                
                if(Xaboveright>0 && Yaboveright>0 && Yaboveright<=AY && Xaboveright<=AX)
                        if(A(Xaboveright,Yaboveright)==1)
                        A(Xaboveright,Yaboveright)=0;
                        end
                        
                        if(XaboveRight2>0 && YaboveRight2>0 && XaboveRight2<=AX && YaboveRight2<=AY)
                            if(A(XaboveRight2,YaboveRight2)==1)
                            A(XaboveRight2,YaboveRight2)=0;      
                            end
                        end
                        
                        if(XaboveRightTop2>0 && YaboveRightTop2>0 && XaboveRightTop2<=AX && YaboveRightTop2<=AY)
                            if(A(XaboveRightTop2,YaboveRightTop2)==1)
                            A(XaboveRightTop2,YaboveRightTop2)=0;      
                            end
                        end
                        
                        if(XaboveRightMiddle2>0 && YaboveRightMiddle2>0 && XaboveRightMiddle2<=AX && YaboveRightMiddle2<=AY)
                            if(A(XaboveRightMiddle2,YaboveRightMiddle2)==1)
                            A(XaboveRightMiddle2,YaboveRightMiddle2)=0;      
                            end
                        end
                        
                end
                
                if(Xbelowleft>0 && Ybelowleft>0 && Ybelowleft<=AY && Xbelowleft<=AX)
                        if(A(Xbelowleft,Ybelowleft)==1)
                        A(Xbelowleft,Ybelowleft)=0;
                        end
                        
                        if(XbelowLeft2>0 && YbelowLeft2>0 && XbelowLeft2<=AX &&YbelowLeft2<=AY )
                            if(A(XbelowLeft2,YbelowLeft2)==1)
                            A(XbelowLeft2,YbelowLeft2)=0;
                            end
                        end
                        
                        if(XbelowLeftMiddle2>0 && YbelowLeftMiddle2>0 && XbelowLeftMiddle2<=AX &&YbelowLeftMiddle2<=AY )
                            if(A(XbelowLeftMiddle2,YbelowLeftMiddle2)==1)
                            A(XbelowLeftMiddle2,YbelowLeftMiddle2)=0;
                            end
                        end
                        
                        if(XbelowLeftLow2>0 && YbelowLeftLow2>0 && XbelowLeftLow2<=AX && YbelowLeftLow2<=AY )
                            if(A(XbelowLeftLow2,YbelowLeftLow2)==1)
                            A(XbelowLeftLow2,YbelowLeftLow2)=0;
                            end
                        end
                        
                end
                
                if(Xbelowright>0 && Ybelowright>0 && Ybelowright<=AY && Xbelowright<=AX)
                        
                        if(A(Xbelowright,Ybelowright)==1)
                          A(Xbelowright,Ybelowright)=0;
                        end
                        
                        if(XbelowRight2>0 && YbelowRight2>0 && XbelowRight2<=AX && YbelowRight2<=AY)
                            if(A(XbelowRight2,YbelowRight2)==1)
                            A(XbelowRight2,YbelowRight2)=0;      
                            end
                        end
                        
                        if(XbelowRightMiddle2>0 && YbelowRightMiddle2>0 && XbelowRightMiddle2<=AX && YbelowRightMiddle2<=AY)
                            if(A(XbelowRightMiddle2,YbelowRightMiddle2)==1)
                            A(XbelowRightMiddle2,YbelowRightMiddle2)=0;      
                            end
                        end
                        
                        if(XbelowRightLow2>0 && YbelowRightLow2>0 && XbelowRightLow2<=AX && YbelowRightLow2<=AY)
                            if(A(XbelowRightLow2,YbelowRightLow2)==1)
                            A(XbelowRightLow2,YbelowRightLow2)=0;      
                            end
                        end
                        
                end
           
     end
     counter=counter+1;
    
 end
 1 0 1 0 0 0 0 0 1 1 1 1 0 0 1
 1 0 1 0 0 1 1 0 1 1 1 1 0 0 1
 1 0 1 0 0 0 0 0 1 1 1 1 0 0 1
 %%Creating Transition boundary test     
     for i=1:height
         for j=1:width
            %checking if its a valid index
            if(j+1<=width)
                if(A(i,j)==1 && A(i,j+1)==1)
                    if(depthMerge(i,j)<cMedian && depthMerge(i,j+1)>=cMedian)
                    %%create boundary
                    %%checking index if the first boundary is valid then we
                    %%check for 2nd
                   
                    %first 8 boundary
                    abovesXT =i-1;
                    abovesYT = j;
                    belowsXT = i+1;
                    belowsYT =j;
                    leftsXT = i;
                    leftsYT =j-1;
                    rightsXT = i;
                    rightsYT =j+1;
                    aboveleftXT = i-1;
                    aboveleftYT =j-1;
                    aboverightXT = i-1;
                    aboverightYT = j+1;
                    belowleftXT = i+1;
                    belowleftYT = j-1;
                    belowrightXT = i+1; 
                    belowrightYT = j+1; 
                   
                    %%16
                     aboveLeft2XT=i-2;
                     aboveLeft2YT=j-1;
                     above2XT=i-2;
                     above2YT=j;
                     aboveRight2XT=i-2;
                     aboveRight2YT=j+1;

                     belowLeft2XT=i+2;
                     belowLeft2YT=j-1;
                     below2XT=i+2; 
                     below2YT=j;
                     belowRight2XT=i+2;
                     belowRight2YT=j+1;

                     aboveLeftTop2XT=i-2;
                     aboveLeftTop2YT=j-2;
                     aboveLeftMiddle2XT=i-1;
                     aboveLeftMiddle2YT=j-2;
                     left2XT=i;
                     left2YT=j-2;
                     belowLeftMiddle2XT=i+1;
                     belowLeftMiddle2YT=j-2;
                     belowLeftLow2XT=i+2;
                     belowLeftLow2YT=j-2;

                     aboveRightTop2XT=i-2;
                     aboveRightTop2YT=j+2;
                     aboveRightMiddle2XT=i-1;
                     aboveRightMiddle2YT=j+2;
                     right2XT=i;
                     right2YT=j+2;
                     belowRightMiddle2XT=i+1;
                     belowRightMiddle2YT=j+2;
                     belowRightLow2XT=i+2;
                     belowRightLow2YT=j+2;



                    
                    elseif(depthMerge(i,j)>=cMedian && depthMerge(i,j+1)<cMedian)
                    %%create boundary
                        
                        
                    end 
        
                    
                end
            end
            
         end
     end
     

end

