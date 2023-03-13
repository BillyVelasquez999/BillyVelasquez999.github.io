function raiz = newton_raphson(f, df, p0, tolerancia, iter_max)
% Función para implementar el método de Newton-Raphson
% Input:
% f: función a la que se busca la raíz
% df: derivada de la función f
% p0: valor inicial
% tolerancia: tolerancia para el criterio de parada
% iter_max: número máximo de iteraciones permitidas
% Output:
% raiz: aproximación de la solución

% Definimos las funciones f y df
funcion_f = inline(f);
funcion_df = inline(df);

% Definimos los valores iniciales
iter = 0;
error = tolerancia + 1;
p = p0;

% Iteramos mientras no se alcance la tolerancia o el número máximo de iteraciones
while error > tolerancia && iter < iter_max
    p_anterior = p;
    p = p_anterior - (funcion_f(p_anterior) / funcion_df(p_anterior));
    error = abs(p - p_anterior);
    iter = iter + 1;
end

% Mostramos mensaje de error si se excede el número máximo de iteraciones
if iter == iter_max && error > tolerancia
    fprintf('El método de Newton-Raphson no converge después de %d iteraciones \n', iter_max);
end

% Devolvemos la aproximación de la solución
raiz = p;
end

