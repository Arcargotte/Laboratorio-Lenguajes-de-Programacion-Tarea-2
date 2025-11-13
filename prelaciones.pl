% +========================================+
% |        CASOS DE PRUEBA ASIGNADOS       |
% +========================================+
% Hechos asignados según lo indicado en tarea 2

% prela(Materia, Prelacion)
prela(ci2691, ci3661). % ci2691 prela a ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825). % ci3725 prela a ci3825
prela(ma1111, ci2525).

% +========================================+
% |       CASOS DE PRUEBA PROPUESTOS       |
% +========================================+

% Hechos propuestos para determinar la transitividad de las prelaciones y la salida de ciclos en prelaciones simultáneas
% prela(ci2525, ci2526).
% prela(ci2526, ci2527).
% prela(ci2527, ci2528).
% prela(ci2527, ci2526).
% prela(a, c).
% prela(c,a).
% prela(c,d).
% prela(d,b).


% +========================================+
% |                  DFS                   |
% +========================================+

% Implementación de funciones auxiliares para definir función DFS. Se tratan de las mismas definiciones vistas en clase.

% Implementa la función DFS llamando a camino_visit
camino_dfs(A, B) :-
    camino_visit(A, B, [A]).

% Implementación del caso base de la función recursiva camino_visit. Verifica si A prela a B para concluir si existe prelación directa o indirecta transitivamente.
camino_visit(A, B, _) :-
    prela(A, B).

% Implementación recursiva de camino_visit. Verifica si A prela algún curso C que no esté en el arreglo de Visitados y lo visita.
camino_visit(A, B, Visitados) :-
    prela(A,C),
    not(member(C, Visitados)),
    camino_visit(C, B, [C | Visitados]).

% +========================================+
% |         prelación_directa              |
% +========================================+
% Implementación del predicado solicitado en la tarea. Determina si el curso A prela a B
prelacion_directa(A, B):-
    prela(A,B).

% +========================================+
% |       prelación_indirecta              |
% +========================================+
% Implementación del predicado solicitado en la tarea. Determina si existe prelación transitiva de un curso A a un curso B. Si no es directa, busca algún curso C que prele A y verifica si 
% se llega a una relación de prelación directa de algún curso C al curso B a través de un recorrido DFS.
prelacion_total(A, B):-
    (prelacion_directa(A,B); (prelacion_directa(A,C), camino_dfs(C,B))).