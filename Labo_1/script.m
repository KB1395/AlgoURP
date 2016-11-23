%A = dlmread('etape4mono.cubes');  

%A=[3,1,1;2,1,1;3,3,1;2,3,3]; 
A=[3,2,1;1,1,1;3,2,3;2,2,3];
B=size(A,2);
cube=complement(A,B)