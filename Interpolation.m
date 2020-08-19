function [] = Interpolation()

prompt1 = "Choose an interpolation to begin: ";

prompt2 = "Enter Values of x coordination: ";

prompt3 = "Enter function or coordinations for fi: ";

prompt4 = "Enter desired value for interpolation: ";

x = input(prompt2);
fi = input(prompt3);
alpha = input(prompt4);

flag = false;

h = x(2)-x(1);
for i = 2:length(x)
    if(h == x(i)-x(i-1))
        flag = true;
        
    else
        flag = false;
        break;
    end
end

while(true)
    clc;
    disp(" ");
    disp("x = ");
    disp(x);
    disp("fi = ");
    disp(fi);
    disp("alpha = "+alpha);
    disp(" ");
    disp("Enter the number assigned to a method:");
    disp("1)Lagrange Interpolation");
    disp("2)Newton Interpolation");
    disp("3)Newton Forward/Backward Interpolation");
    disp("4)Exit!");
    disp(" ");
    str = input(prompt1, 's');
    
    if(str == '1')
        clc;
        Lagrange_Interpolation(x, fi, alpha);
        Interpolation();
    
    elseif(str == '2')
        clc;
        Newton_Interpolation(x, fi, alpha);
        Interpolation();
    
    elseif(str == '3')
        clc;
        if(flag == true)
            Newton_Forward_Backward_Interpolation(x, fi, alpha);
            Interpolation();
        else 
            fprintf(2,'\nThis interpolation requires equal distance between each x(i) and x(i+1)\n');
            Interpolation();
        end
        elseif(str == '4')
    clc;
    break;
    
    else
        clc;
        fprintf(2,'\nYou have entered a wrong input. Please try again!\n');
        Interpolation();
    end
       
   break;
end


end

