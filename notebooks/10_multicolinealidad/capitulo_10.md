# Multicolinealidad


# El Fenómeno de la Multicolinealidad en el Modelo Lineal Múltiple

En un modelo de regresión lineal múltiple (MLM), el supuesto de Gauss-Markov establece que no debe existir **multicolinealidad perfecta**. No obstante, la **multicolinealidad severa (o imperfecta)** es una violación práctica que degrada la potencia estadística del análisis.

---

## 1. Fundamentos Matemáticos: La Matriz de Diseño

Consideremos el modelo en notación matricial:


Donde  es una matriz de dimensiones . La estimación por Mínimos Cuadrados Ordinarios (MCO) requiere que la matriz  sea invertible.

### Multicolinealidad Perfecta

Ocurre cuando el rango de la matriz  es menor que  (). En términos algebraicos, existe un vector de constantes  tal que:



**Consecuencia:** La matriz  es singular, su determinante es cero y los coeficientes  no están determinados de forma única. Como señala **Wooldridge**, esto suele ser un error de especificación (p. ej., caer en la "trampa de la variable ficticia").

### Multicolinealidad Imperfecta

Existe una relación lineal estocástica tal que:



Donde  es un término de error. Aquí,  es invertible, pero está **mal condicionada**.

---

## 2. El Teorema de Gauss-Markov y la Precisión

Es crucial la distinción que hace **Gujarati**: la multicolinealidad es un problema de **deficiencia de datos** (micronumerosidad), no de violación de los supuestos para la insesgadez.

### Insesgadez y Eficiencia

Bajo multicolinealidad, los estimadores MCO siguen siendo:

1. **Insesgados:** .
2. **Eficientes (BLUE):** Poseen la varianza mínima entre los estimadores lineales.

**Sin embargo**, como advierte **Goldberger**, que la varianza sea la "mínima posible" no garantiza que sea pequeña en términos absolutos. En muestras altamente correlacionadas, el elipsoide de confianza se alarga drásticamente.

---

## 3. Mecánica de la Inflación de Varianza

Para cualquier coeficiente individual , la varianza se define como:

Donde  es el coeficiente de determinación de la regresión de  sobre el resto de los regresores.

### El Factor de Inflación de la Varianza (VIF)

El término  se denomina **VIF**.

* Si , entonces .
* **Russell y Watson** destacan que esto reduce los estadísticos  (), lo que lleva a aceptar la hipótesis nula  erróneamente (Error Tipo II).

---

## 4. Diagnóstico y Sintomatología Rigurosa

De acuerdo con la literatura clásica, debemos observar:

| Síntoma / Prueba | Descripción Técnica |
| --- | --- |
| **Paradoja de significancia** | Un  global muy alto con pruebas  significativas, pero todas las pruebas  individuales no significativas. |
| **VIF (Variance Inflation Factor)** | Un  (o  en contextos exigentes) sugiere que la varianza es 10 veces mayor de lo que sería sin correlación. |
| **Índice de Condición** | Derivado de los autovalores de . Valores  indican multicolinealidad moderada a fuerte. |
| **Inestabilidad de Coeficientes** | Cambios drásticos en los signos o magnitudes de  al eliminar una observación o una variable. |

---

## 5. El Dilema del Investigador: ¿Remediar o Aceptar?

**Wooldridge** es pragmático: si el objetivo es la **predicción** del valor esperado de , la multicolinealidad no es necesariamente un problema si las futuras observaciones de  mantienen el mismo patrón de correlación. Sin embargo, para la **inferencia causal**, es devastadora.

### Estrategias de Mitigación:

1. **Aumentar el tamaño de la muestra ():** Al aumentar , se compensa el aumento del VIF, reduciendo la varianza total.
2. **Restricciones de exclusión:** Eliminar una variable. *Riesgo:* Si la variable eliminada pertenece al modelo poblacional, se introduce **sesgo por variable omitida**, el cual es peor que la ineficiencia.
3. **Transformación de variables:** Utilizar ratios o primeras diferencias para "romper" la tendencia común.
4. **Componentes Principales (PCA):** Crear nuevos regresores ortogonales entre sí (aunque se pierde la interpretación económica directa de los coeficientes).

---

# Solucion ejercicio 10.3


10.3. Consulte el ejemplo de la mortalidad infantil analizado en 


el capítulo 8 (ejemplo 8.1).
Dicho ejemplo implicó hacer la regresión de la tasa de mortalidad infantil (MI) sobre el
PIB per cápita (PIBPC) y la tasa de alfabetización de las mujeres (TAM). Ahora, suponga
que añadimos la variable tasa de fecundidad total (TFT). Lo anterior da los siguientes
resultados de la regresión:




a) Compare estos resultados de la regresión con los obtenidos en la ecuación (8.1.4).
¿Qué cambios observa? ¿Cómo los explica?
b) ¿Vale la pena añadir la variable TFT al modelo? ¿Por qué?
c) Como todos los coefi cientes t individuales son estadísticamente signifi cativos, ¿podemos decir que no existe un problema de colinealidad en el presente caso?


Aquí tienes el desarrollo completo del **ejercicio 10.3**, basado en los datos proporcionados y la teoría econométrica de las fuentes:

### Ejercicio 10.3: Análisis de la Mortalidad Infantil (MI)

Consulte el ejemplo de la mortalidad infantil analizado en el capítulo 8 (ejemplo 8.1). Dicho ejemplo implicó hacer la regresión de la tasa de mortalidad infantil (**MI**) sobre el PIB per cápita (**PIBPC**) y la tasa de alfabetización de las mujeres (**TAM**). Ahora, suponga que añadimos la variable tasa de fecundidad total (**TFT**). Lo anterior da los siguientes resultados:

**Resultados de la regresión (Variable dependiente: MI)**

| Variable | Coeficiente | Error estándar | Estadístico *t* | Probabilidad |
| :--- | :--- | :--- | :--- | :--- |
| **C** | 168.3067 | 32.89165 | 5.117003 | 0.0000 |
| **PIBPC** | -0.005511 | 0.001878 | -2.934275 | 0.0047 |
| **TAM** | -1.768029 | 0.248017 | -7.128663 | 0.0000 |
| **TFT** | 12.86864 | 4.190533 | 3.070883 | 0.0032 |

*   **R-cuadrada:** 0.747372
*   **R-cuadrada ajustada:** 0.734740
*   **Error estándar de la regresión:** 39.13127
*   **Estadístico F:** 59.16767
*   **Durbin-Watson:** 2.170318

---

### a) Compare estos resultados con los obtenidos en la ecuación (8.1.4). ¿Qué cambios observa? ¿Cómo los explica?

Al comparar este modelo con el modelo original (que solo incluía PIBPC y TAM), se observan los siguientes cambios:

*   **Aumento del $R^2$:** El coeficiente de determinación aumentó de **0.7077** en el modelo original a **0.7474** en este nuevo modelo. Esto indica que la inclusión de la tasa de fecundidad explica un 4% adicional de la variación en la mortalidad infantil.
*   **Cambio en los coeficientes:** El coeficiente de la TAM pasó de **-2.2316** a **-1.7680**. El impacto de la alfabetización femenina parece ser menor ahora que se controla por la fecundidad.
*   **Explicación:** Estos cambios ocurren porque las variables explicativas están **correlacionadas entre sí** en la muestra. En el modelo anterior, la variable TAM "recogía" parte del efecto que en realidad pertenecía a la fecundidad (TFT), lo que se conoce como un sesgo por omisión de variable relevante en el modelo original.

### b) ¿Vale la pena añadir la variable TFT al modelo? ¿Por qué?

**Sí, vale la pena.** Las razones son:
1.  **Significancia estadística:** El estadístico *t* de la variable TFT es **3.07** con un valor *p* de **0.0032**, lo cual es altamente significativo (menor al nivel común de 0.05).
2.  **Mejora del ajuste:** Como se mencionó, el $R^2$ aumentó, indicando que la fecundidad es un determinante importante que ayuda a predecir mejor la mortalidad infantil.
3.  **Criterio teórico:** La teoría sugiere que familias con mayores tasas de fecundidad pueden tener menos recursos por hijo, lo que influye en la mortalidad, haciendo que la variable tenga relevancia lógica.

### c) Como todos los coeficientes *t* individuales son estadísticamente significativos, ¿podemos decir que no existe un problema de colinealidad en el presente caso?

**No, no se puede afirmar que no hay colinealidad.** 
La multicolinealidad es una cuestión de **grado, no de existencia**, y prácticamente todos los modelos económicos con múltiples regresores la padecen en algún nivel. El hecho de que todos los coeficientes sean significativos solo significa que la colinealidad **no es lo suficientemente severa** como para inflar los errores estándar al punto de hacer que los coeficientes parezcan cero. Sin embargo, la correlación entre el PIBPC, la educación femenina y la fecundidad es un hecho común en datos de desarrollo, y el cambio en la magnitud de los coeficientes al añadir TFT es una señal clara de que existe interdependencia entre los regresores.
