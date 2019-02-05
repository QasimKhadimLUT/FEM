%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% ElementData.m - Define element properties
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

if Element==12
    ElemType='1D two noded 2 dofs FEM rod';  
    ElemNodes=2;
    DofsAtNode=1;
    ElemDofs=ElemNodes*DofsAtNode;
    DIM=1;  
elseif Element==13
    ElemType='1D three noded 3 dofs FEM rod';  
    ElemNodes=3;
    DofsAtNode=1;
    ElemDofs=ElemNodes*DofsAtNode;
    DIM=1;                 
else
    disp('****** Choose a valid element !! (ElementData.m) ******');  
end