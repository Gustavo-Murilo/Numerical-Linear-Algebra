function [x, select] = Diminuir_dim(A, x, b, e)
  total = sum(abs(x));

  select = (abs(x)/total > e);

  A = A(:, select);

  x = Gaussian_Elimination_4((A' * A), (A' * b));

end

