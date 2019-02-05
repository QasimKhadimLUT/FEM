function [P,nloc] = linemesh(Element,n,L)
%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% CreateFEMesh.m -  make a linemesh with fem elements
% P includes coordinates at every node
% nloc tells elements connectivity
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

% number of nodes 
nodes=n*2-(n-1);

% Geospace is for spacing
xk=geospace(0,L,nodes,1)';

P = [];
Pk = [xk];  
P = [P; Pk]; 

% generate elememnt connectivity
nloc = [];

for k = 1:n
    loc = [(k-1)*1+1 (k-1)*1+2];
    nloc = [nloc; loc];
end
