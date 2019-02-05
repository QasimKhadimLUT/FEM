%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% CreateFEMesh.m - Makes discretization in 1D
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

%Element=12;
%nElem=3;
%L=1;
%DofsAtNode=1;

[P0,nloc] = linemesh(Element,nElems,L);    
xloc=xlocAll(nloc);
% get number of nodes (nn), number of elements (nl) and total number of DOFs (nx)
[nn,~] = size(P0);
%[nl,~] = size(nloc);
nx = DofsAtNode*nn;          % dofs (no constraints eliminated) of stucture 

% create global vector of nodal coordinates
for jj=1:nn,
    q((jj-1)*DofsAtNode+1:(jj-1)*DofsAtNode+DofsAtNode)=P0(jj,:); 
end  

% Define initial position
q=q(:);
q0=q;

% Create the unknown vector
u0 = zeros(nx,1);
uu = u0; % Initialize the displacements