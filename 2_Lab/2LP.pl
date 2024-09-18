/* Dominykas Černovas, 3 kursas, 3 grupė */
/* Užduoties variantai: 1.2, 4.1 */

/* DUOMENYS */
kelias(palanga, klaipeda, 60).
kelias(palanga, taurage, 30).
kelias(palanga, kaunas, 200).
kelias(palanga, telsiai, 20).
kelias(telsiai, siauliai, 70).
kelias(siauliai, panevezys, 80).
kelias(panevezys, vilnius, 140).
kelias(klaipeda, vilnius, 310).
kelias(taurage, kaunas, 170).
kelias(kaunas, vilnius, 100).

/* 
1.2 Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“: nuvažiavus lygiai L kilometrų.
Testai:
kelione(palanga, klaipeda, 60) - true
kelione(palanga, vilnius, 500) - false
kelione(palanga, vilnius, 370) - true
kelione(palanga, vilnius, 260) - true
kelione(palanga, vilnius, Atstumas) - Atstumas = 370 ; Atstumas = 300 ; Atstumas = 300 ; Atstumas = 310;
*/
kelione(Miestas1, Miestas2, Atstumas) :- 
    kelias(Miestas1, Miestas2, Atstumas).
kelione(Miestas1, Miestas2, Atstumas) :-
    kelias(Miestas1, MiestasTemp, Atstumas1),
    kelione(MiestasTemp, Miestas2, Atstumas2),
    Atstumas is Atstumas1 + Atstumas2.

/* 
4.1 Duotas natūrinis skaičius N. Naudodami rekursyvųjį algoritmą, raskite N-ąjį Fibonačio skaičių.
fibonacci(N, Fib).
Testai:
fibbonaci(0, Fib) - Fib = 0
fibbonaci(-1, Fib) - false
fibbonaci(1, Fib) - Fib = 1
fibbonaci(10, Fib) - Fib = 55
*/
fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, Fib) :-
    N > 1,
    N1 is N - 1,
    fibonacci(N1, Fib1),
    N2 is N - 2,
    fibonacci(N2, Fib2),
    Fib is Fib1 + Fib2.