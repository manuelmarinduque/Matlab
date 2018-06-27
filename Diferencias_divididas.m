clear; clc;
fprintf('\t\t\t\t\t Diferencias divididas. Interpolante de newton \n\n')
n=input('Ingrese el grado del polinomio, n = ');
fprintf('Se necesita de %.0f nodos\n\n',n+1);
%Se ingresan los nodos:
disp('Ingrese los nodos, puntos y sus im�genes');
for i=1:n+1
    fprintf('x%.0f = ',i-1);
    X(i)=input(' '); %#ok<*SAGROW>
    fprintf('y%.0f = ',i-1);
    Y(i)=input(' ');
end
%Se crea la tabla de diferencias divididas:
fprintf('\n')
%Se crea una matriz n+1*n+1 rellenada con ceros para que estos
%   aparezcan en los espacios que no se llenan:
DD=zeros(n+1);
%La primer columna de la tabla son los valores del vector Y(Xk).
% : = posici�n vac�a. Ingresar vector a una matriz.
DD(:,1)=Y;  
%La tabla se empieza a llenar desde la segunda columna.
for k=2:n+1
    for j=k:n+1
        DD(j,k)=(DD(j,k-1)-DD(j-1,k-1))/(X(j)-X(j-k+1));
    end
end
fprintf('\t\t Tabla de diferencias divididas \n');
disp(DD);
%Se genera el polinomio, polnew:
fprintf('El polinomio de newton es \n');
%Se crea variable simb�lica para poder generar el polinomio:
syms x;
polnew=DD(1,1);
P=1;
for i=1:n
    P=P*(x-X(i));
    polnew=polnew+P*DD(i+1,i+1);
end
%'expand' realiza las multiplicaciones del polinomio:
polnew=expand(polnew);
%'pretty' para mostrar de una forma c�moda el polinimio, sin () ni ^:
%disp(polnew);
pretty(polnew);
%Se ingresa valor a interpolar, luego se eval�a en el polinomio y se imprime:
x=input('Ingrese el valor de x a interpolar, x = ');
vi=eval(polnew);
fprintf('\nEl valor interpolado es %.11f\n',vi);
%Superponer gr�ficas permitiendo graficar Pn(x) y puntos:
zoom on;
hold on;
%Activar cuadr�cula:
grid on;
%Gr�fica del polinomio:
fplot(polnew,[X(1) X(n+1)]);
title('Gr�fica de Pn(x)')
%Gr�fica del punto interpolado:
plot(x,vi,'+');
%Gr�fica de los puntos:
for i=1:n+1
    plot(X(i),Y(i),'o')
end