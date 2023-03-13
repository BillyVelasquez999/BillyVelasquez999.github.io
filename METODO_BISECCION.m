function [x, fx, n] = metodo_biseccion(f, a, b, tol, maxiter)
  % f es la función para la cual se busca la raíz
  % a y b son los límites del intervalo inicial
  % tol es la tolerancia para la solución
  % maxiter es el número máximo de iteraciones

  fa = f(a);
  fb = f(b);
  n = 0;
f = @(x) x^2 - 2;
[a, b] = [1, 2];
tol = 1e-6;
maxiter = 100;
[x, fx, n] = metodo_biseccion(f, a, b, tol, maxiter);
disp(['La raíz es x = ', num2str(x), ' con valor de la función f(x) = ',
 num2str(fx), ' en ', num2str(n), ' iteraciones']);

  if fa*fb > 0
    error('La función no cambia de signo en el intervalo dado');
  end

  while (b-a)/2 > tol && n < maxiter
    c = (a+b)/2;
    fc = f(c);
    if fc == 0
      a = c;
      b = c;
    elseif fa*fc < 0
      b = c;
      fb = fc;
    else
      a = c;
      fa = fc;
    end
    n = n+1;
  end

  x = (a+b)/2;
  fx = f(x);

  if n == maxiter
    warning('Se alcanzó el número máximo de iteraciones');
  end
end
