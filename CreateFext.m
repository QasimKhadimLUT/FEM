%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% CreateFext.m - creates vector of external forces
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

Fext = zeros(nx,1); % Initialize vector of ext forces

if Case == 1
      Fext(xlocChosen(DofsAtNode,nn,1))= Fx;
end