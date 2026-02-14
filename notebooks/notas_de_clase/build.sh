#!/bin/bash
echo "Iniciando compilación rigurosa..."
pdflatex -interaction=nonstopmode notas_tecnicas.tex
biber notas_tecnicas
pdflatex -interaction=nonstopmode notas_tecnicas.tex
pdflatex -interaction=nonstopmode notas_tecnicas.tex
echo "Proceso terminado. PDF generado."
