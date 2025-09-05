main :-
    write(''), nl,
    read(Versoes),
    verificar_historico(Versoes),
    halt.
    
verificar_historico([_]) :-
    write('Historico completo'), nl.
    
verificar_historico(Versoes) :-
    encontrar_faltantes(Versoes, Faltantes),
    (Faltantes = [] ->
        write('Historico completo'), nl
    ;
        write(Faltantes), nl
    ).
    
encontrar_faltantes([_], []).
encontrar_faltantes([X,Y|Resto], Faltantes) :-
    X1 is X + 1,
    (X1 =:= Y ->
        encontrar_faltantes([Y|Resto], Faltantes)
    ;
        criar_intervalo(X1, Y, Intervalo),
        encontrar_faltantes([Y|Resto], FResto),
        append(Intervalo, FResto, Faltantes)
    ).

criar_intervalo(A, B, []) :- A >= B.
criar_intervalo(A, B, [A|Resto]) :-
    A < B,
    A1 is A + 1,
    criar_intervalo(A1, B, Resto).
