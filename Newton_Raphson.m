clear; clc;
fprintf('\t\t\t\t\t M�todo de Newton Raphson \n\n')
%Se crea variable simb�lica para poder ingresar la funci�n:
syms x;
f=input('Ingrese la funci�n, f(x) = ');
pi=input('Ingrese el punto inicial, x0 = ');
error=input('Ingrese el error, error = ');
%Graficar funci�n f(x). Aqu� porque luego 'inline' no lo permite.
fplot(f)
%Activar cuadr�cula en la gr�fica.
grid on
%Superponer varias gr�ficas en una sola, permite graficar la ra�z de la funci�n.
hold on
zoom on
%'diff' comando para derivar una funci�n
d=diff(f);
%'inline' permite evaluar la funci�n en determinados valores de entrada, esto 
%   hace posible evaluar f y f' en x0 en la l�nea 17.
d=inline(d);
f=inline(f);      
%Generando la tabla:
fprintf('\n\t\t\t Raiz \t\t\t NO. iteraciones \t\t Error\n');
ErrorAbs=100;
while ErrorAbs>error
    %Ecuaci�n de Newton-Raphson:
    xi=pi-(f(pi)/d(pi));
    %El error est� en porcentaje.
    ErrorAbs=abs(((xi-pi)/xi)*100);
    pi=xi;
    j=j+1;
    fprintf('\t\t %8.11f \t\t\t\t %d \t\t\t\t %8.6f\n', pi,j,ErrorAbs);
end
plot(pi,0,'o')
%Grafica la ra�z de la funci�n.
title('Gr�fica de f(x) y su ra�z hallada por el m�todo de Newton Raphson')