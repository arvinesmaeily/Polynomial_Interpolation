function [] = Lagrange_Interpolation(x,fi,alpha)
    
    
    %Initial values
    sum = 0;
    
    %%alpha is the given x which its y is desired for every degree
    %%x is an array which contains the x coordination of DataSets
    %%fi is an array which contains the fi coordination of DataSets
    
     
    
    %clear command window
    clc;
    
    %Array C generates and keeps  
    for i = 1 : length(x)

        U = 1;
        L = 1;
        for j = 1 : length(x)
            if j ~= i
                U = U * (alpha - x(j));
                L = L * (x(i) - x(j));
               z(i) = U / L;
                             
            end
            
        end
        
        

        C(i) = z(i) * fi(i);       
        sum = sum + C(i);
        
        %Display values of Pn(alpha)
        disp("P"+i+"("+alpha+") = "+sum);    
    end
    
    disp(" ");
    %Display values of Lagrange Polynomials
    for i = 1:length(x)
    disp("L("+i+") = "+z(i));
    end
    
    disp(" ");
    %Display L(i)f(i) values
    for i = 1:length(x)
        disp("L("+i+")f("+i+") = "+C(i));
    end
    
    disp(" ");
    disp("Press Enter");
    input('');
    clc;
    
    
end