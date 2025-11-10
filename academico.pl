% dicta(Profesor, Materia)
dicta(leonardo, ci3661).
dicta(maria, ci3725).
dicta(pedro, ci2691).

% cursa(Estudiante, Materia)

cursa(ana, ci3661).
cursa(ana, ci3725).
cursa(juan, ci3661).
cursa(elena, ci2691).
cursa(elena, ci3725).

% nota(Estudiante, Materia, Nota)

nota(ana, ci3661, 88).
nota(ana, ci3725, 70).
nota(juan, ci3661, 40). % juan clavó :c
nota(elena, ci2691, 51).

% elena no tiene nota en ci3725 (la esta cursando)

profesor_de(Prof, Est):-
    (dicta(Prof, X), cursa(Est, X)).

aprobado(Est, Mat):-
    (cursa(Est, Mat),nota(Est, Mat, X), X >= 50).

aplazado(Est):-
    (cursa(Est,  Y), nota(Est, Y, X), X < 50).

cursando_sin_nota(Est, Mat):-
    (cursa(Est, Mat), not(nota(Est, Mat, _))).
