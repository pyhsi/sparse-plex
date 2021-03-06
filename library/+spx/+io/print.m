classdef print

properties
end

methods (Static)

    function [ ] = sparse_signal( x )
    %sparse_signal Prints a sparse vector as pairs of indices and values
    N = length(x);
    K = 1;
    for i=1:N
        if x(i)
            fprintf('(%d,%0.4f) ',i, x(i));
            if mod(K, 5) == 0
                % We introduce a new line after every few values
                fprintf('\n');
            end
            K = K+1;
        end
    end
    fprintf('  N=%d, K=%d\n', N, K-1);
    end

    function [ ] = sorted_sparse_signal( x )
        %PRINTSORTEDSPARSEVECTOR Sorts non-zero values in x and prints them.
        % We identify non-zero values of x. We sort them. We print them in 
        % the descending magnitude order along with their indices
        values = spx.commons.sparse.sorted_non_zero_elements(x);
        fprintf('Index:\tValue\n');
        fprintf('%4d:\t%f\n', values);
    end


    function vector(x, precision)
        % prints a vector
        if nargin < 2
            precision = 2;
        end
        n = numel(x);
        format = sprintf('%%.%df ', precision);
        for i=1:n
            fprintf(format, x(i));
            if mod(i, 20) == 0
                fprintf('\n');
            end
        end
        if mod(i, 40) ~= 0
            fprintf('\n');
        end
    end
    
end
end
