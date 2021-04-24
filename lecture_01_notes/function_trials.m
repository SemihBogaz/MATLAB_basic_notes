function function_trials()
  % first function must have the same name as filename
    no_arg();
    one_arg(2);
    disp(two_arg(1,2));
    
    arr = [12.7, 45.4, 98.9, 26.6, 53.1];
    [mean,std] = stats(arr);
    disp(mean);
    disp(std);
    
    disp(loc_func_ex());
    disp(addme(13))
    
    narginout_ex(1,2,3);
    [a,b] = narginout_ex(1,2,3);
    
    [b,vo1,vo2] = vararg_ex(2,'varargin','varargout','example','!');
    [d,g,p] = variableNumInputAndOutput(6,'Nexus')
    
     A = rand(100);
     tic;delay_1 = delayed_copy_ex1(A); toc;
     tic;delay_2 = delayed_copy_ex2(A); toc;
     tic;delay_3 = delayed_copy_ex3(A); toc;
end

function no_arg()
    disp(1);
end

function one_arg(x)
    disp(x);
end

function avg = two_arg(x,y)
    avg = (x+y)/2;
end

function [mean_,std] = stats(x)
    l = length(x);
    mean_ = sum(x)/l;    
    std = sqrt(sum((x-mean_).^2/l));
end

function main_out = loc_func_ex()
    % written to see output formatting
    main_out =['can call the ',local_func()];
end

function loc_out = local_func()
    loc_out ='local function';
end

function c = addme(a,b)
    switch nargin
        case 2
            c = a+b;
        case 1
            c = a+a;
        otherwise
            c=0;
    end
end

function [o1,o2,o3] = narginout_ex(i1,i2,i3)
fprintf('Number inputs = %i;\t',nargin);
fprintf('Number outputs = %i;\n',nargout);
o1 = i1; o2=i2; o3=i3;
end

function [b,varargout] = vararg_ex(a,varargin)
    b = a^2;
    disp(['Class of varargin = ' class(varargin)])
    varargout = cell(length(varargin)-a,1);
    [varargout{:}] = varargin{1:end-a};
end

function varargout = variableNumInputAndOutput(varargin)
    disp(['Number of provided inputs: ' num2str(length(varargin))])
    disp(['Number of requested outputs: ' num2str(nargout)])
    
    for k = 1:nargout
        varargout{k} = k^2;
    end
end

function b = delayed_copy_ex1(A)
    b = 10*A(1,1);
end

function b = delayed_copy_ex2(A)
    A(1,1) = 5;
    b = 10*A(1,1);
end

function b = delayed_copy_ex3(A)
    b = 10*A(1,1); 
    disp(A); 
    A(1,1) = 5; 
    disp(A);
end