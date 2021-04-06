Test Driven Development
=======================

What is TDD
-----------

El desarrollo guiado por pruebas (TDD) por sus siglas en ingles, se refiere al acto de escribir las pruebas primero
y solo escribir el código fuente de la aplicación cuando hay una prueba fallida escrita previamente, dicha practica
es conocida como el ciclo de rojo, verde y refactorizacion.

* red.  Crea una prueba unitaria la cual estara fallida, debido a que no existe un codigo fuente que validarRojo crea una prueba fallida, es importante recordar que se debe mantener la prueba lo más pequeña y simple posible. 
* Green write just enough code to make the test pass
* Refactor rework the code without changing the functionality (keep the tests green).
* Repeat

Why would you want to do TDD
----------------------------

* Means that you get to the end of writing code with tests already written
* Forces the consideration of how to test the code before it has been written
* Can highlight unclear requirements earlier in the development process
