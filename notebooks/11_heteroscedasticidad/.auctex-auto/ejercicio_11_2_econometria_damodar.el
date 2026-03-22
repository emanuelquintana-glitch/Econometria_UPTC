;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_2_econometria_damodar"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish") ("geometry" "") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("booktabs" "") ("array" "") ("microtype" "") ("setspace" "") ("parskip" "") ("titlesec" "") ("fancyhdr" "") ("enumitem" "") ("bm" "") ("mathtools" "") ("tcolorbox" "") ("hyperref" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "fontenc"
    "babel"
    "geometry"
    "amsmath"
    "amssymb"
    "amsthm"
    "booktabs"
    "array"
    "microtype"
    "setspace"
    "parskip"
    "titlesec"
    "fancyhdr"
    "enumitem"
    "bm"
    "mathtools"
    "tcolorbox"
    "hyperref")
   (TeX-add-symbols
    "E"
    "Var"
    "Cov")
   (LaTeX-add-labels
    "eq:reg1"
    "eq:reg2"
    "eq:modelo1"
    "eq:modelo2"
    "eq:division"
    "eq:transformado"
    "eq:supuesto_heterosc"
    "eq:homosc_vi"
    "eq:rel1"
    "eq:rel2"
    "eq:R2_def"
    "eq:dif_R2"
    "tab:comparacion"
    "eq:MCP"
    "eq:MCP_equiv"
    "eq:MCO_transformado")
   (LaTeX-add-environments
    "prop"
    "obs"))
 :latex)

