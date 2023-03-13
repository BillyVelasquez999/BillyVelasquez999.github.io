function [x, y] = metodo_grafico(f, g, xmin, xmax, ymin, ymax, delta)
  % f y g son las dos funciones a graficar
  % xmin, xmax, ymin, ymax son los límites de la ventana de visualización
  % delta es el tamaño del paso en la discretización de las funciones

  % Graficar las funciones
  x = xmin:delta:xmax;
  yf = f(x);
  yg = g(x);
  plot(x, yf, x, yg);
  grid on;

  % Encontrar la intersección de las funciones
  [xf, yf] = interseccion(x, yf, yg);
  x = xf;
  y = yf;
end

function [x, y] = interseccion(x, y1, y2)
  % Encuentra las intersecciones de dos funciones

f = @(x) x.^2 - 4;
g = @(x) 2*x + 1;
[x, y] = metodo_grafico(f, g, -5, 5, -10, 10, 0.1);
disp(['La intersección es (', num2str(x), ', ', num2str(y), ')']);

  x1 = x(1:end-1);
  x2 = x(2:end);
  y11 = y1(1:end-1);
  y12 = y1(2:end);
  y21 = y2(1:end-1);
  y22 = y2(2:end);

  idx = find((y11-y21).*(y12-y22) < 0);
  x = (x2(idx).*(y11(idx)-y21(idx)) - x1(idx).*(y12(idx)-y22(idx))) ./ (y11(idx)-y21(idx)-y12(idx)+y22(idx));
  y = y11(idx) + (y12(idx)-y11(idx)) .* (x-x1(idx)) ./ (x2(idx)-x1(idx));
end

