function [K,M] = GlobalMatr(xloc,L,nl,nx,Element,E,A,rho)

% Initialize the global stiffness
K = zeros(nx,nx);
M = zeros(nx,nx);


% Loop over all elements to assemble the global stiffness
for ii = 1:nl    
    
    % Compute element's lengths, later compute it from coordinates.
    Lx=L/nl;
            
    % Get the elemental stiffness
    if Element==12
        % Initialize the local 
        % stiffness and residual
        Kloc = zeros(2,2);
        Mloc = zeros(2,2);
        floc = zeros(2,1);
        
        % Call local stiffness matrix derived by MATLAB syms 
        Kloc = Kl_12(E,A,Lx);
        Mloc = Ml_12(A,Lx,rho);
        
    elseif Element==13
       
    end %End of if conditions
        
    % Assemble the global matrix
    localsize=2;            % Element's size
    for jj = 1:localsize    
    	ind01 = xloc(ii,jj); %Index 01
        for kk = 1:localsize
            ind02 = xloc(ii,kk); % Index 02
            K(ind01,ind02) = K(ind01,ind02)+Kloc(jj,kk);
            M(ind01,ind02) = M(ind01,ind02)+Mloc(jj,kk);
        end
    end %End of Assembly
    
end %End of loop over all elements
