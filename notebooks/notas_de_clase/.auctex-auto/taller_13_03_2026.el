;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "taller_13_03_2026"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish" "") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("booktabs" "") ("array" "") ("geometry" "") ("graphicx" "" "draft") ("hyperref" "") ("xcolor" "") ("enumitem" "") ("fancyhdr" "") ("titlesec" "") ("tcolorbox" "") ("multirow" "") ("float" "") ("subcaption" "") ("pgfplots" "") ("tikz" "")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "fontenc"
    "babel"
    "amsmath"
    "amssymb"
    "amsthm"
    "booktabs"
    "array"
    "geometry"
    "graphicx"
    "hyperref"
    "xcolor"
    "enumitem"
    "fancyhdr"
    "titlesec"
    "tcolorbox"
    "multirow"
    "float"
    "subcaption"
    "pgfplots"
    "tikz")
   (TeX-add-symbols
    "leyendadist")
   (LaTeX-add-xcolor-definecolors
    "azuloscuro"
    "grisclaro"
    "verdeclaro"
    "rojoclaro"
    "zonarechazo"
    "zonaaceptacion"
    "colorvc5"
    "colorvc1"
    "colortc")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("cajaresultado" "1" "[" "")
    '("cajaconclucion" "1" "[" "")
    '("cajacomando" "1" "[" "")
    '("cajarechazo" "1" "[" ""))
   (LaTeX-add-tcolorbox-tcbuselibraries
    "skins,breakable"))
 :latex)

