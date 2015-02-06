
%%
NG=1; NP=2; Z=3; PP=4; PG=5;
if thF == NG && wF == NG
    F = NG;
elseif thF == NP && wF == NG
    F = NP;
elseif thF == Z && wF == NG
    F = NP;
elseif thF == PP && wF == NG
    F = NP;
elseif thF == PG && wF == NG
    F = NP;
elseif thF == NG && wF == NP
    F = NP;
elseif thF == NP && wF == NP
    F = Z;
elseif thF == Z && wF == NP
    F = PP;
elseif thF == PP && wF == NP
    F = NP;
elseif thF == PG && wF == NP
    F = Z;
elseif thF == NG && wF == Z
    F = NP;
elseif thF == NP && wF == Z
    F = PP;
elseif thF == Z && wF == Z
    F = Z;
elseif thF == PP && wF == Z
    F = PG;
elseif thF == PG && wF == Z
    F = PP;
elseif thF == NG && wF == PP
    F = Z;
elseif thF == NP && wF == PP
    F = PP;
elseif thF == Z && wF == PP
    F = PP;
elseif thF == PP && wF == PP
    F = Z;
elseif thF == PG && wF == PP
    F = PP;
elseif thF == NG && wF == PG
    F = PP;
elseif thF == NP && wF == PG
    F = PP;
elseif thF == Z && wF == PG
    F = PP;
elseif thF == PP && wF == PG
    F = PP;
elseif thF == PG && wF == PG
    F = PG;
else
    disp('Error de entrada'); 
end