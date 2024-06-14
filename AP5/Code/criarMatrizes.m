A = [1, 2, 2; 
    -1, 1, 2; 
    -1, 0, 1; 
     1, 1, 2];

B = [16,   2,   3,  13; 
      5,  11,  10,   8; 
      9,   7,   6,  12; 
      4,  14,  15,   1];

C = [2, 1, 2, 4; 
     3, 1, 2, 2];

%D = [1, 1, 1; 0, 2, 2; 0, 0,3];

[QCa, RCa] = qr_GS(A)
[QMa, RMa] = qr_GSM(A)
[UHa, RHa] = qr_House(A)
[UHMa, RHMa] = qr_House_min(A)

[QCb, RCb] = qr_GS(B)
[QMb, RMb] = qr_GSM(B)
[UHb, RHb] = qr_House(B)
[UMHb, RMHb] = qr_House_min(B)

[QCc, RCc] = qr_GS(C)
[QMc, RMc] = qr_GSM(C)
[UHc, RHc] = qr_House(C)
[UMHc, RMHc] = qr_House_min(C)

QMHa = constroi_Q(UHMa)
QMHb = constroi_Q(UHMb)
QMHc = constroi_Q(UHMc)

%[QCd, RCd] = qr_GS(D);
%[QMd, RMd] = qr_GSM(D);
%[UHd, RHd] = qr_House(D);
%[UMd, RMd] = qr_House_min(D);
