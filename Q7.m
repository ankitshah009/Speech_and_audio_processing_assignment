
clc;
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Asking for order and autocorrelation values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = input('Enter the order of the filter : ');
r0 = input('Enter the autocorrelation value r(0) only (eg - 1.0) : ');
r = input('Enter the auto-correlation values in a row matrix (eg - [-1.5650 1.0857 -0.7127 0.5722 -0.5007 0.5067 -0.4765 0.6040 -0.3675 0.0861] ) : ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Initialize other coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
km = - r(1)/r0;
E_prev = (1 - km^2)*r0;
a_prev(1) = km;
k(1) = km;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Calculate other coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m = 2:p-1
    rm_1(1:m-1) = r(1:m-1);
    rm_1b(1:m-1) = r(m-1:-1:1);
    km = -((r(m) + rm_1b*a_prev')/E_prev);
    a(m) = km;
    k(m) = km;
    for j = 1:m-1
        a(j) = a_prev(j) + km*a_prev(m-j);
    end
    E_prev = E_prev*(1 - km^2);
    a_prev = a;
   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Print the coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('AR coefficients are : ');disp(a);


% AR coefficients are : 
%    -0.2039   -0.3055    0.7289   -0.8515    0.6208   -0.1295   -0.3791    0.7295   -0.6551
