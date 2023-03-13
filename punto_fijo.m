function p = punto_fijo(g, p0, tolerancia, iter_max)
% Función para implementar el método de punto fijo
% Input:
% g: función a iterar
% p0: valor inicial
% tolerancia: tolerancia para el criterio de parada
% iter_max: número máximo de iteraciones permitidas
% Output:
% p: aproximación de la solución

% Definimos la función g
funcion_g = inline(g);

% Definimos los valores iniciales
iter = 0;
error = tolerancia + 1;
p = p0;

% Iteramos mientras no se alcance la tolerancia o el número máximo de iteraciones
while error > tolerancia && iter < iter_max
    p_anterior = p;
    p = funcion_g(p_anterior);
    error = abs(p - p_anterior);
    iter = iter + 1;
end

% Mostramos mensaje de error si se excede el número máximo de iteraciones
if iter == iter_max && error > tolerancia
    fprintf('El método de punto fijo no converge después de %d iteraciones \n', iter_max);
end
end

