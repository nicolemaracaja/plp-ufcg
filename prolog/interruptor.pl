main :- 
    loop(desligado).
    
loop(EstadoAtual) :-
    read(Comando),
    trata_comando(Comando, EstadoAtual).
    
trata_comando(liga, desligado) :-
    loop(ligado).
    
trata_comando(liga, ligado) :-
    loop(ligado).
    
trata_comando(desliga, ligado) :-
    loop(desligado).
    
trata_comando(desliga, desligado) :-
    loop(desligado).
    
trata_comando(fim, EstadoAtual) :-
    write('O interruptor esta '), write(EstadoAtual), nl,
    halt. 
    
trata_comando(_, EstadoAtual) :-
    loop(EstadoAtual).
