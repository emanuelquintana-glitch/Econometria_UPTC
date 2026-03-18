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

### Estrategias de Mitigación

1. **Aumentar el tamaño de la muestra ():** Al aumentar , se compensa el aumento del VIF, reduciendo la varianza total.
2. **Restricciones de exclusión:** Eliminar una variable. *Riesgo:* Si la variable eliminada pertenece al modelo poblacional, se introduce **sesgo por variable omitida**, el cual es peor que la ineficiencia.
3. **Transformación de variables:** Utilizar ratios o primeras diferencias para "romper" la tendencia común.
4. **Componentes Principales (PCA):** Crear nuevos regresores ortogonales entre sí (aunque se pierde la interpretación económica directa de los coeficientes).

---

En proceso ...

* Coeficiente de correlación: $r_{23} = \frac{\sum_{i=1}^{n}(X_{2i} - \bar{X}_2)(X_{3i} - \bar{X}_3)}{\sqrt{\sum_{i=1}^{n}(X_{2i} - \bar{X}_2)^2}\sqrt{\sum_{i=1}^{n}(X_{3i} - \bar{X}_3)^2}}$
* Coeficiente de regresión: $\beta_2 = \frac{\sum_{i=1}^{n}(X_{2i} - \bar{X}_2)(Y_i - \bar{Y})}{\sum_{i=1}^{n}(X_{2i} - \bar{X}_2)^2}$

$$\text{Var}(\hat{\beta}) = \sigma^2 (X^T X)^{-1}$$
