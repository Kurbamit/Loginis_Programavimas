
/* Dominykas Černovas 3 kursas, 3 grupė

1.Vandens perpylimo uždavinys.
Duotos trijų indų talpos, kurios visos yra skirtingos. 
Pirmasis indas pilnas vandens, kiti du tušti. 
Iš vieno indo į kitą galima perpilti lygiai tiek vandens, 
kiek telpa kitame inde arba lygiai tiek, kiek yra pirmajame (žiūrint, kuris dydis mažesnis). 
Pavyzdžiui, iš pilno 5 litrų indo į tuščią 3 litrų indą galima perpilti 3 litrus. 
Lygiai taip pat 3 litrus galima perpilti iš pilno 3 litrų indo į tuščią 5 litrų indą. 
Uždavinio rezultatas - vykdomų perpylimų seka. 
Nustatykite, kaip galima, perpilant vandenį iš vienų indų į kitus, 
gauti pirmajame inde tam tikrą vandens kiekį:
*/

/*
Testai:
start(8, 5, 3, 4). - visa eiga. true.
start(13, 2, 2, 5). - false
*/

/* Start pouring
C - capacity, 
R - wanted result
*/
start(C1, C2, C3, R) :-
    solve((C1, 0, 0), [], (C1, C2, C3), (R, _, _), Route),
    log([((C1, 0, 0), 'Start:')|Route]).

/* Solve mechanism */
solve(Goal, _, _, Goal, [(Goal, 'Solved')]).

solve(State, Visited, Capacities, Goal, [(NextState, Action)|Route]) :-
    pour(State, NextState, Capacities, Action),
    \+ member(NextState, Visited),
    solve(NextState, [NextState|Visited], Capacities, Goal, Route).


/* pouring */
pour((X, Y, Z), (X1, Y1, Z1), (C1, C2, C3), Action) :-
    pour_from_first_to_second(X, Y, Z, X1, Y1, Z1, C2, Action) ;
    pour_from_second_to_third(X, Y, Z, X1, Y1, Z1, C3, Action) ;
    pour_from_third_to_first(X, Y, Z, X1, Y1, Z1, C1, Action);

    pour_from_first_to_third(X, Y, Z, X1, Y1, Z1, C3, Action) ;
    pour_from_second_to_first(X, Y, Z, X1, Y1, Z1, C1, Action) ;
    pour_from_third_to_second(X, Y, Z, X1, Y1, Z1, C2, Action).

/* single pours */
pour_from_first_to_second(X, Y, Z, X1, Y1, Z, C2, "1 -> 2") :-
    X > 0,
    Y < C2,
    Pouring is min(X, C2 - Y),
    X1 is X - Pouring,
    Y1 is Y + Pouring.

pour_from_first_to_third(X, Y, Z, X1, Y, Z1, C3, "1 -> 3") :-
    X > 0,
    Z < C3,
    Pouring is min(X, C3 - Z),
    X1 is X - Pouring,
    Z1 is Z + Pouring.

pour_from_second_to_third(X, Y, Z, X, Y1, Z1, C3, "2 -> 3") :-
    Y > 0,
    Z < C3,
    Pouring is min(Y, C3 - Z),
    Y1 is Y - Pouring,
    Z1 is Z + Pouring.

pour_from_second_to_first(X, Y, Z, X1, Y1, Z, C1, "2 -> 1") :-
    Y > 0,
    X < C1,
    Pouring is min(Y, C1 - X),
    Y1 is Y - Pouring,
    X1 is X + Pouring.

pour_from_third_to_first(X, Y, Z, X1, Y, Z1, C1, "3 -> 1") :-
    Z > 0,
    X < C1,
    Pouring is min(Z, C1 - X),
    Z1 is Z - Pouring,
    X1 is X + Pouring.

pour_from_third_to_second(X, Y, Z, X, Y1, Z1, C2, "3 -> 2") :-
    Z > 0,
    Y < C2,
    Pouring is min(Z, C2 - Y),
    Y1 is Y + Pouring,
    Z1 is Z - Pouring.


/* log */
log([]).
log([(State, Action)|T]) :-
    write(Action), write('   '), write(State), nl,
    log(T).
