function [x, iter] = secante(f, x0, x1, tol, maxiter)
  % f: función a evaluar
  % x0, x1: valores iniciales
  % tol: tolerancia de error
  % maxiter: máximo número de iteraciones permitido

  iter = 0;
  while iter < maxiter
    fx0 = f(x0);
    fx1 = f(x1);
    x = x1 - (fx1*(x1-x0))/(fx1-fx0); % calcula la siguiente aproximación
    if abs(x-x1) < tol % verifica la convergencia
      return
    end
    x0 = x1; % actualiza los valores iniciales
    x1 = x;
    iter = iter + 1; % incrementa el contador de iteraciones
  end
end

