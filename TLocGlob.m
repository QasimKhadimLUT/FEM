function T = TLocGlob(Element)
%---------------------------------------------------------
% Postgraduate Course in Finite Element Method (FEM2019)
% Teacher in charge: Marko Matikainen
%---------------------------------------------------------
% TLocGlobc.m - Transformation matrix: mapping from local 
% to global coordinate system 
% Coded by MKM for student's usage in the FEM2019 course
%---------------------------------------------------------

% Elements length
dx=x2-x1;
dy=y2-y1;
dL=(dx^2+dy^2)^(1/2);

sinAlpha=dy/dL;
cosAlpha=dx/dL;

% Transformation matrix for a two node rod element
T=[sinAlpha, cosAlpha, 0 , 0; 
  0 0, cosAlpha, sinAplha, 0, 0];