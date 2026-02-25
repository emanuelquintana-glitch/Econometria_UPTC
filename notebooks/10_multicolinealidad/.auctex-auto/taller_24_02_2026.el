;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "taller_24_02_2026"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "spanish" "es-nodecimaldot") ("natbib" "") ("lmodern" "") ("microtype" "") ("siunitx" "") ("soul" "") ("colortbl" "") ("subcaption" "") ("inputenc" "utf8") ("fontenc" "T1") ("amsmath" "") ("amssymb" "") ("amsfonts" "") ("amsthm" "") ("mathtools" "") ("bm" "") ("geometry" "") ("booktabs" "") ("longtable" "") ("multirow" "") ("array" "") ("tabularx" "") ("graphicx" "") ("float" "") ("caption" "") ("xcolor" "table" "xcdraw") ("hyperref" "") ("enumitem" "") ("fancyhdr" "") ("titlesec" "") ("setspace" "") ("parskip" "") ("tcolorbox" "") ("listings" "") ("pgfplots" "") ("tikz" "") ("mdframed" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "fontenc"
    "amsmath"
    "amssymb"
    "amsfonts"
    "amsthm"
    "mathtools"
    "bm"
    "geometry"
    "booktabs"
    "longtable"
    "multirow"
    "array"
    "tabularx"
    "graphicx"
    "float"
    "caption"
    "xcolor"
    "hyperref"
    "enumitem"
    "fancyhdr"
    "titlesec"
    "setspace"
    "parskip"
    "tcolorbox"
    "listings"
    "pgfplots"
    "tikz"
    "mdframed")
   (TeX-add-symbols
    "bhat"
    "X"
    "y"
    "Xt"
    "E"
    "Var"
    "Cov"
    "YES"
    "NOO")
   (LaTeX-add-labels
    "tab:datos"
    "eq:modelo"
    "eq:mco"
    "tab:mco"
    "tab:reducidos"
    "eq:ovb"
    "tab:coh"))
 :latex)

