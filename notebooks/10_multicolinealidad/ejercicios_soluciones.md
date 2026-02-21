# Ejercicio

> Preguntas

10.1 En el modelo de regresion lineal de k variables, hay k ecuaciones normales para estimar las k incognitas. Estas ecuaciones normales estan dadas en el **apendice C**. Suponga que $X_k$, es una combinacion lineal perfecta de variables X restantes. ¿Como se demostraria que en este caso es imposible estimar los *k* coeficientes de regresion?

| $Y$ | $X_2$ | $X_3$ |
| --- | --- | --- |
| -10 | 1 | 1 |
| -8 | 2 | 3 |
| -6 | 3 | 5 |
| -4 | 4 | 7 |
| -2 | 5 | 9 |
| 0 | 6 | 11 |
| 2 | 7 | 13 |
| 4 | 8 | 15 |
| 6 | 9 | 17 |
| 8 | 10 | 19 |
| 10 | 11 | 21 |

## **Solucion problema 10.1**

Primero me gustaria aclarar que para demostrar que es imposible estimar los *k* coeficientes de regresion cuando existe una **combiancion lianl perfecta** entre las variables explicativas, debemos recurrir a las ppropiedades del algebra matricial y a la definicion del estimador de **Minimos Cuadrdos Ordinarios** (MCO).

Me gustaria comenzar hablando de la naturaleza de la relacion lineal imperfecta que nos dice que si la variable $X_k$, es una combinacion lineal perfecta de las demas variables $X$, significa que existen constantes $\lambda_{1}$, $\lambda_{2}$,...,$\lambda_{k-1}$ (no todas cero) tales que:

$$X_k = \lambda_1 X_1 + \lambda_2 X_2 + ... + \lambda_{k-1} X_{k-1}$$

Esto implica que las columnas de la **Matriz de datos** $X$ son linealmente dependientes.

Como segundo punto me gustaria hablar de el impacto de la matriz $(X'X)$, recordando que la teoria de MCO establece que el vector de coeficientes estimados se halla mediante la formula:

$$\hat{\beta} = (X'X)^{-1} X'y$$

Luego entonces pensariamos que esta formula para que tenga una unica solucion, es requisito indispensble que la matriz $(X'X)$ **sea no singular** (es decir, que sea invertible). SIn embargo:

- Si las columnas de $X$ son no lineales dependientes, el **determinante de** $(X'X)$ **es igual a cero**.

- Una matriz con determinante cero no tiene inversa.

- Matematicamente, esto equivale a intentar una division por cero en la formula escalar, lo que resulta en un valor **indeterminado.**  

Como tercer punto queria mencionar la importancia de hacer una demostracion con los datos proporcionaldos, digamos que al observar el conjunto de datos, podemos identificar la relacion exacta entre los regresores:

- $X_1$ **(intercepto)**: Es una columna implicita de unos.
- $X_2$:
- $X_3$:

Si analizamos la relacion entre $X_3$ y $X_2$, notamos que:

$$X_{3i} = 2X_{2i} - 1$$

Como el intercepto $X_1$, siempr vale 1, la relacion lineal perfecta es:

$$ X_3 = 2X_2 - 1X_1$$ o bien $$1X_1 - 2X_2 + 1X_3 = 0$$

Porque no pasamos a hablar de la consecuencias practicas, digamos que debido a esta dependencia lineal en la muestra:

1. **Indeterminacion de coeficientes:** No hay una forma unica de "desenredar" la influencia de $X_2$ y $X_3$ sobre $Y$. Cualquier intento de calculo resultara en una expresion de tipo 0/0.

2. **Varianza infinita**: Los errores estandar de los coeficientes serian **infinitos**, lo que significaria que las esrtimaciones no tienen ninguna precision ni validez estadistica.
