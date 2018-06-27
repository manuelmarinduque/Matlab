clear; clc;
fprintf('\t\t\t\t\t Método iterativo de Jacobi \n\n')
n=input('Ingrese el número de ecuaciones del sistema, n = ');
A=input('Ingrese la matriz de coeficientes A, separadas por ;, A = ');
b=input('Ingrese el vector columna b, b = ');
maxIte=input('Ingrese el número maximo de iteraciones, maxIte = ');
%El error permitido depende de la norma:
error=input('Ingrese el error, error = ');
%Se crea vector solución inicial X0 con valores en 0, de tamaño 1xn:
fprintf('\n')
X0=zeros(1,n);
X=X0;
%Se lleva un contador K para las iteraciones, ya que la matriz A no podría
%converger y para que esta converja implica validar que bien sea
%estrictamente dominante o que el radio espectral de Tj < 1.
K=0;
Norma=1;
noSol=0;
while Norma>error
    K=K+1;
    fprintf('\t\t %d', K);
    %El valor de i corresponde a cada ecuación del sistema
    for i=1:n
        %Este for anidado calcula la sumatoria de la ecuación de Jacobi:
        %Suma se reinicia a cero en cada iteración:
        suma=0;
        for j=1:n
            % ~= 'no igual a, diferente de'
            if i~=j
                suma=suma+A(i,j)*X0(j); %JACOBI, línea 12 y 45.
                %Si en vez fuese X en vez de X0 se transforma el algoritmo
                %al método iterativo de Gauss-Seidel, esto es debido a que
                %los valores de X cambian en cada iteración mientras que
                %los de X0 permanecen estáticos.
            end
        end
        %Se expresa la ecuación del método de Jacobi:
        X(i)=(b(i)-suma)/A(i,i);
        %Se imprime el vector X(i):
        fprintf('%10.8f',X(i));
    end
    %Función 'norm(X,inf)' para calcular la norma infinito de un vector:
    Norma=norm(X0-X, inf)/norm(X, inf);
    fprintf('%10.8f\n', Norma);
    %En X0 se almacenan los valores obtenidos en la iteración para ser
    %usados en los cálculos de la nueva iteración que sigue, línea 30.
    X0=X; %JACOBI
    %Condición por si el sistema nunca converge.
    if K>=maxIte
        noSol=noSol+1;
        fprintf('\nEl sistema no tiene solución');
        break
    end
end
%Imprimiendo los resultados finales:
fprintf('\n');
if (noSol==0)
    for i=1:n
    fprintf ('El valor de X(%1.0d) es = %10.8f \n', i, X(i));
    end
end
