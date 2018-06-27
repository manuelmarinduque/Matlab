clear; clc;
fprintf('\t\t\t\t\t Integración numérica. Regla compuesta del trapecio \n\n')
%Se crea variable simbólica para poder ingresar la función:
syms x
f=input('Ingrese la función, f(x) = ');
LInf=input('Ingrese el límite inferior, LInf = ');
LSup=input('Ingrese el límite superior, LSup = ');
n=input('Ingrese el número de intervalor, n = ');
%Se genera h:
h=(LSup-LInf)/n;
%Se genera los Xi;
for i=1:n+1
    X(i)=LInf+(i-1)*h; %#ok<*SAGROW>
end
%Se evalúa cada Xi en la función:
%'inline' permite evaluar la función en determinados valores de entrada:
f=inline(f);
for i=1:n+1
    Y(i)=f(X(i));
end
%Se calcula la sumatoria de la fórmula:
Sumatoria=0;
for i=2:n
    Sumatoria=Sumatoria+Y(i);
end
%Se calcula la aproximación de la integral por la fórmula del trapecio:
Trapecio=h/2*(f(LInf)+2*Sumatoria+f(LSup));
%Generando la tabla:
fprintf('\n\t\t j \t\t Xj \t\t f(Xj)\n');
for i=1:n+1
    fprintf('\t\t %.0f \t\t %3.3f \t\t %3.11f \n',(i-1),X(i),Y(i));
end
fprintf('\nEl valor aproximado de la integral con la regla compuesta del trapecio es: %3.11f\n', Trapecio);