function cubout = complement(cubin, nbvar) %cubin est le parametre in qu'on rentre dans le cube  
                                 %cubout est le parametre en sortie rendu par la fonction complement
alldontcare=false;
if (isempty(cubin))
      i=0;  %on mets ; pour eviter les affichages
      cubout=[]; %on cree la matrice qui attend d'etre remplie
      A=[3];
      while i<nbvar
          cubout=[cubout, A];
          i=i+1;
          
      end    
else
      if (size(cubin,1)==1) 
              nbr=1;
              output=[];
              cubout=[];
              M=[3];
              N=[2];
              O=[1];
              while nbr<=nbvar
                  if cubin(1,nbr)==1
                      x=1;
                      while x<nbr
                          output=[output,M];
                          x=x+1;
                      end
                      output=[output,N];
                      x=x+1;
                      while x<=nbvar
                          output=[output,M];
                          x=x+1;
                      end
                      cubout=[cubout;output];
                      output=[];
                  
                  elseif cubin(1,nbr)==2
                      x=1; 
                      while x<nbr
                          output=[output,M];
                          x=x+1;
                      end
                      output=[output,O];
                      x=x+1;
                      while x<=nbvar
                          output=[output,M];
                          x=x+1;
                      end
                      cubout=[cubout;output];
                      output=[];
                  
                     
                  end
                  nbr=nbr+1;
              end
      else            
          i=1;
          a=size(cubin,1);
          while i<a

              if (all(cubin(i,:)==cubin(i,1)) && cubin(i,1)==3)

                    cubout=[];
                    alldontcare=true;
              end
              i=i+1;

          end       
          if (alldontcare==false)
                nateline=1;
                column=1;
                
                
                higher1=0;
                higher2=0;
                higheruni=0;
                mostunate=0;
                mostbinate=0;
                    
                while (column<=size(cubin,2))
                    amount1=0;
                    amount2=0;
                    amount3=0;
                    
                    
                    
                    while nateline<=size(cubin,1)
                            
                        if (cubin(nateline,column)==1)
                            amount1=amount1+1;
                        elseif (cubin(nateline,column)==2)
                            amount2=amount2+1;
                        end
                        
                        nateline=nateline+1;
                    end
                    if (amount1==0 && amount2!=0)
                        if (amount2>higher2 && amount2>higher1)
                            higher2=amount2;
                            mostunate=column;
                        end
                    elseif (amount1!=0 && amount2==0)
                        if (amount1>higher1 && amount1>higher2)
                            higher1=amount1;
                            mostunate=column;
                        end
                    elseif (amount1!=0 && amount2!=0)
                        if (amount1>higheruni)
                            mostbinate=column;
                            higheruni=amount1;
                        elseif(amount2>higheruni)
                            mostbinate=column;
                            higheruni=amount2;
                        end
                    end
                    nateline=1;
                    column=column+1;
                end
                if (mostunate!=0 && mostbinate==0)
                    x=mostunate
                else
                    x=mostbinate
                end
                
                i=1;
                cofacP=cubin;
                cofacN=cubin;
                while (i<=size(cofacN,1))
                    if cubin(i,x)==2
                        cofacN(i,x)=3;
                    elseif cubin(i,x)==1
                        if cubin(i+1,x)==2
                            cofacN(i+1,x)=3;
                        elseif cubin(i+1,x)==1
                            cofacN(i+1,:)=[];
                        end
                        cofacN(i,:)=[];
                        
                    end
                    i=i+1;
                end
                N=cofacN
                i=1;
                while (i<=size(cofacP,1))
                
                    if cofacP(i,x)==2
                        if cofacP(i+1,x)==2
                            cofacP(i+1,:)=[];
                        elseif cofacP(i+1,x)==1
                            cofacP(i+1,x)=3;
                        end
                        cofacP(i,:)=[];
                    elseif cofacP(i,x)==1
                        cofacP(i,x)=3;
                    end
                    i=i+1;
                    
                end
                P=cofacP        
                
                
          end             
              
          
          
          
      end
      
             
end
