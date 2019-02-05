% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% run_LinStatic1D.m - main code
% The code solves linear static analysis based on the FEM
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

clear all
clc
close all
format long;
disp('Postgraduate Course in Finite Element Method: Bonus task 1')

% Choose element
Element=12;
%Element=2322;
nmesh=[1,2,4,8];     % Vector of meshes (element numbers) to be computed

% Select problem for computation
Case=1;
Ffigplot=0;

%########## Reads element's data ###############################
ElementData;   
%################################################################

%########## Reads problem's data ################################
ProblemData;
%################################################################


Case1 = [];

for nElems=nmesh         % Loop over all defined meshes: nmesh=[1 ....])
     clear P0 xloc u0 u q0 q bc Fext Fextc K Kc;    % clear previous mesh definitions

    %########## Creates finite element mesh for a simple beam-type structure #############  
    CreateFEMesh;
    %################################################################
    
    %########## Creates boundary conditions bc #############  
    CreateBC;
    %################################################################
    %########## Creates boundary conditions bc #############  
    CreateFext;
    %################################################################
            
        
    ndof = sum(bc);     % Number of unconstrained DOFs          
     
     
    tic;
    [K,M] = GlobalMatr(nloc,L,nElems,nx,Element,E,A,rho);
    
    % Eliminate linear constraints
    Kc = K(bc,bc);
    Mc = M(bc,bc);
    Fextc=Fext(bc); 
    uuc = Kc\Fextc;         % compute displacements
    uu(bc) = uu(bc)+uuc;    % makes full vector of displacement with solved displacement
    q(bc) = q(bc)+uuc;      % updates position vector            
    
       
    titer=toc;
    disp(['CPU-time: ' num2str(titer)]);
      
       
    
%     % Pick nodal displacements from result vector
     if Element==12 % 
         ux = uu(xlocChosen(DofsAtNode,nn,[1])); 
     elseif Element==13 
    else
        disp('****** Choose a valid element !! ******');  
    end  
    Case1 = [Case1; nElems ndof ux];

      % Eigenfrequency analysis 
      [V,d] = eig(Kc,Mc);
      dd = real(diag(d));
      [ds,ind] = sort(dd);
      Vs = V(:,ind);      
      w = real(sqrt(ds));   % Eigenfrequencies of the gen. problem

       
end

% POST PROCESSING ###############################################
PostProcessing
%################################################################
   









