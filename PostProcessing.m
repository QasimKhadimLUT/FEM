% Postprocessing

if Case==1,
    dL=Fx*L/(E*A);      % basic eq, linear elasticity sigma=N/A; epsilon=dL/L
    duNormalized=Case1(:,3)/dL;
    
    disp(sprintf('Linear static test, Case  %g, Element = %g, Fx=%g', Case, Element, Fx))
    disp('& Mesh & DOFs & ux & Normalized ux\\)')
    for k=1:size(Case1,1) 
        disp(sprintf('& %4d & %4d  & %10.6f & %10.6f \\\\',Case1(k,[1:3]),duNormalized(k)))
    end

    
end
% 
% Visualization of displacement
if Ffigplot==1,
figure(1);
set(gca, 'FontSize', [20], 'FontName','Times New Roman');
set(text, 'FontSize', [20], 'FontName','Times New Roman'); 

xlabel('{\it{X}} [m]','FontName','Times New Roman','FontSize',[20]),ylabel('{\it{Y}} [m]','FontName','Times New Roman','FontSize',[20]),zlabel('Z [m]','FontName','Times New Roman','FontSize',[20]);

title(['Displacements: X:' ,num2str(ux) ,'  Y:', num2str(uy)],'FontName','Times New Roman','FontSize',[20]); 

for k = 1:nl
    if Element==12
        nodes=nloc(k,1:2);
        q0k=q0(xlocChosen(DofsAtNode,nodes,[1:DofsAtNode]));
        qk=q(xlocChosen(DofsAtNode,[1:DofsAtNode]));    
    elseif Element==13
       
    
    else
        disp('****** Choose valid element !!  ******');  
    end
    % make visualisation that draws line between nodes qk
   
end
end