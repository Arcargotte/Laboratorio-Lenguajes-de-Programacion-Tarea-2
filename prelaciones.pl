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

camino_dfs(A, B) :-
    camino_visit(A, B, [A]).
camino_visit(A, B, _) :-
    prela(A, B).

camino_visit(A, B, Visitados) :-
    prela(A,C),
    not(member(C, Visitados)),
    camino_visit(C, B, [C | Visitados]).

prelacion_directa(A,B):-
    prela(A,B).

prelacion_total(A,B):-
    (prelacion_directa(A,B); (prelacion_directa(A,C), camino_dfs(C,B))).