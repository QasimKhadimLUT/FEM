% Creates boundary conditions
% CaseBC 0 = free, no linear constraints, 1 = cantilever, 2 = ss, 3 = pendulum, translatios are ficed at node 1 


% Set vector of linear constraints
bc = logical(ones(1,nx));

if Element==12    
    if CaseBC==1    % all fixed at clambed end
        bcInd=xlocChosen(DofsAtNode,1,[1]);      
      
    elseif CaseBC==3        
    
    else
        
    end    

elseif Element==13    
    
else
    disp('****** Choose a valid element !! (Error from CreateBC.m) ******');  
end


if bcInd~=0
    bc(bcInd)=0;                       % number of degrees of freedom of system after linear constraints  
end

     