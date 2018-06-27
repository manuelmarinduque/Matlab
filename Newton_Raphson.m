clear; clc;
fprintf('\t\t\t\t\t Método de Newton Raphson \n\n')
%Se crea variable simbólica para poder ingresar la función:
syms x;
f=input('Ingrese la función, f(x) = ');
pi=input('Ingrese el punto inicial, x0 = ');
error=input('Ingrese el error, error = ');
%Graficar función f(x). Aquí porque luego 'inline' no lo permite.
fplot(f)
%Activar cuadrícula en la gráfica.
grid on
%Superponer varias gráficas en una sola, permite graficar la raíz de la función.
hold on
zoom on
%'diff' comando para derivar una función
d=diff(f);
%'inline' permite evaluar la función en determinados valores de entrada, esto 
%   hace posible evaluar f y f' en x0 en la línea 17.
d=inline(d);
f=inline(f);      
%Generando la tabla:
fprintf('\n\t\t\t Raiz \t\t\t NO. iteraciones \t\t Error\n');
ErrorAbs=100;
while ErrorAbs>error
    %Ecuación de Newton-Raphson:
    xi=pi-(f(pi)/d(pi));
    %El error está en porcentaje.
    ErrorAbs=abs(((xi-pi)/xi)*100);
    pi=xi;
    j=j+1;
    fprintf('\t\t %8.11f \t\t\t\t %d \t\t\t\t %8.6f\n', pi,j,ErrorAbs);
end
plot(pi,0,'o')
%Grafica la raíz de la función.
title('Gráfica de f(x) y su raíz hallada por el método de Newton Raphson')