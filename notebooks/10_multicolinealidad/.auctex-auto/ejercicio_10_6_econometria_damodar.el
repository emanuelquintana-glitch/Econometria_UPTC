;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_6_econometria_damodar"
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
    "plim"
    "bhat")
   (LaTeX-add-labels
    "eq:completo"
    "tab:completo"
    "eq:reducido"
    "tab:reducido"
    "eq:VIF"
    "eq:var_beta2"
    "eq:razon_ee"
    "eq:verdadero"
    "eq:b12"
    "eq:b32"
    "eq:sesgo_derivacion"
    "eq:sesgo"
    "eq:valores1"
    "eq:valores2"
    "eq:valores3"
    "eq:valores4"
    "eq:sesgo_numerico"
    "eq:verificacion"
    "eq:paradoja"
    "eq:gral_completo"
    "eq:MCO_red"
    "eq:sesgo_gral"
    "eq:esperanza_sesgo")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

