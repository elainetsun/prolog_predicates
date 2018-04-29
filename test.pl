% Elaine Tsun

% squint - square only integers in a list
squint([],[]).
squint([X|Xs],[Y|Ys]) :- integer(X), ! , Y is X*X, squint(Xs, Ys).
squint([X|Xs],[X|Ys]) :- squint(Xs, Ys).

% compress - collapses sequences of consecitive idential ground terms
compress([],[]).
compress([X],[X]).
compress([X,X|T],NL):-
  % if the head is the same as the next element
  compress([X|T],NL),!.
compress([X,Y|T],[X|NT]):-
  % if the head is different than the next element
  compress([Y|T],NT).

% my_flatten - flattens into a one-level list
my_flatten(X,[X]) :- \+ is_list(X). % check if input is a list
my_flatten([],[]).
my_flatten([X|Xs],Zs) :-
  % recursively flatten the list
  my_flatten(X,Y),
  my_flatten(Xs,Ys),
  append(Y,Ys,Zs).

% pack - produces a list containing the consecutive reps of a ground term
pack([], []).
pack([X], [[X]]).
pack([X, Y|Ys], [[X]|Z]) :-
    X \= Y, pack([Y|Ys], Z).
pack([X, X|Xs], [[X|XX]|Y]):-
   pack([X|Xs], [XX|Y]).
