% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen 
% The code derives FE-matrices for a rod (bar, truss) element 
% Coded by MKM for student's usage in the FEM2019 course

clear all
clc
close all
disp('Postgraduate Course in Finite Element Method: Derivation of FE-matrices for rod element')

Element=12;             % 12 = 2 node rod element

% Geometrical variables
syms Lx A
syms Ly
syms Lz
% Material parameters
syms G E rho
% Damping parametres
syms alpha beta


% Let's find shape functions
if Element==12
    ElemType='2D rod FEM element 2dofs';
    DOFs=2;
    POLYNOMs=2;
    DIM=2;
    NODEs=2;
 
    syms x
   
    syms u1 u2
    uu=[u1,u2].';
  
   % [Node1,Node2]
    nx=[0,Lx].';
        
    % set of base functions
    p12=[1,x];    
    basis=p12;    
        
    for ii_node=1:NODEs,   
        for jj_pol=1:POLYNOMs,
          ii2=(ii_node-1)*(1)+1;
          %only for testing ------  
          AAAtest(ii2,jj_pol)=basis(jj_pol);              
          % substitution      
          AAA(ii2,jj_pol)=subs(basis(jj_pol),x,nx(ii_node));
        end
    end
    
    
    Nvec=basis*AAA^-1;      % Shape functions (ansatch) in x coordinates
   
    
    % Mass matrices
    
    % Lumbed mass matrix
    MlocLumped=rho*A*Lx*diag(ones(2,1));
    
    % Consistent mass matrix (via shape functions)
    NvecNvec=Nvec.'*Nvec;
    NvecNvec_intx=int(NvecNvec,x,0,Lx);
    MlocConsistent=rho*A*Lx*NvecNvec_intx;
    
    MlocConsistentRef=1/6*rho*A*Lx*[2,1;1,2];
    
   
    
    
    
%     % For external force vector (gravity, line lodas etc)
%     Smxi_dxideta=Smxi;
%     Smxi_deta=int(Smxi_dxideta,xi,-1,1);
%     Smxi_intA=int(Smxi_deta,eta,-1,1);
%     
    
   
elseif Element==13
    ElemType='2D rod FEM element 2dofs';
    NODEs=3;
   
else
    disp('****** No element !! ******');  
end

uh=Nvec*uu;             % approximated displacement field
Epsxx=diff(uh,x);        % Strain measure


Udx=1/2*E*A*Epsxx^2;     % Energy
U=int(Udx,x,0,Lx);

% Internal forces, elastic forces etc.
for kk=1:DOFs,
     Fe(kk)=diff(U,uu(kk));
end       

for ii=1:DOFs,
    for jj=1:DOFs, 
        KlocEnergy(ii,jj)=diff(Fe(ii),uu(jj));
    end    
end    

% Stiffness matrices for linear FE elements can be directly computed as follows:
for ii=1:POLYNOMs,
    DNvec_x(ii)=diff(Nvec(ii),x);
end

DNvec_x2=DNvec_x.'*DNvec_x;

for ii=1:DOFs,
    for jj=1:DOFs, 
        Kloc(ii,jj)=E*A*int(DNvec_x2(ii,jj),x,0,Lx);
    end    
end 

% Rayleighin vaimennusmatriisi
ClocRayleigh=alpha*MlocConsistent+beta*Kloc;

MlocLumped
MlocConsistent
Kloc


if Element==12
    matlabFunction(Kloc,'file','Kl_12','vars',{E,A,Lx});
    matlabFunction(MlocConsistent,'file','Ml_12','vars',{A,Lx,rho});
    matlabFunction(ClocRayleigh,'file','Cl_12','vars',{E,A,Lx,rho,alpha,beta});
elseif Element==13
    
else
    
end    
    


