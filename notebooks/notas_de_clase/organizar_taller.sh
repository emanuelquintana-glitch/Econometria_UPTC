#!/usr/bin/env bash
# ============================================================
# organizar_taller.sh
# Crea la carpeta taller_autocorrelacion/ y mueve todos los
# archivos del taller a ella.
# Ejecutar desde: notebooks/notas_de_clase/
# ============================================================

set -e

DEST="taller_autocorrelacion"
mkdir -p "$DEST"

# Archivos principales
mv taller_autocorrelacion.do   "$DEST/" 2>/dev/null || true
mv taller_autocorrelacion.tex  "$DEST/" 2>/dev/null || true
mv taller_autocorrelacion.log  "$DEST/" 2>/dev/null || true

# Artefactos LaTeX
for ext in aux out pdf toc synctex.gz; do
    mv "taller_autocorrelacion.$ext" "$DEST/" 2>/dev/null || true
done

# Gráficos generados por Stata
mv graf_residuos_tiempo.png "$DEST/" 2>/dev/null || true
mv graf_residuos_lag.png    "$DEST/" 2>/dev/null || true

echo "Listo. Contenido de $DEST/:"
ls "$DEST/"
