/* Dominykas Černovas, 3 kursas, 3 grupė */
/* Užduoties variantai: 1.4, 2.4, 3.1, 4.7 */

/*
1.4 tr_suma(Sar,Sum) - teisingas, kai duotame sąraše Sar galima rasti tris iš eilės einančius skaičius, kurių suma lygi Sum. 
Testai:
tr_suma([1,4,-2,13,6],17) - true
tr_suma([1,4,-2,13,6],18) - false
tr_suma([1,4,-2,13,6],Sum) - Sum = 3 ; Sum = 15 ; Sum = 17 ;
*/

tr_suma([A, B, C | _], Sum) :-
    Sum is A + B + C.       % Tikriname, ar pirmi trys skaičiai sudaro Sum

tr_suma([_ | T], Sum) :-
    tr_suma(T, Sum).         % Jei ne, pereiname prie likusio sąrašo

/*
2.4 pirmieji(S,K,R) - sąrašas R - pirmųjų K duoto sąrašo S elementų sąrašas. 
Testai: 
pirmieji([a,b,c,d,e], 3, R). - R = [a,b,c].
pirmieji([a,b,c,d,e], 0, R). - R = [].
pirmieji([a,b,c,d,e], 5, R). - R = [a,b,c,d,e].
pirmieji([a,b,c,d,e], 6, R). - false.
*/
% Base case
pirmieji(_, 0, []) :- !.

pirmieji([H|T], K, [H|R]) :-
    K > 0,              
    K1 is K - 1,        
    pirmieji(T, K1, R). % Rekursyviai kviečiame pirmieji su mažesniu K

/*
3.1 ieina(S,R) - teisingas, kai visi duoto sąrašo S elementai įeina į sąrašą R.
Testai:
ieina([1, 4], [3,2,4,1,5]) - true
ieina([1, 9], [3,2,4,1,5]) - false
ieina([], [3,2,4,1,5]) - true
ieina([1, 4], []) - false
ieina([], []) - true
*/
ieina([], _).

ieina([H|T], R) :-
    elementas_sarase(H, R),
    ieina(T, R).

% Pagalbinis predikatas, patikriname ar elementas yra sąraše
elementas_sarase(E, [E|_]) :- !.
elementas_sarase(E, [_|T]) :-
    elementas_sarase(E, T).

/*
4.7 suma(S1, S2, Sum) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. Sum - tų skaičių suma vaizduojama skaitmenų sąrašu.
Testai:
suma([9,4,6,1,3,4],[2,8],Sum). - Sum = [9,4,6,1,6,2].
suma([9, 9], [2], Sum). - Sum = [1, 0, 1].
suma([0], [1,3], Sum). - Sum = [1, 3].
*/

suma(S1,S2,Sum):-
    listas_i_skaiciu(S1, R1), 
    listas_i_skaiciu(S2, R2), 
    skaicius_i_lista(R1+R2,Sum).

% Konvertuojam listą į skaičių
listas_i_skaiciu([], Rezultatas, Rezultatas).

listas_i_skaiciu([H|T], Prefix, Rezultatas) :-
    Prefix1 is Prefix * 10 + H,
    listas_i_skaiciu(T, Prefix1, Rezultatas).

listas_i_skaiciu(Listas, Rezultatas) :- 
    listas_i_skaiciu(Listas, 0, Rezultatas).

% Konvertuojam skaičių į listą
skaicius_i_lista(Num, [Head | []]):- 
    Num < 10, 
    Head is Num, 
    !.

skaicius_i_lista(Num,List):-
    DividedNum is Num // 10,
    skaicius_i_lista(DividedNum, Temp_List),
    LastDigit is (Num mod 10),
    prideti_prie_galo(Temp_List, [LastDigit], List).

prideti_prie_galo([], X, X).
%Pirmas kintamasis - prad. sąrašas, antras - pridedamas sąrašas, trečias - rezultatas.
prideti_prie_galo([H|T1], X, [H|T2]) :- 
    prideti_prie_galo(T1, X, T2).