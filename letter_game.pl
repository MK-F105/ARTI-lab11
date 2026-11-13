
:- dynamic letters/1.

letters([a,b,c,d,e,f,g]).


menu:-
    write('Hi, this is the "Name Game"'),
    nl, write('you will be given a set of English letters in which you will add, delete or move to create your name.'),

    nl, nl,write('choose from the following:'),
    nl,write('1- Display the current set of letters'),
    nl,write('2- Add a letter'),
    nl,write('3- Add a letter at the top'),
    nl,write('4- Add a letter at the bottom'),
    nl,write('5- Delete a letter'),
    nl,write('6- Delete all letters'),
    nl,write('7- Exit'),

    nl, nl, write('Enter your choice...'),
    read(X),
    play(X).

play(1) :-
    letters(L),
    write('Current set of letters: '), writeln(L),
    menu.

play(2) :-
    writeln('insert a letter'),
    read(Y),
    letters(L),
    append(L, [Y], NewL),
    retractall(letters(_)),
    assertz(letters(NewL)),
    write('letter inserted at the bottom of the list'),
    menu.

play(3) :-
    writeln('insert a letter'),
    read(Y),
    letters(L),
    NewL = [Y|L],
    retractall(letters(_)),
    asserta(letters(NewL)),
    write('letter inserted at the top of the list'),
    menu.

play(4) :-
    writeln('insert a letter'),
    read(Y),
    letters(L),
    append(L, [Y], NewL),
    retractall(letters(_)),
    assertz(letters(NewL)),
    write('letter inserted at the bottom of the list'),
    menu.

play(5) :-
    write('Enter a letter to delete: '),
    read(Y),
    letters(L),
    (   select(Y, L, NewL)
    ->  retractall(letters(_)),
        assertz(letters(NewL)),
        write('Deleted '), write(Y), writeln(' successfully.')
    ;   write('Letter '), write(Y), writeln(' not found in the set.')
    ),
    menu.

play(6) :-
    retractall(letters(_)),
    assertz(letters([])),
    writeln('All letters deleted.'),
    menu.

play(7):-
    writeln('Goodbye!').













