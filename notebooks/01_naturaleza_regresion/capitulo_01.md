# Naturaleza de la regresion 
### NOtas del libro de damodar gujaratii emanuel quintana silva importancia de la econometria 
emanuel quintana silva 

Del latin regression que significa "volver atras" Galton observo que la naturaleza parece "frenar" los extremos para mantener la estabilidad de la especie.
Una paradoja es que aunque hoy la "regresion" suena a prediccion de futuro originalmente se referia al "retroceso" de los hijos hacia la estatura promedio de la poblacion 
El temino **regresion** tiene su origen historico en los estudios de **Francis Galton,** un cientifico britanico del siglo XIX. En un famoso articulo, Galton observo que, aunque existia una tendencia de padres altos a tner hijos altos y de padres bajos a tener hijos bajos, la estatura promedio de los hijos nacidos de padres con una estatura determinada tendia a desplazarse o **"regresar" hacia la estatura promedio** de la poblacion total. (Regression Towards Mediocrity in Hereditary Stature" (1886) – Francis Galton:
Este es el artículo fundacional publicado en el Journal of the Anthropological Institute ( "Natural Inheritance" (1889) – Francis Galton:
En este libro, Galton formaliza sus ideas previas. Es fundamental porque explica la transición de una observación biológica a una ley estadística general.))
1. El análisis en The History of Statistics (1986)
Stigler dedica una sección fundamental a explicar la paradoja semántica: ¿Por qué usamos una palabra que significa "retroceder" (regression) para algo que hoy usamos para "predecir" hacia adelante?

    La Mediocridad como Destino: Stigler detalla que Galton estaba obsesionado con la herencia. Al estudiar a padres altos y sus hijos, notó que el "extra" de altura de los padres no se heredaba por completo; los hijos "retrocedían" hacia la media de la población.
    De lo Biológico a lo Universal: Stigler argumenta que el genio de Galton (y el error común de sus contemporáneos) fue entender que este "retroceso" no era una fuerza misteriosa de la naturaleza, sino una propiedad matemática de cualquier distribución normal donde las variables no están perfectamente correlacionadas.
    La Conclusión de Stigler: El término sobrevivió por inercia histórica, pero perdió su significado biológico ("volver a ser mediocre") para convertirse en un nombre técnico para la pendiente de una línea.

2. El análisis en Galton’s Two Papers on Regression (1989)
Este artículo en Statistical Science es más técnico y se enfoca en la evolución del pensamiento de Galton entre 1877 y 1885:

    El Primer Paper (1877): Galton usa semillas de guisantes. Aquí, la "regresión" es puramente descriptiva y biológica. Stigler muestra cómo Galton aún no entendía la relación matemática completa; solo veía que las semillas extremas producían descendencia menos extrema.
    El Segundo Paper (1885): Aquí ocurre el "salto mortal". Galton analiza la altura humana y descubre la elipse de correlación. Stigler explica cómo Galton se dio cuenta de que la regresión de y sobre x era la misma que la de x sobre y.
    La Maduración: Stigler demuestra que en este segundo artículo, Galton deja de ver la regresión como un fenómeno de "padre a hijo" (unidireccional) y empieza a verla como una relación geométrica simétrica. Fue el momento en que nació la estadística multivariante.

La Gran Revelación de Stigler
Lo que Stigler aclara magistralmente es que Galton estuvo a punto de no descubrir la regresión porque estaba buscando "leyes de la herencia", y terminó encontrando una ley de la probabilidad. Stigler llama a esto la "victoria de la estadística sobre la biometría".


El origen Historico: Estaturas de Galton

El ejemplo fundacional de la regresion proviene de **Francis galton**, quien estudio la relacion entre la estatura de los padres y sus hijos.

- **El fenomeno:** Galton observo que, aunque los padres altos suelen tener hijos altos, la estatura promedio de estos hijos es menor que la de sus padres **regresados** hacia el promedio de la poblacion total.

- **La linea de regresion:** Al conectar las estaturas promedio de los hijos para cada nivel de estatura del padre, se obtiene una linea con pendiente positiva pero menor a 1, lo que Galton denomino **"regresion a la mediocrdad"** 

2. Multicolinealidad: Los datos de Longley y Mortalidad infantil 

Existen casos famosos donde las variables estan tan correlacionadas que es dificil aislar sus efectos:

- **Datos de Longley:** Este es un ejmplo clasico de series de tiempo (1947-1962) donde variables como el **GNP (Producto Nacional Bruto)**, el **tiempo** y la **poblacion** tienen una correlacion altisima superio a 0.99. El resultado es un modleo con un $R2$ casi perfecto (0.98), pero donde varios coeficientes inds individuales parecen no ser significativos o tienen signos erráticos.
• Mortalidad Infantil (CM): Al intentar explicar la mortalidad infantil basándose en el GNP per cápita y la tasa de alfabetismo femenino (FLR), se observa que ambas variables están relacionadas entre sí. Si se omite la alfabetización, el efecto del ingreso parece ser mucho mayor de lo que realmente es, ya que "absorbe" el impacto de la educación omitida (sesgo de especificación).
3. Escalamiento y Unidades: Peso al Nacer
Este ejemplo ilustra cómo cambiar las unidades de medida afecta a los coeficientes pero no a la esencia del modelo:
• Escenario A: Se mide el peso del niño en onzas. El coeficiente de cigarrillos fumados es -0.4634, indicando que por cada 5 cigarros más al día, el peso baja 2.317 onzas.
• Escenario B: Se cambia la variable dependiente a libras. El nuevo coeficiente es exactamente el anterior dividido entre 16 (-0.0289).
• Conclusión: Aunque los números cambian, el estadístico t, el R2 y la significancia se mantienen idénticos.
4. Formas Funcionales: Salarios y Experiencia (Cuadrática)
Para captar efectos que no son constantes (como el hecho de que un año extra de experiencia vale más al principio que al final de la carrera), se usan modelos cuadráticos:
• Modelo: Salario=3.73+0.298(Experiencia)−0.0061(Experiencia2).
• Interpretación: El primer año de experiencia aumenta el salario en 30 centavos, pero el décimo año solo lo aumenta en 17.6 centavos.
• Punto de Inflexión: El modelo predice que el rendimiento de la experiencia llega a su máximo a los 24.4 años, punto a partir del cual empezaría a decrecer.
5. Coeficientes Beta: Contaminación y Precios de Vivienda
Cuando las variables tienen escalas muy diferentes (como "número de habitaciones" vs. "partes por millón de contaminante"), se usan coeficientes estandarizados o Beta para compararlas:
• En un estudio de precios de casas, se encontró que un aumento de una desviación estándar en la contaminación (nox) reduce el precio en 0.34 desviaciones estándar, mientras que un aumento en el número de habitaciones (rooms) lo aumenta en 0.51.
• Esto permite concluir que el tamaño de la vivienda tiene un impacto relativo mayor en el precio que la contaminación.
6. Significancia de Variables: Estrategias de Negocio
En un estudio sobre una Central de Riesgos, se evaluó si la viabilidad, sostenibilidad y rentabilidad influyen en la priorización de estrategias.
• Resultado: Se encontró que el estadístico t para la variable Rentabilidad fue de 1.03, el cual es menor al valor crítico (aprox. 2).
• Decisión: Por lo tanto, se acepta la hipótesis nula (H0​) de que la rentabilidad no aporta información significativa al modelo en ese contexto específico, a pesar de que el modelo global sea válido.

En el estudio de la econometria y la estadistica, la distincion entre **relaciones estadisticas** y **relaciones deterministas** es fundamental para entender como se modelan los fenomenos del mundo real.

1. Relaciones Deterministas (o Funcionales)

Una relacion determinista es quella en la que el valor de una variable dependiente queda determinado de manera **univoca y exacta**  una vez que se conocen los valores de la svariables independientes.

- **Naturaleza exacta:** No existe incertidumbre ni margen de error en la prediccion. Si se conocen las entradas (regresores), la salida (regresand) es siempre la misma.

- **Ambito de aplicacion:** Son tipicas de las ciencias exactas o la fisica clasica.

 Ejemplos clásicos:
    ◦ Ley de Newton: La fuerza (F) es exactamente el producto de la masa (m) por la aceleración (a), es decir, F=ma.
    ◦ Ley de Boyle: La relación entre presión y volumen de los gases (PV=k).
    ◦ Ley de Ohm: La relación en electricidad definida por la ley de Kirchhoff.
• Nota sobre el error de medición: Si en estas leyes físicas se introducen errores al medir las variables, la relación, que es inherentemente determinista, se convierte en una relación estadística para el investigador, ya que la predicción dejaría de ser exacta.
2. Relaciones Estadísticas
A diferencia de las anteriores, una relación estadística trata con la dependencia de variables aleatorias o estocásticas, las cuales poseen distribuciones de probabilidad.
• Inexactitud intrínseca: En una relación estadística, las variables independientes no permiten predecir el valor de la variable dependiente de forma exacta. Existe una "variabilidad intrínseca" que no puede ser explicada totalmente, sin importar cuántas variables se incluyan en el modelo.
• Componentes del modelo: En estas relaciones, la variable dependiente (Y) se descompone en dos partes:
    1. Componente sistemático (o determinista): Representado por la función de regresión (por ejemplo, β1​+β2​X), que describe el valor promedio o esperado de Y dado X.
    2. Componente aleatorio (o error estocástico): Representado por el término de error o perturbación (u). Este término captura nuestra ignorancia sobre los detalles de los mecanismos económicos y otros factores omitidos.
• Ejemplos típicos:
    ◦ Rendimiento agrícola: El rendimiento de una cosecha depende de la temperatura, la lluvia y el fertilizante. Sin embargo, estos factores no permiten predecir el rendimiento exacto debido a errores de medición y otros factores difíciles de identificar individualmente.
    ◦ Consumo e ingreso: Aunque la teoría económica dice que el consumo depende del ingreso, esta relación no es exacta y está sujeta a variaciones individuales (dos personas con el mismo ingreso consumen cantidades diferentes).
3. Diferencias Clave y el Papel de la Econometría
Característica
	
Relación Determinista
	
Relación Estadística
Naturaleza
	
Funcional y exacta
	
Aleatoria y estocástica
Variables
	
No son aleatorias
	
Tienen distribuciones de probabilidad
Término de error (u)
	
No existe (Y=f(X))
	
Es esencial (Y=f(X)+u)
Predicción
	
Unívoca (sin error)
	
Promedio (con error aleatorio)
  * [ ] Conclusión: La econometría se ocupa casi exclusivamente de las relaciones estadísticas. El término de error (u) es el elemento que permite convertir una función matemática determinista en un modelo econométrico realista, reconociendo que los factores que ignoramos en nuestros modelos tienden, en promedio, a cancelarse, pero impiden una precisión absoluta en cada observación individual
  
  1. La regresion no implica causalidad 
  
  El analisis de regresion se causa unicamente de la **dependencia de una variable rspecto a otras,** con el fin de estimar o predecir su valor promedio. Sin embargo, la existencia de una relacion estatica, por fuerte y sugerente que sea, nunca puede establecer por si sola una conexion local. Por ejemplo, en ciudades grandes existe una alta correlacion entre le numero de autos y la tasa de criminalidad, pero esto no significa que los autos causen el crimen; ambos son influenciados por otros factores como el tamaño de poblacion o la pobreza.
  
  2. El papel de la teoria economica
  
  Para que un modelo de regresion tenga una interpretacion causal, las ideas deben provenir de **fuera de la estadistica,** es decir, de una teoria previa.
  
  - **Sentido de la relacion:** La estadistica no dice si la lluvia depende del rendimiento agricola o viceversa, pero el sentido comun y la teoria sugieren que la lluvia es la variable independiente porque no podemos controlarla variando la cosecha.
  
  - **Justificacion a priori:** Invocamos la teoria economica para decir que el gasto de consumo depende del ingreso real, y no al reves. basando la estructura del modelo en el razonamiento previo.
  
  3. Causalidad en las series de tiempo (Causalidad de Grander)
  
  En el contexto de series temporales, se utiliza el termino **causalidad de Granger,** que en realidad se refiere a la **precedencia temporal** causalidad predictiva.

- **Logica:** Dado que le tiempo no corre hacia atras los eventos del pasado pueden causar los de hoy, pero los del futuro no.

- **Definicion:** Se dice que una variable X "causa" a Y si los valores pasados de X contienen informacion util para predecir los valores actuales de Y, mas alla de la informacion contenida en el propio pasado de Y.

4. Simultaneidad y bidireccionalidad

En los modelo s de una sola ecuacion, se asume implicitamente que la causalidad fluye en **una sola direccion** (de los regresores al regresad). No obstante, en la realidad economica existen flujos de influencia en ambos sentidos (simultaneidad), como la relacion entre la oferta de dinero y las tasas de interes, donde cada una afectad a la otra. En estos casos, el uso de OLS (Minimos Cuadrados Ordinarios) puede producir estimaciones inconsistentes.

5. [ ] Falacias comunes
• Post hoc, ergo propter hoc: Es el error de asumir que porque el evento A ocurrió antes que el evento B, entonces A causó B.
• Regresiones espurias: Ocurren cuando dos variables parecen estar relacionadas debido a que ambas comparten una tendencia común a lo largo del tiempo, aunque no tengan ninguna relación causal real.
En resumen, la regresión es una herramienta para medir la co-variación, pero es el investigador quien, apoyado en la teoría, debe otorgarle un carácter causal al modelo.

La relación entre la regresión y la causalidad es uno de los temas más malinterpretados en la ciencia empírica, debido principalmente a que pertenecen a dominios matemáticos distintos: el estadístico y el causal. A continuación, se presenta una explicación ultra detallada basada en las fuentes proporcionadas.

### 1. La distinción fundamental: Ver vs. Hacer
La diferencia central reside en la distinción entre **estática** (estadística) y **cinemática** (causalidad).
*   **Regresión (Ver):** El análisis de regresión estándar tiene como objetivo evaluar parámetros de una distribución estática. Se ocupa de las asociaciones entre variables y permite estimar la probabilidad de eventos futuros basándose en observaciones pasadas, siempre que las condiciones experimentales permanezcan iguales. Matemáticamente, se expresa como la esperanza condicional $E(Y | X = x)$, que es el mejor presupuesto de $Y$ dada la observación de que $X$ ha tomado el valor $x$.
*   **Causalidad (Hacer):** El análisis causal busca inferir la dinámica de los eventos bajo **condiciones cambiantes**, como las inducidas por tratamientos, nuevas políticas o intervenciones externas. Aquí no solo "vemos" el valor de $X$, sino que lo "fijamos" mediante una intervención, lo cual se representa con el operador $do(x)$. El objetivo es encontrar $E(Y | do(x))$, que es la respuesta de $Y$ cuando $X$ es forzado a ser $x$.

### 2. Parámetros Estadísticos vs. Parámetros Causales
Las fuentes establecen una línea de demarcación clara entre los tipos de parámetros que cada disciplina maneja:
*   **Parámetro Estadístico:** Cualquier cantidad definida en términos de una distribución de probabilidad conjunta de variables observadas (ej. el coeficiente de regresión $r_{YX}$ o la esperanza condicional $E(Y|x)$). Estos parámetros no hacen suposiciones sobre la existencia de variables no observadas.
*   **Parámetro Causal:** Cualquier cantidad definida en términos de un **modelo causal estructural** (como los coeficientes de una ecuación estructural o el valor esperado de $Y$ bajo la intervención $do(x)$) que no sea un parámetro estadístico.

**Importante:** Un coeficiente de regresión solo tiene significado causal si se invocan supuestos causales adicionales que no son comprobables únicamente con los datos. "Detrás de cada conclusión causal debe haber un supuesto causal que no es discernible de la distribución conjunta".

### 3. La Ecuación Estructural vs. La Ecuación de Regresión
Aunque ambas pueden verse iguales ($y = \beta x + \epsilon$), su interpretación es radicalmente distinta:
*   **En Regresión:** La ecuación es un resumen de la distribución condicional; el término de error $\epsilon$ es simplemente la diferencia entre el valor observado y el valor esperado condicional. No tiene contenido empírico más allá de la asociación.
*   **En Modelos Causales (SEM):** La ecuación representa un **mecanismo autónomo e invariante** de la naturaleza. El signo de igualdad actúa como un símbolo de asignación ($:=$), indicando que el valor de la izquierda es determinado por las variables de la derecha. El coeficiente $\beta$ define la sensibilidad de $E(Y)$ ante manipulaciones experimentales de $X$.

### 4. ¿Cuándo la Regresión equivale a la Causalidad? (Identificabilidad)
Uno de los mayores aportes del análisis causal es determinar bajo qué condiciones un coeficiente de regresión ($r_{YX}$) puede ser un estimador consistente de un efecto causal ($\beta$). Esto se conoce como **identificación**.
*   **Criterio de la Puerta Trasera (Back-door Criterion):** Para que el ajuste por un conjunto de variables $Z$ elimine el sesgo y permita que la regresión capture el efecto causal, $Z$ debe bloquear todos los caminos "de puerta trasera" (caminos espurios que entran por las flechas que apuntan a $X$) entre la causa y el efecto, sin contener descendientes de $X$.
*   **Criterio de la Puerta Única:** En modelos lineales, un coeficiente de trayectoria $\beta$ es identificable si existe un conjunto de variables $Z$ que no son descendientes de $Y$ y que separan direccionalmente ($d$-separate) a $X$ de $Y$ en el gráfico una vez que se elimina el enlace $X \to Y$.

### 5. El error del "Cambio Unitario" en los libros de texto
Las fuentes critican cómo muchos libros de estadística y econometría intentan dar una interpretación causal a la regresión sin el lenguaje adecuado.
*   Muchos textos definen $\beta$ como "el cambio en $Y$ ante un aumento unitario en $X$ manteniendo lo demás constante".
*   Pearl señala que si la ecuación es meramente de regresión, esta definición es incorrecta porque el "mantenimiento" de otras variables es observacional, no interventional. En una regresión, el coeficiente solo describe cómo cambian nuestras predicciones sobre $Y$ cuando *encontramos* casos donde $X$ es mayor por una unidad [11.5.2]. Solo en un modelo estructural $\beta$ representa el resultado de un cambio forzado o **cirugía sobre el modelo**.

### 6. Resumen de la Inadecuación Estadística
La estadística tradicional, por sí sola, es incapaz de manejar conceptos causales porque su vocabulario (probabilidad condicional, esperanza, varianza) no puede distinguir entre la **dependencia estadística** (si encuentro un síntoma, espero la enfermedad) y la **dependencia causal** (si trato el síntoma, no curo la enfermedad). Cualquier análisis que pretenda establecer causalidad basándose solo en regresión sin explicitar un gráfico causal o supuestos de intervención está, por definición, incompletamente escrito.

Basado en las fuentes proporcionadas, a continuación se presenta una lista representativa de los términos y definiciones utilizados para describir la **variable dependiente** y la **variable explicativa** (o independiente) en los dominios de la estadística, la causalidad y el procesamiento de señales:

### 1. Variable Dependiente ($Y$)
Se refiere generalmente al objeto de estudio o al resultado que se intenta predecir o explicar. Las fuentes la definen de las siguientes maneras:
*   **Variable de salida (Output variable):** En el contexto de sistemas y modelos funcionales, es la variable que "sale" del proceso tras una entrada.
*   **Lado izquierdo de la ecuación:** En los modelos de ecuaciones estructurales (SEM), es la variable que aparece sola a la izquierda del signo de igualdad ($:=$), indicando que su valor es determinado por el mecanismo descrito a la derecha.
*   **Eje Y / Ordenada:** En terminología de gráficos, representa el eje vertical.
*   **Rango:** El conjunto de valores posibles que puede tomar la medición.
*   **Medición real:** Es la magnitud medida efectivamente en un experimento.
*   **Variable de respuesta:** Término común en el diseño de experimentos para denotar el evento que reacciona a una intervención.
*   **Consecuente / Efecto:** En el análisis causal, es la variable que es influenciada por sus "padres" o causas directas.

### 2. Variable Explicativa ($X$)
Es la variable que se utiliza para modelar, predecir o causar cambios en la variable dependiente. Se conoce también como:
*   **Variable independiente:** Describe cómo o cuándo se toma cada muestra. Es la variable que "no depende" de otras dentro de un mecanismo específico.
*   **Eje X / Abscisa:** Representa el eje horizontal en una representación gráfica.
*   **Dominio:** El conjunto de parámetros (como el tiempo o el espacio) sobre el cual se distribuye la señal.
*   **Lado derecho de la ecuación:** En modelos estructurales, son las variables que participan activamente en la determinación del valor de la variable dependiente.
*   **Padres (Parents):** En diagramas causales y redes bayesianas, son las variables que tienen una flecha directa apuntando hacia el "hijo" ($Y$).
*   **Variable de control / Intervención:** En el análisis de políticas, es la variable que un tomador de decisiones puede "fijar" o manipular deliberadamente (operador $do(x)$).
*   **Covariable:** Término usado frecuentemente cuando se busca ajustar o estandarizar el análisis para eliminar sesgos de confusión.

### Distinción Importante
Es fundamental notar que estos términos **no son siempre intercambiables**. Mientras que en la **regresión estadística** convencional el coeficiente solo describe una asociación predictiva basada en "ver" los datos, en un **modelo causal estructural**, la variable explicativa se considera un mecanismo que "produce" o "genera" el cambio en la variable dependiente. Por esta razón, Pearl advierte que llamar "explicativa" a una variable en una regresión simple puede ser engañoso si no se declaran explícitamente los supuestos causales subyacentes [11.5.2].

En las publicaciones especializadas, los términos **variable dependiente** y **variable explicativa** se utilizan para describir la relación en un modelo de regresión y se definen mediante los siguientes pares de términos equivalentes:

| Variable dependiente | Variable explicativa |
| :--- | :--- |
| Variable explicada | Variable independiente |
| Predictando | Predictor |
| **Regresando** | **Regresor** |
| Respuesta | Estímulo |
| Endógena | Exógena |
| Resultado | Covariable |
| Variable controlada | Variable de control |

### Detalles sobre el uso de esta terminología:
*   **Preferencia de uso:** Aunque existen múltiples formas de referirse a ellas, en los textos de econometría es común utilizar los términos **variable dependiente/variable explicativa** o los términos más neutrales **regresando y regresor**.
*   **Regresando y Regresor:** En la notación matricial, el vector columna que contiene las observaciones de la variable dependiente se denomina **regresando** ($y$), mientras que las columnas de la matriz de datos que contienen las variables independientes se denominan **regresores** ($X$).
*   **Contexto de los términos:**
    *   **Variables endógenas y exógenas:** Se utilizan frecuentemente en modelos de ecuaciones simultáneas; una variable exógena tiene su origen fuera del modelo, mientras que una endógena se determina dentro de él.
    *   **Variables de control:** Se refiere a variables que se incluyen en el modelo para aislar el efecto de la variable de interés principal (ceteris paribus).
    *   **Stochastic vs. Fixed:** En el análisis de regresión, se asume generalmente que el regresando es de naturaleza **aleatoria o estocástica** (tiene una distribución de probabilidad), mientras que los regresores suelen asumirse como valores **fijos** en muestreo repetido.
    
   
   
  Aquí tienes la información organizada para que la puedas copiar directamente en un editor de Markdown. He estructurado los datos de la **Encuesta Nacional Agropecuaria (ENA) 2023** y el procedimiento de regresión lineal simple mediante matrices.

---

# Ejercicio de Regresión Lineal: Sector Agropecuario Colombia

Este ejercicio utiliza datos oficiales del **DANE (Departamento Administrativo Nacional de Estadística)** provenientes de la **Encuesta Nacional Agropecuaria (ENA) 2023**.

## 1. Base de Datos (Markdown Table)

| Grupos de cultivos | Área cosechada () [ha] | Producción () [t] |
| --- | --- | --- |
| Agroindustriales | 1,931,298 | 40,034,252 |
| Cereales | 1,069,035 | 4,897,844 |
| Tubérculos y plátano | 451,544 | 6,124,169 |
| Frutales | 433,191 | 6,426,866 |
| Hortalizas, verduras y legumbres | 255,950 | 3,216,401 |

**Fuente:** DANE - Encuesta Nacional Agropecuaria (ENA) 2023, Cuadro 2.

---

## 2. Caracterización de los Datos

Para efectos del análisis econométrico, identificamos los tipos de datos de la siguiente manera:

* **Nivel de medición:** Datos de razón (tienen un cero absoluto y las distancias entre valores son comparables).
* **Variable Independiente ():** Área cosechada en hectáreas (ha). Es la variable explicativa que suponemos genera cambios en el resultado.
* **Variable Dependiente ():** Producción total en toneladas (t). Es la variable que queremos predecir o explicar.
* **Tipo de datos:** Datos de corte transversal (Cross-sectional data), ya que representan diferentes grupos de cultivos observados en el mismo punto del tiempo (año 2023).

---

## 3. Ejercicio de Regresión con Matrices

El objetivo es hallar el modelo .

### Paso 1: Configurar las Matrices

Basándonos en los datos anteriores (usando valores aproximados en miles para simplificar):

### Paso 2: Calcular las Sumatorias necesarias

Para llenar la matriz  y el vector , calculamos:

* 
* 
* 
* 
* 

### Paso 3: Resolver la Ecuación Matricial

La fórmula de Mínimos Cuadrados Ordinarios (MCO) es:


1. **Matriz :**


2. **Inversa :**
Se calcula mediante el determinante .
3. **Resultado final ():**
El vector resultante nos dará:

* ** (Intercepto):** El valor de producción esperado si el área fuera cero (técnico).
* ** (Pendiente):** El **rendimiento marginal**, es decir, cuántas toneladas adicionales se producen por cada hectárea extra cosechada en Colombia según la ENA 2023.

