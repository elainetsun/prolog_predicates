% Elaine Tsun

% squint - square only integers in a list
squint([],[]).
squint([X|Xs],[Y|Ys]) :- integer(X), ! , Y is X*X, squint(Xs, Ys).
squint([X|Xs],[X|Ys]) :- squint(Xs, Ys).

% compress - collapses sequences of consecitive idential ground terms
compress([],[]).
compress([X],[X]).
compress([X,X|T],NL):-compress([X|T],NL),!.
compress([X,Y|T],[X|NT]):-compress([Y|T],NT).

% my_flatten - flattens into a one-level list
my_flatten(X,[X]) :- \+ is_list(X).
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).
