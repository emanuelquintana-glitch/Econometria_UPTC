# Apéndice A: Conceptos Estadísticos Fundamentales

## Parte I: Econometría y su Identidad

---

## 1. ¿Qué es la Econometría?

La **econometría** es una disciplina de las ciencias sociales que integra la **teoría económica**, las matemáticas y la inferencia estadística para el análisis cuantitativo de los fenómenos económicos reales. Su propósito fundamental es dar contenido empírico a las leyes económicas, transformando hipótesis cualitativas en medidas numéricas precisas.

> ### Etimología e Identidad
>
> El término significa literalmente **"medición económica"**. Sin embargo, la econometría no es solo recopilación de datos; es una perspectiva específica que busca prestar apoyo empírico a los modelos construidos por la economía matemática y obtener resultados numéricos para la toma de decisiones.

---

## 2. La "Amalgama" de Disciplinas

La econometría se nutre de cuatro pilares fundamentales:

1. **Teoría Económica:** Formula hipótesis cualitativas (ej. "La relación entre precio y demanda es inversa").
2. **Economía Matemática:** Expresa la teoría en ecuaciones sin preocuparse por la medición.
3. **Estadística Económica:** Se encarga de la recolección, procesamiento y presentación de datos (PIB, Empleo, etc.).
4. **Estadística Matemática:** Proporciona las herramientas (inferencia, probabilidad) para validar los modelos.

---

## 3. Conceptos Estadísticos Clave (Fórmulas)

Para aplicar la econometría, necesitamos dominar los momentos estadísticos de las variables:

### A. Esperanza Matemática (Media Poblacional)

Representa el valor promedio esperado de una variable aleatoria $X$.
$$E(X) = \mu = \sum_{i=1}^{n} x_i P(x_i)$$

### B. Varianza ($\sigma^2$)

Mide la dispersión de los datos respecto a su media. En econometría, una varianza alta implica mayor incertidumbre en el estimador.
$$Var(X) = \sigma^2 = E[(X - \mu)^2]$$

### C. Covarianza

Indica el grado de variación lineal conjunta entre dos variables aleatorias ($X, Y$). Es la base para entender la correlación.
$$Cov(X, Y) = E[(X - E(X))(Y - E(Y))]$$

### D. Coeficiente de Correlación ($\rho$)

Mide la fuerza y dirección de la relación lineal, acotada entre $-1$ y $1$.
$$\rho_{XY} = \frac{Cov(X, Y)}{\sigma_X \sigma_Y}$$

---

## 4. El Modelo Lineal Simple

El punto de partida de la econometría aplicada es la función de regresión:

$$Y = \beta_0 + \beta_1 X + u$$

Donde:

* $Y$: Variable dependiente (explicada).
* $X$: Variable independiente (explicativa).
* $\beta_0, \beta_1$: Parámetros del modelo.
* $u$: Término de error o perturbación estocástica (representa lo que la teoría no puede explicar).

---
*Notas de clase: Econometría UPTC - 2026*
