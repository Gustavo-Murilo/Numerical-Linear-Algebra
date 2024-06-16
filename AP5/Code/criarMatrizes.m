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
[UHa, RHa] = qr_House_1(A)
[UKa, RKa] = qr_House_2(A)

[QCb, RCb] = qr_GS(B)
[QMb, RMb] = qr_GSM(B)
[UHb, RHb] = qr_House_1(B)
[UKb, RKb] = qr_House_2(B)

[QCc, RCc] = qr_GS(C)
[QMc, RMc] = qr_GSM(C)
% [UHc, RHc] = qr_House_1(C) % Erro devido as dimensoes
[UKc, RKc] = qr_House_2(C)

QHa = constroi_Q(UHa, 1)
QHb = constroi_Q(UHb, 1)
% QHc = constroi_Q(UHc, 1)

QKa = constroi_Q(UKa, 2)
QKb = constroi_Q(UKb, 2)
QKc = constroi_Q(UKc, 2)
