function [] = Newton_Interpolation(x,fi,alpha)

    %Initial variables
    
    %%alpha is the given x which its y is desired for every degree
    %%x is an array which contains the x coordination of DataSets
    %%fi is an array which contains the fi coordination of DataSets
    
        
    Mul = ones(length(x),length(x));
    P = zeros (length(x));

    
    %Clear command window
    clc;

    
    %Matrix C generates and keeps the "fi"s table for desired polynomials
    %
    %First column of matrix C
    for i = 1 : length(fi)

        C(i,1) = fi(i);

    end

    %Rest of the columns of Matrix C
    for i = 2 : length(fi)

        k = 0;

        for j = 2 : i
            
            k = k + 1;          %First index keeper
            C(i,j) = (C(i,j-1) - C(i-1, j-1)) / (x(i) - x(i-k));

        end

    end

    %Displays and prints Matrix C
    disp("C =");
    disp(C);


    %Matrix Mul generates and keeps "x - x(i)"s
    %
    %First column of Matrix has been defined at initial variables' section
    %Rest of the columns of Matrix Mul
    for i = 1 : length(x)

        for j = 2 : i

            Mul(i,j) = Mul(i,j-1) * (alpha - x(j-1));

        end
        
    end

    %Displays and prints Matrix C
    disp("Mul =");
    disp(Mul);

    
    %Array P generates and keeps results of polynomials of all degrees 
    %that pass through all the points in given DataSets.
    %
    %Array P generation
    for k = 1 : length(x)

        for i = 1 : k

            for j = 1 : i

                z =  (Mul(i,j) * C(i,j));

            end

            P(k) = P(k) + z;

        end
        
        %Displays polynomials and their results for desired alpha (or x)
        
        disp("P" + k + "("+ alpha + ") = " + P(k));

    end
    
    disp(" ");
    disp("Press Enter");
    input('');
    clc;


end

