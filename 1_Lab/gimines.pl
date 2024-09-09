/* Dominykas Černovas, 3 kursas, 3 grupė */
/* Užduoties variantai: 22, 27, 29, 39 */

/* DUOMENYS */
/* asmuo(vardas, lytis, amžius, pomėgis). */

asmuo(abigail, moteris, 75, muzika).
asmuo(tommy, vyras, 75, skaitymas).

asmuo(vivian, moteris, 50, muzika). % Tom ir Vivian pora
asmuo(tracy, moteris, 49, krepsinis). % Lucius ir Tracy pora
asmuo(emily, moteris, 51, skaitymas). % Saul ir Emily pora
asmuo(michael, vyras, 48, krepsinis).

asmuo(tom, vyras, 50, krepsinis). % Tom ir Vivian pora
asmuo(lucius, vyras, 48, krepsinis). % Lucius ir Tracy pora
asmuo(saul, vyras, 48, krepsinis). % Saul ir Emily pora

asmuo(jim, vyras, 30, teise). % Jim, Vivian ir Tom vaikas
asmuo(abby, moteris, 28, muzika). % Abby, Vivian ir Tom vaikas

asmuo(victor, vyras, 30, skaitymas). % Victor, Tracy ir Lucius vaikas
asmuo(kim, moteris, 27, futbolas). % Kim ir Victor pora
asmuo(jimmy, vyras, 13, menas). %Jimmy, Victor ir Kim vaikas

asmuo(rosa, moteris, 28, informatika). % Rosa, Emily ir Saul vaikas
asmuo(goodman, vyras, 25, teise). % Goodman ir Rosa pora
asmuo(edward, vyras, 10, krepsinis). % Edward, Rosa ir Goodman vaikas

/* mama(Mama, Vaikas) */
mama(abigail, vivian).
mama(abigail, tracy).
mama(abigail, emily).
mama(abigail, michael).

mama(vivian, jim).
mama(vivian, abby).

mama(tracy, victor).

mama(emily, rosa).

mama(kim, jimmy).

mama(rosa, edward).

/* pora(Vyras, Žmona) */
pora(tommy, abigail).
pora(tom, vivian).
pora(lucius, tracy).
pora(saul, emily).
pora(victor, kim).
pora(goodman, rosa).

/*-----------------------------------------------------------------------------*/
/* Pagalbiniai predikatai */

tevas(Tevas, Vaikas) :- 
    mama(Mama, Vaikas), 
    pora(Tevas, Mama).

vienas_is_tevu(TevasMama, Vaikas) :- 
    mama(TevasMama, Vaikas);
    tevas(TevasMama, Vaikas).

dukra(Dukra, TevasMama) :- 
    vienas_is_tevu(TevasMama, Dukra),
    asmuo(Dukra, moteris, _, _).
/*-----------------------------------------------------------------------------*/

/* UŽDUOTYS */
/*
22. zentas(Zentas, UosvisUosve) - Žentas yra Uošvio arba Uošvės dukros vyras.
Testai:
zentas(lucius, tommy). - true
zentas(saul, abigail). - true
zentas(michael, tommy). - false
zentas(lucius, UosvisUosve). - UosvisUosve = abigail ; UosvisUosve = tommy ;
*/
zentas(Zentas, UosvisUosve) :-
    dukra(Dukra, UosvisUosve),
    pora(Zentas, Dukra).
    
/* 
27. vedes(Vedes) - ar vedęs (vyras)
Testai: 
vedes(tommy). - true
vedes(lucius). - true
vedes(abigail). - false
vedes(jim). - false
vedes(Vedes). - visi vede vyrai
*/
vedes(Vedes) :-
    asmuo(Vedes, vyras, _, _),
    pora(Vedes, _).

/*
29. bendraamziai(Asmuo1, Asmuo2) - tokio pačio amžiaus
Testai:
bendraamziai(abigail, tommy). - true
bendraamziai(tommy, abigail). - true
bendraamziai(abigail, abby). - false
bendraamziai(Asmuo1, jim). - Asmuo1 = victor
bendraamziai(tom, Asmuo2). - false
bendraamziai(saul, Asmuo2). - Asmuo2 = michael ; Asmuo2 = lucius ;
*/
bendraamziai(Asmuo1, Asmuo2) :-
    asmuo(Asmuo1, _, Metai, _),
    asmuo(Asmuo2, _, Metai, _),
    Asmuo1 \= Asmuo2.

/* 
39. trys_draugai(Draugas1, Draugas2, Draugas3) - panašaus amžiaus ir turi tokį patį pomėgį.
Testai:
trys_draugai(tom, lucius, saul). - true
trys_draugai(tom, lucius, tommy). - false
trys_draugai(tom, lucius, Draugas3). - Draugas3 = tracy ; Draugas3 = michael ; Draugas3 = saul ;
trys_draugai(rosa, edward, Draugas3). - false
*/
trys_draugai(Draugas1, Draugas2, Draugas3) :- 
    asmuo(Draugas1, _, Metai1, Pomegis),
    asmuo(Draugas2, _, Metai2, Pomegis),
    asmuo(Draugas3, _, Metai3, Pomegis),
    Draugas1 \= Draugas2,
    Draugas1 \= Draugas3,
    Draugas2 \= Draugas3,
    abs(Metai1 - Metai2) =< 3,
    abs(Metai1 - Metai3) =< 3,
    abs(Metai2 - Metai3) =< 3.