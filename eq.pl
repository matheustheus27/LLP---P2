contar(_, [], 0).
contar(X, [X|L], C):- !, contar(X, L, A) , C is A + 1.
contar(X, [_|L], C):- contar(X, L, C).

remover(_, [], []).
remover(X, [Y|Z], W):- \+ Y \= X, remover(X, Z, W).
remover(X, [Y|Z], [Y|W]):-Y \= X, remover(X, Z, W).

verifica_qtd([],[]).
verifica_qtd([X|L], [Y|N]):- contar(X, [X|L], Y), remover(X, L, R), verifica_qtd(R, N).

verifica_res([X,Y]):- X==Y, !.
verifica_res([X,L|Y]) :- X==L, verifica_res([L|Y]).

eq([]).
eq(L):- verifica_qtd(L, Q), verifica_res(Q).
