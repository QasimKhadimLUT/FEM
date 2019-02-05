%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% ProblemData.m - Give problem data
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

if Case==1 % Uniaxially loaded rod
    H=0.1;
    W=H;
    A=H*W;
    L=2;
    E=2.07e11;
    Fx=10^6;  % tip load   
    CaseBC=1;       % Fixed end    
    rho=7850;           % density
    g=9.81;
    
elseif Case==100  % Dynamic test
    A=0.1;
    L=1;
    E=2.07e11;
    Fx=-5e8*H^3;  % tip load 
    
    rho=7850;           % density
    g=9.81;
    
else
     disp(['Choose a valid case !'])
end
