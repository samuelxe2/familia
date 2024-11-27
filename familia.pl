% Base de conocimientos

% Hechos
padre(juan, maria).
padre(juan, pedro).
padre(carlos, ana).
padre(carlos, luis).
padre(luis, sofia).
padre(luis, tomas).
padre(pedro, andres).

madre(marta, maria).
madre(marta, pedro).
madre(laura, ana).
madre(laura, luis).
madre(sofia, tomas).
madre(ana, andres).

% Reglas

hijo(Hijo, Padre) :-
    padre(Padre, Hijo);
    madre(Madre, Hijo).

abuelo(Abuelo, Nieto) :-
    padre(Abuelo, Padre),
    hijo(Nieto, Padre).

nieto(Nieto, Abuelo) :-
    abuelo(Abuelo, Nieto).

tio(Tio, Sobrino) :-
    padre(Padre, Sobrino),
    hermano(Tio, Padre).

sobrino(Sobrino, Tio) :-
    tio(Tio, Sobrino).

hermano(Hermano1, Hermano2) :-
    padre(Padre, Hermano1),
    padre(Padre, Hermano2),
    Hermano1 \= Hermano2.

primo(Primo1, Primo2) :-
    padre(Padre1, Primo1),
    padre(Padre2, Primo2),
    hermano(Padre1, Padre2).

familiar(Persona1, Persona2) :-
    padre(Persona1, Persona2);
    madre(Persona1, Persona2);
    abuelo(Persona1, Persona2);
    nieto(Persona1, Persona2);
    tio(Persona1, Persona2);
    sobrino(Persona1, Persona2);
    primo(Persona1, Persona2).

familiares(Persona, ListaFamiliares) :-
    findall(Familiar, familiar(Persona, Familiar), ListaFamiliares).

casado(Persona1, Persona2) :-
    padre(Persona1, Hijo),
    madre(Persona2, Hijo),
    Persona1 \= Persona2.

suegro(Suegro, Yerno) :-
    casado(Yerno, Esposa),
    padre(Suegro, Esposa).

feliz(Persona) :-  
    casado(Persona,_).