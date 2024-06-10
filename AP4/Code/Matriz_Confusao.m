function [C, acuracia, precisao, recall, alarme_falso, omissao] =   Matriz_Confusao(prev ,info)

  PV = dot((info >= 0), (prev >= 0));  % Positivo Verdadeiro
  NF = dot((info >= 0), (prev < 0));   % Falso Negativo
  PF = dot((info < 0), (prev >= 0));   % Falso Positivo
  NV = dot((info < 0), (prev < 0));    % Negativo Verdadeiro

  C = [PV, NF; PF, NV];

  acuracia = (PV + NV) / (PV + NF + PF + NV);
  precisao =        PV / (PV + PF);
  recall =          PV / (PV + NF);
  alarme_falso =    PF / (PF + NV);
  omissao =         NF / (NF + PV);
end