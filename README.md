# Sistema de Relaciones Familiares en Prolog

Universidad Distrital Francisco José de Caldas  
Proyecto Curricular de Ingeniería de Sistemas

**Asignatura:** Modelos de Programación II  
**Profesor:** Alejandro Paolo Daza Corredor

---

## Integrantes

- Amir Zoleyt Vanegas Cárdenas - 20211020015 <br> azvanegasc@udistrital.edu.co
- Esteban Alejandro Villalba Delgadillo - 20212020064 <br> eavillalbad@udistrital.edu.co
- Samuel Antonio Sanchez Peña - 20212020151 <br> samasanchezp@udistrital.edu.co

### Descripción del proyecto

Este programa en Prolog utiliza una base de conocimiento sobre relaciones familiares para definir y consultar parentescos como padres, abuelos, hermanos, tíos, primos entre otros. También permite realizar consultas sobre familiares de una persona específica y otras relaciones adicionales.

## Objetivo principal

El objetivo principal de este programa es modelar una base de conocimiento familiar y proporcionar reglas que permitan determinar relaciones complejas entre individuos.
### Funcionalidades Principales

1. **Hechos sobre relaciones básicas**:
   - Relaciones de **padres** y **madres**.
   
2. **Reglas derivadas para parentescos**:
   - Relación entre **hijos**, **abuelos**, **nietos**, **hermanos**, **tíos**, **primos**, etc.
   - Detección de relaciones como **casados** y **suegros**.

3. **Consulta de familiares**:
   - Obtención de todos los familiares de una persona.

---

## Contenido del Código

### Hechos
El programa define relaciones directas usando hechos como `padre/2` y `madre/2`:

    ```prolog
    padre(juan, maria).
    madre(marta, maria).

### Reglas
El programa usa reglas para deducir relaciones mas complejas, algunos ejemplos:

1. **Hijo**:
    ```prolog
    hijo(Hijo, Padre) :-
    padre(Padre, Hijo);
    madre(Madre, Hijo).
2. **Abuelo**:
   ```prolog
   abuelo(Abuelo, Nieto) :-
    padre(Abuelo, Padre),
    hijo(Nieto, Padre).
3. **Consulta de familiares**:
    ```prolog
    familiares(Persona, ListaFamiliares) :-
    findall(Familiar, familiar(Persona, Familiar), ListaFamiliares).
### Ejemplos de Uso

- Quienes son los hijos de juan?
    ```prolog
    ?- hijo(X, juan).
    X = maria ;
    X = pedro.
- Quien es el abuelo de Andres?
    ```prolog
    ?- hijo(X, juan).
    X = maria ;
    X = pedro.
- Quienes son los hermanos de luis?
    ```prolog
    ?- hijo(X, juan).
    X = maria ;
    X = pedro.
- Cuales son todos los familiares de Pedro?
    ```prolog
    ?- hijo(X, juan).
    X = maria ;
    X = pedro.
## Instrucciones de Uso

Sigue estos pasos para usar el programa en Prolog:

### 1. Instalar SWI-Prolog
Asegúrate de tener SWI-Prolog instalado en tu sistema. Puedes descargarlo desde su [sitio oficial](https://www.swi-prolog.org/).

### 2. Cargar el Programa
   ```prolog
   ?- swipl familia.pl
