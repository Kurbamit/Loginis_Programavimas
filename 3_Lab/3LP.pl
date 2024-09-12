suma(S1,S2,Sum):-
    listas_i_skaiciu(S1, R1), listas_i_skaiciu(S2, R2), skaicius_i_lista(R1+R2,Sum).

listas_i_skaiciu(Listas, Rezultatas) :- listas_i_skaiciu(Listas, 0, Rezultatas).

listas_i_skaiciu([H|T], Prefix, Rezultatas) :-
    Prefix1 is Prefix * 10 + H,
    listas_i_skaiciu(T, Prefix1, Rezultatas).

listas_i_skaiciu([], Rezultatas, Rezultatas).



skaicius_i_lista(Num, [Head | []]):- Num < 10, Head is Num, !.

skaicius_i_lista(Num,List):-
    DividedNum is Num // 10,
    skaicius_i_lista(DividedNum, Temp_List),
    LastDigit is (Num mod 10),
    prideti_prie_galo(Temp_List, [LastDigit], List).

prideti_prie_galo([], X, X).
%Pirmas kint - prad. sarasas, antras - pridedama sarasas, trecias - rezultatas.
prideti_prie_galo([H|T1], X, [H|T2]) :- prideti_prie_galo(T1, X, T2).

/*
UÞKLAUSØ PVZ.:
?- suma([8,2],[2,8],Sum).
Sum = [1, 1, 0].
?- suma([],[],Sum).
Sum = [0].
?- suma([],[2,8],Sum).
Sum = [2, 8].
*/