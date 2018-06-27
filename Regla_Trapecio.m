clear; clc;
fprintf('\t\t\t\t\t Integraci�n num�rica. Regla compuesta del trapecio \n\n')
%Se crea variable simb�lica para poder ingresar la funci�n:
syms x
f=input('Ingrese la funci�n, f(x) = ');
LInf=input('Ingrese el l�mite inferior, LInf = ');
LSup=input('Ingrese el l�mite superior, LSup = ');
n=input('Ingrese el n�mero de intervalor, n = ');
%Se genera h:
h=(LSup-LInf)/n;
%Se genera los Xi;
for i=1:n+1
    X(i)=LInf+(i-1)*h; %#ok<*SAGROW>
end
%Se eval�a cada Xi en la funci�n:
%'inline' permite evaluar la funci�n en determinados valores de entrada:
f=inline(f);
for i=1:n+1
    Y(i)=f(X(i));
end
%Se calcula la sumatoria de la f�rmula:
Sumatoria=0;
for i=2:n
    Sumatoria=Sumatoria+Y(i);
end
%Se calcula la aproximaci�n de la integral por la f�rmula del trapecio:
Trapecio=h/2*(f(LInf)+2*Sumatoria+f(LSup));
%Generando la tabla:
fprintf('\n\t\t j \t\t Xj \t\t f(Xj)\n');
for i=1:n+1
    fprintf('\t\t %.0f \t\t %3.3f \t\t %3.11f \n',(i-1),X(i),Y(i));
end
fprintf('\nEl valor aproximado de la integral con la regla compuesta del trapecio es: %3.11f\n', Trapecio);