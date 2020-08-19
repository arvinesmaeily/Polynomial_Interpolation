function [] = Newton_Forward_Backward_Interpolation(x,fi,alpha)


%Initial variables


n = length(x);
h = (x(n) - x(1)) / (n-1) ;

delta = zeros(n,n);

%clear command window
    clc;



%delta's first colomn
for i = 1 : n
delta(i,1) = fi(i);
end

%rest of delta's matrix
for j = 2 : n
    for i = j : n
        
        delta(i,j) = delta(i,j-1) - delta(i-1,j-1);
        
        
    end
    
end

disp("Delta and Nabla Matrix: ");
disp(delta);

%nabla's matrix is the same as delta's matrix


%forward/backward method chooser
mid_x = length(x)/2;

if(mid_x - round(mid_x)> 0.5)    
    mid_x = ceil(mid_x);
else    
    mid_x = floor(mid_x);
end
disp("mid = "+mid_x);

if(x(mid_x) >= alpha)
    
    disp("Chosen Method: Forward Newton Interpolation");
    disp(" ");
    
    %ploynomial for newton forward interpolation

    s = (alpha - x(1)) / h;
    p_forward = fi(1);
    k = 1;
    
    for i = 1 : n-1
    
        k = k * (s-(i-1));
        
        disp("k: "+k);
        disp("delta: "+delta(i+1,i+1));
        disp("fact: "+factorial(i));
        disp("___________________________");
    
    
        p_forward = p_forward + (k / factorial(i) * delta(i+1,i+1));

    end


    disp("Newton Forward polynomial Answer: " + p_forward);
    disp(" ");
    disp("/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\");
    disp(" ");

else(x(mid_x) < alpha);
    
    disp("Chosen Method: Backward Newton Interpolation");
    disp(" ");
    
    
    %ploynomial for newton backward interpolation

    s = (alpha - x(n)) / h;
    p_backward = fi(n);
    k = 1;

    for i = 1 : n-1
    
        k = k * (s+(i-1));
        disp("k: "+k);
        disp("delta: "+delta(n,i+1));
        disp("fact: "+factorial(i));
        disp("___________________________");
    
    
        p_backward = p_backward + (k / factorial(i) * delta(n,i+1));

    end

    disp("Newton backward polynomial Answer: " + p_backward);

end
    disp(" ");
    disp("Press Enter");
    input('');
    clc;

end