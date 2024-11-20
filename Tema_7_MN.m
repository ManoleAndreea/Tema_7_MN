% Tema 7 MN
% Manole Andreea - Cristina 321 AA

%   Adaptati algoritmul Cholesky pentru o matrice A tridiagonala, simetrica
% si pozitiv definita. Ilustrati functionalitatea printr - un exemplu.
% Verificati corectitudinea rezultatului.

n=10;
sub_diag=randn(n-1, 1);
main_diag=abs(randn(n, 1))+10;

A = spdiags([[sub_diag; 0], main_diag, [0; sub_diag]], -1:1, n, n);

disp("Matricea originala A tridiagonala, simetrica si pozitiv definita este: ");
A=full(A)

%Pentru a verifica daca matricea este pozitiv definita voi folosi algoritmul 
% predefinit al factorizarii cholesky
try
    chol(A);
    disp('Matricea este pozitiv definită.');
catch
    disp('Matricea NU este pozitiv definită.');
end


L=zeros(n, n);
L(1, 1)=sqrt(A(1, 1));
L(2, 1)=A(2,1)/L(1, 1);
for k=2:n
    L(k,k)=sqrt(A(k,k)-L(k,k-1)^2);
    if k==n
        break;
    end
    L(k+1,k)=A(k+1,k)/L(k,k);
end
disp('Matricea obținută prin produsul L * L transpus: ');
disp(L*L');
norm(A-L*L')

if norm(A-L*L')<1e-10
    disp('Algoritmul este corect');
else
    disp('Algoritmul nu este corect');
end
