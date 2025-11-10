% prela(Materia, Prelacion)
prela(ci2691, ci3661). % ci2691 prela a ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825). % ci3725 prela a ci3825
prela(ma1111, ci2525).
% prela(ci2525, ci2526).
% prela(ci2526, ci2527).
% prela(ci2527, ci2528).
% prela(ci2527, ci2526).
prela(a, c).
prela(c,a).
prela(c,d).
prela(d,b).

prelacion_directa(A,B):-
    prela(A,B).

prelacion_total(A,B):-
    (prelacion_directa(A,B); (prelacion_directa(A,C), prelacion_total(C,B))).