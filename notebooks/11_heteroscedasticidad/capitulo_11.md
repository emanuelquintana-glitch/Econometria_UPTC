# Notas Detalladas sobre Heteroscedasticidad (Damodar Gujarati)

## 1. Naturaleza de la Heteroscedasticidad

La **heteroscedasticidad** constituye una violación directa de uno de los supuestos fundamentales del Modelo Lineal Clásico (MLC): el supuesto de **homoscedasticidad**, que implica una varianza constante de las perturbaciones.

### 1.1 Definición Formal y Representación Matemática

Mientras que bajo homoscedasticidad la varianza de las perturbaciones estocásticas ($u_i$) es constante e independiente de la observación, representada como:

$$E(u_i^2) = \sigma^2$$

En presencia de heteroscedasticidad, esta varianza se vuelve específica para cada observación o grupo de observaciones. La representación formal es:

$$E(u_i^2) = \sigma_i^2$$

El subíndice $i$ en $\sigma_i^2$ es crucial, ya que indica que la varianza es una función de la observación $i$-ésima y, por lo tanto, varía a lo largo de la muestra.

### 1.2 Interpretación Gráfica

Gráficamente, este fenómeno se manifiesta como una "dispersión" o "esparcimiento" no uniforme de los errores alrededor de la línea de regresión. A medida que cambia el valor de una variable independiente ($X$), la amplitud de la nube de puntos (residuales) aumenta o disminuye sistemáticamente, en lugar de permanecer constante.

---

## 2. Causas de la Heteroscedasticidad

La naturaleza de este problema suele originarse en características intrínsecas de los datos o en deficiencias en la especificación del modelo.

- **Modelos de Aprendizaje:** En procesos donde los agentes (personas, empresas) aprenden con el tiempo, la varianza de los errores tiende a disminuir. Por ejemplo, la variabilidad en la productividad de una empresa suele ser mayor en sus primeros años que después de una década de experiencia.
- **Relación Ingreso-Gasto (Efecto Renta):** En estudios transversales de consumo, las familias con ingresos más altos exhiben una mayor variabilidad en sus patrones de gasto discrecional. Mientras que las familias de bajos ingresos deben destinar la mayor parte de su renta a bienes de primera necesidad (patrón de gasto más predecible), las de altos ingresos tienen más opciones, lo que aumenta la varianza del error.
- **Presencia de Valores Atípicos (*Outliers*):** La inclusión de observaciones que son extremadamente diferentes al resto de la muestra (por ejemplo, incluir a una corporación multinacional gigante en una muestra de pequeñas y medianas empresas) puede inflar artificialmente la varianza de los errores para esa observación, generando heteroscedasticidad, especialmente en muestras pequeñas.
- **Deficiencias en la Especificación del Modelo:**
  - **Omisión de Variables Relevantes:** Si una variable importante que debería estar en el modelo se omite, su efecto se absorbe en el término de error, pudiendo crear un patrón sistemático en la varianza de los residuales.
  - **Forma Funcional Incorrecta:** Usar un modelo lineal cuando la verdadera relación es, por ejemplo, logarítmica o de otro tipo, puede manifestarse como heteroscedasticidad en los residuales estimados.
- **Asimetría en la Distribución de Variables:** Variables económicas como el ingreso, la riqueza o el tamaño de las empresas suelen tener distribuciones asimétricas (sesgadas a la derecha). Esta heterogeneidad intrínseca es un caldo de cultivo para la varianza no constante.

---

## 3. Presencia Común en los Datos

- **Datos de Corte Transversal (*Cross-Section*):** La heteroscedasticidad es un problema endémico en este tipo de datos. Esto se debe a la gran heterogeneidad de las unidades de análisis en un mismo punto del tiempo (por ejemplo, comparar el gasto en I+D de startups tecnológicas y de grandes conglomerados industriales).
- **Datos de Series de Tiempo:** Aunque es menos frecuente, puede aparecer si se producen cambios estructurales o shocks significativos que alteren la estabilidad de la varianza del error a lo largo del tiempo.

---

## 4. Consecuencias sobre el Modelo de Mínimos Cuadrados Ordinarios (MCO)

Es fundamental distinguir entre las propiedades que los estimadores MCO *conservan* y las que *pierden* bajo heteroscedasticidad.

### 4.1 Propiedades Conservadas

- **Insesgamiento y Linealidad:** Los estimadores MCO continúan siendo lineales e insesgados. Es decir, en promedio, su valor coincide con el verdadero parámetro poblacional.
- **Consistencia:** En muestras grandes, los estimadores MCO siguen siendo consistentes; convergen hacia el verdadero valor poblacional a medida que el tamaño de la muestra aumenta.

### 4.2 Propiedades Perdidas (La "Enfermedad")

- **Pérdida de Eficiencia (No es MELI/BLUE):** El Teorema de Gauss-Markov deja de cumplirse. El estimador MCO **ya no es el Mejor Estimador Lineal Insesgado (MELI)**, es decir, ya no tiene la varianza mínima dentro de la clase de los estimadores lineales e insesgados. Existe otro estimador, el de Mínimos Cuadrados Generalizados (MCG), que sí es eficiente (tiene varianza menor) en estas condiciones.

### 4.3 Invalidez de la Inferencia Estadística (La Consecuencia más Grave)

- **Errores Estándar Sesgados:** Las fórmulas estándar de MCO para calcular las varianzas y, por ende, los errores estándar de los coeficientes, son **sesgadas** e inconsistentes. La dirección de este sesgo (si sobreestima o subestima la verdadera varianza) no es predecible a priori, ya que depende de la relación entre la varianza del error y las variables explicativas.
- **Pruebas de Hipótesis ($t$ y $F$) No Confiables:** Dado que los errores estándar están sesgados, los estadísticos $t$ y $F$ calculados convencionalmente dejan de seguir las distribuciones $t$ y $F$ teóricas. Esto conduce a conclusiones erróneas sobre la significancia estadística de las variables. Se puede declarar una variable como significativa cuando no lo es (error tipo I), o viceversa (error tipo II).
- **Intervalos de Confianza Poco Fiables:** Los intervalos de confianza construidos con los errores estándar convencionales serán incorrectos (generalmente más amplios o más estrechos de lo que deberían ser), degradando la precisión de cualquier inferencia sobre la población.

**En resumen:** Aunque los coeficientes de una regresión con heteroscedasticidad no están sesgados, las **conclusiones sobre la importancia de las variables y la validez de los intervalos de confianza dejan de ser fiables** si se utilizan los procedimientos de cálculo de MCO estándar.

---

## 5. Detección de la Heteroscedasticidad

La detección combina métodos visuales informales y pruebas estadísticas formales, todas ellas basadas generalmente en el análisis de los **residuales de MCO ($\hat{u}_i$)**.

### 5.1 Métodos Informales

- **Inspección Visual (Análisis Gráfico):** Es el primer paso. Consiste en graficar los residuales al cuadrado ($\hat{u}_i^2$) o en valor absoluto ($|\hat{u}_i|$) frente a:
  - Los valores estimados de la variable dependiente ($\hat{Y}_i$).
  - Cada una de las variables explicativas ($X_i$).
  - La presencia de un **patrón sistemático** (por ejemplo, un abanico que se abre o se cierra, una forma cónica o parabólica) es un fuerte indicio de heteroscedasticidad. La ausencia de patrón (nube de puntos aleatoria) sugiere homoscedasticidad.

### 5.2 Pruebas Estadísticas Formales

Estas pruebas formalizan la idea de que la varianza del error está relacionada con alguna variable.

- **Prueba de Park:** Es una formalización del método gráfico. Se asume que la varianza ($\sigma_i^2$) es una función de la variable explicativa $X_i$. Se estima la regresión: $\ln(\hat{u}_i^2) = \alpha + \beta \ln(X_i) + v_i$. Si $\beta$ es estadísticamente significativo, hay evidencia de heteroscedasticidad.
- **Prueba de Glejser:** Similar a la de Park, pero más flexible. Se regresa el **valor absoluto de los residuales** ($|\hat{u}_i|$) sobre alguna función de $X_i$ (por ejemplo, $X_i$, $\sqrt{X_i}$, $1/X_i$). La significancia estadística del coeficiente en esta regresión indica la presencia del problema.
- **Prueba de Correlación de Rangos de Spearman:** Se calcula la correlación entre los rangos de los valores absolutos de los residuales ($|\hat{u}_i|$) y los rangos de la variable $X_i$ (o de $\hat{Y}_i$). Si el coeficiente de correlación de rangos es estadísticamente significativo, existe evidencia de heteroscedasticidad.
- **Prueba de Goldfeld-Quandt:** Válida si se sospecha que la varianza está relacionada positivamente con una variable $X$ en particular. El procedimiento implica:
    1. Ordenar las observaciones según los valores de $X$.
    2. Omitir un número de observaciones centrales ($c$).
    3. Ajustar dos regresiones separadas con las dos submuestras de tamaño similar.
    4. Calcular el estadístico $F = SCR_2/SCR_1$ (Suma de Cuadrados Residuales de la muestra de varianza supuestamente mayor dividida por la de la menor). Si $F$ es mayor que el valor crítico, se rechaza la hipótesis nula de homoscedasticidad.
- **Prueba de Breusch-Pagan-Godfrey (BPG):** Es una prueba más general. Se asume que la varianza del error es una función lineal de un conjunto de variables ($z$). Se estima la regresión: $\hat{u}_i^2 / \tilde{\sigma}^2 = \alpha + \beta z_i + v_i$, donde $\tilde{\sigma}^2$ es la suma de residuales al cuadrado dividida por $n$. El estadístico de prueba sigue una distribución $\chi^2$.
- **Prueba General de White (o de White):** Es una de las más útiles y utilizadas porque no requiere el supuesto de normalidad de los errores y es fácil de implementar. La prueba consiste en una regresión auxiliar de los **residuales al cuadrado ($\hat{u}_i^2$)** sobre los **regresores originales, sus cuadrados y sus productos cruzados**. El estadístico $n \cdot R^2$ de esta regresión auxiliar sigue una distribución $\chi^2$. Un valor alto y significativo indica heteroscedasticidad.
- **Prueba de Koenker-Bassett (KB):** Es una extensión o variante de la prueba de White que se basa en la regresión de los residuales al cuadrado contra los valores ajustados del modelo elevados al cuadrado, siendo robusta a ciertas desviaciones de la normalidad.

**En la práctica, la estrategia de detección suele ser:** 1) Inspección gráfica de los residuales como primer diagnóstico exploratorio, seguido de 2) Aplicación de pruebas estadísticas formales como la de White o la de Park para obtener una confirmación estadística robusta.
