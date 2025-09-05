virar_direita(norte, leste).
virar_direita(leste, sul).
virar_direita(sul, oeste).
virar_direita(oeste, norte).

avancar(norte, X, Y, X, Y1) :- Y1 is Y + 1.
avancar(sul, X, Y, X, Y1) :- Y1 is Y - 1.
avancar(leste, X, Y, X1, Y) :- X1 is X + 1.
avancar(oeste, X, Y, X1, Y) :- X1 is X - 1.

processa([], X, Y, _, X, Y).
processa([avancar|T], X, Y, Dir, XF, YF) :-
    avancar(Dir, X, Y, NX, NY),
    processa(T, NX, NY, Dir, XF, YF).
processa([virar|T], X, Y, Dir, XF, YF) :-
    virar_direita(Dir, NDir),
    processa(T, X, Y, NDir, XF, YF).
    
main :-
    read(N),
    le_comandos(N, Comandos),
    processa(Comandos, 0, 0, norte, XF, YF),
    write('('), write(XF), write(','), write(YF), write(')'), nl,
    halt.
    
le_comandos(0, []).
le_comandos(N, [C|T]) :-
    N > 0,
    read(C),
    N1 is N - 1,
    le_comandos(N1, T).
