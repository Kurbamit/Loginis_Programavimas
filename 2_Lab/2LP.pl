/* Dominykas Černovas, 3 kursas, 3 grupė */
/* Užduoties variantai: 1.2, 4.1 */

/* 
1.2 Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“: nuvažiavus lygiai L kilometrų.
*/


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