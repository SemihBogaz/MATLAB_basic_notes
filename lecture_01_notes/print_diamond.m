function print_diamond()
   for i=1:2:9
    for l=9:-2:i
        fprintf(' ')
    end
    
    for j=1:i
        fprintf('*')
    end
        fprintf('\n') 
   end
   for i=9:-2:1
    for l=i:2:9
        fprintf(' ') 
    end
    
    for j=i:-1:1
        fprintf('*') 
    end
        fprintf('\n')
   end
end