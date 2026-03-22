;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_6_econometria_damodar"
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
    "Var")
   (LaTeX-add-labels
    "eq:original"
    "eq:heterosc"
    "eq:transformado"
    "eq:result1"
    "eq:result2"
    "eq:supuesto_var"
    "eq:desv_estandar"
    "eq:derivacion"
    "eq:var_vt"
    "tab:comparacion"
    "eq:R2"
    "eq:SCT1"
    "eq:SCT2"
    "tab:sintesis"
    "eq:homosc_vt")
   (LaTeX-add-environments
    "prop"
    "obs"))
 :latex)

