# --- Regresión Lineal ENA 2023 (DANE) ---

# Carga de librerías profesionales
library(ggplot2)
library(scales)
library(ggrepel) # Para que las etiquetas no se amontonen

# 1. Datos reales de la imagen (DANE ENA 2023)
datos_ena <- data.frame(
  grupo = c("Agroindustriales", "Cereales", "Tubérculos y Plátano",
            "Frutales", "Hortalizas y Legumbres"),
  area_ha = c(1931298, 1069035, 451544, 433191, 255950),
  prod_ton = c(40034252, 4897844, 6124169, 6426866, 3216401)
)

# 2. Creación del Gráfico de Alto Nivel
grafico <- ggplot(datos_ena, aes(x = area_ha, y = prod_ton)) +
  # Línea de regresión con intervalo de confianza sombreado
  geom_smooth(method = "lm", formula = y ~ x, color = "#2c3e50", fill = "#bdc3c7", alpha = 0.2) +
  # Puntos con borde y color sólido
  geom_point(color = "#27ae60", size = 5, alpha = 0.8) +
  # Etiquetas inteligentes que no se solapan
  geom_text_repel(aes(label = grupo), fontface = "bold", size = 4) +
  # Formateo de ejes para legibilidad (millones y miles)
  scale_x_continuous(labels = label_number(suffix = " ha", big.mark = ".")) +
  scale_y_continuous(labels = label_number(suffix = " t", big.mark = ".")) +
  # Etiquetas profesionales
  labs(
    title = "Análisis de Productividad Agrícola en Colombia",
    subtitle = "Modelo de Regresión Lineal (MCO): Área Cosechada vs. Producción Total (2023)",
    x = "Área Cosechada (Hectáreas)",
    y = "Producción Total (Toneladas)",
    caption = "Fuente: Elaboración propia basada en DANE - ENA 2023"
  ) +
  # Tema minimalista estilo 'The Economist' o 'Nature'
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18, color = "#2c3e50"),
    plot.subtitle = element_text(size = 12, color = "#7f8c8d"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

# 3. Guardar en alta resolución para LaTeX/Emacs
ggsave("grafico_pro_dane.png", plot = grafico, width = 10, height = 7, dpi = 300)

print("Gráfico generado con éxito: grafico_pro_dane.png")
