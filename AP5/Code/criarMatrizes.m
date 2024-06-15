A = [1, 2, 2; 
    -1, 1, 2; 
    -1, 0, 1; 
     1, 1, 2]

B = [16,   2,   3,  13; 
      5,  11,  10,   8; 
      9,   7,   6,  12; 
      4,  14,  15,   1]

C = [2, 1, 2, 4; 
     3, 1, 2, 2]


[QCa, RCa] = qr_GS(A)
[QMa, RMa] = qr_GSM(A)
[UHa, RHa] = qr_House(A)
[UKa, RKa] = qr_House_min(A)

[QCb, RCb] = qr_GS(B)
[QMb, RMb] = qr_GSM(B)
[UHb, RHb] = qr_House(B)
[UKb, RKb] = qr_House_min(B)

[QCc, RCc] = qr_GS(C)
[QMc, RMc] = qr_GSM(C)
% [UHc, RHc] = qr_House(C) % Erro devido as dimensoes
[UKc, RKc] = qr_House_min(C)

QHa = constroi_Q(UHa)
QHb = constroi_Q(UHb)
% QHc = constroi_Q(UHc)

QKa = constroi_Q(UKa)
QKb = constroi_Q(UKb)
QKc = constroi_Q(UKc)
