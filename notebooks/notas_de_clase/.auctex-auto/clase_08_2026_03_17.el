;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "clase_08_2026_03_17"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("babel" "spanish") ("amsmath" "") ("amsfonts" "") ("amssymb" "") ("graphicx" "") ("geometry" "") ("tikz" "") ("pgfplots" "") ("booktabs" "") ("array" "") ("caption" "") ("subcaption" "") ("fancyhdr" "") ("setspace" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "babel"
    "amsmath"
    "amsfonts"
    "amssymb"
    "graphicx"
    "geometry"
    "tikz"
    "pgfplots"
    "booktabs"
    "array"
    "caption"
    "subcaption"
    "fancyhdr"
    "setspace")
   (LaTeX-add-labels
    "fig:residuos_ar1"
    "fig:acf"
    "fig:durbin"
    "tab:comparacion"
    "fig:patrones"
    "fig:especificacion"
    "fig:intervalos")
   (LaTeX-add-bibitems
    "wooldridge"
    "gujarati"))
 :latex)

