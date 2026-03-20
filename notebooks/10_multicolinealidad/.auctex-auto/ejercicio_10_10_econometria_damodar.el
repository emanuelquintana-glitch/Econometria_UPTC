;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_10_econometria_damodar"
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
    "Cov"
    "plim")
   (LaTeX-add-labels
    "eq:cubica"
    "tab:corr"
    "eq:colineal_exacta"
    "eq:no_lineal"
    "eq:corr_x_x2"
    "eq:VIF_X2"
    "eq:ortogonal"
    "eq:lineal"
    "eq:alpha2"
    "eq:alpha2_descomp"
    "eq:sesgo_total"
    "eq:b_X2"
    "eq:b_X3"
    "eq:sesgo_neto"
    "eq:error_reducido"
    "eq:var_error_red"
    "tab:comparacion"
    "eq:P0"
    "eq:P1"
    "eq:P2"
    "eq:P3"
    "eq:modelo_ortog"
    "eq:CMg"
    "eq:minimo_CMg")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

