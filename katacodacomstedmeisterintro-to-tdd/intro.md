Test Driven Development
=======================

What is TDD
-----------

El desarrollo guiado por pruebas (TDD) por sus siglas en ingles, se refiere al acto de escribir las pruebas primero
y solo escribir el código fuente de la aplicación cuando hay una prueba fallida escrita previamente, dicha practica
es conocida como el ciclo de rojo, verde y refactorizacion.

* Paso 1 Rojo, Crea una prueba unitaria la cual estara fallida, debido a que no existe un codigo fuente que validarRojo crea una prueba fallida, 
* es importante recordar que se debe mantener la prueba lo más pequeña y simple posible. 
* Paso 2 Verde escribe solamente el código fuente suficiente para que la prueba se ejecute satisfactoriamente.
* Paso 3 Refactorizar el código fuente, para que sea mas eficiente su funcionamiento, sin cambiar la funcionalidad (mantener las pruebas en verde).
* Repetir, Repetir, Repetir....

Why would you want to do TDD
----------------------------

* Means that you get to the end of writing code with tests already written
* Forces the consideration of how to test the code before it has been written
* Can highlight unclear requirements earlier in the development process
