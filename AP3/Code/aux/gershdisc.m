% gerschdisc.m
% 
% This function plots the Gershgorin Discs for the matrix A passed as an argument.
% It will also plot the centers of such discs, and the actual eigenvalues
% of the matrix.
function gershdisc(A)
error(nargchk(nargin,1,1));
if size(A,1) ~= size(A,2)
    error('Matrix should be square');
    return;
end

M = abs(A);

% For each row, we say:
n = size(A,1);
for i=1:n
    % The circle has center in (h,k) where h is the real part of A(i,i) and
    % k is the imaginary part of A(i,i)   :
    h=real(A(i,i)); k=imag(A(i,i)); 
    
   
    % Soma na linha
    s_lin = sum(M(i, 1:i-1)) + sum(M(i, i+1:n));
    % Soma na coluna
    %s_col = sum(M(1:i-1, i)) + sum(M(i+1:n, i));
    % Define o menor raio o possivel
    r = s_lin;
    

    % We try to make a vector of points for the circle:
    N=256;
    t=(0:N)*2*pi/N;
    
    % Now we're able to map each of the elements of this vector into a
    % circle:
    plot( r*cos(t)+h, r*sin(t)+k ,'-');
    % We also plot the center of the circle for better undesrtanding:
    hold on;
    plot( h, k,'+');
end
% For the circles to be better graphed, we would like to have equal axis:
axis equal;
% Now we plot the actual eigenvalues of the matrix:
ev=eig(A);
for i=1:size(ev)
    rev=plot(real(ev(i)),imag(ev(i)),'ro');
end
hold off;
legend(rev,'Actual Eigenvalues');
end
