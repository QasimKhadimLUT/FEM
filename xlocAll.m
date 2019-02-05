function xlocAll= xlocAll(nloc)
% function xlocAllANCF makes full xloc for all elements 
% xlocAll creates array where dof's ID are shown for every element
%
% For two 2D four node plane elements, for example
% xlocAll = 
% Element 1 [u1 u2 u3 u4 u5 u6 u7 u8 
% Element 2  u9 u10 u11 u12 u13 u14 u15 16]
%    
%

DofsAtNode=1;
NodesAtElem=2;

[nl,m] = size(nloc);
xlocAll = zeros(nl,DofsAtNode*NodesAtElem);


for k = 1:nl
  n1 = [nloc(k,1)*DofsAtNode-(DofsAtNode-1):1:nloc(k,1)*DofsAtNode];
  n2 = [nloc(k,2)*DofsAtNode-(DofsAtNode-1):1:nloc(k,2)*DofsAtNode];
  xlocAll(k,:) = [n1 n2];
end
