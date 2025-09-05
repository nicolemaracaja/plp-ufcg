main :-
    read(Lista),
    analisar(Lista, 0, 0, 0, Subiu, Estavel, Caiu),
    format('Subiu: ~w | Estavel: ~w | Caiu: ~w~n', [Subiu, Estavel, Caiu]),
    halt.
    
analisar([], S, E, C, S, E, C).
analisar([_], S, E, C, S, E, C).

analisar([X,Y|Resto], S0, E0, C0, S, E, C) :-
    (   Y > X -> S1 is S0 + 1, E1 is E0, C1 is C0
    ;   Y < X -> S1 is S0, E1 is E0, C1 is C0 + 1
    ;   Y =:= X -> S1 is S0, E1 is E0 + 1, C1 is C0
    ),
    analisar([Y|Resto], S1, E1, C1, S, E, C).
