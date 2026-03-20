;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_9_econometria_damodar"
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
    "eq:cobb_douglas"
    "eq:cd_nivel"
    "eq:proporc"
    "eq:corr_LK"
    "eq:VIF_LK"
    "eq:t_vif"
    "eq:produccion"
    "eq:reducido"
    "eq:b_LK"
    "eq:alpha3"
    "eq:alpha3_descomp"
    "eq:sesgo"
    "eq:b_LK_corr"
    "eq:sesgo_positivo"
    "eq:sobreestimacion"
    "eq:sesgo_num"
    "eq:alpha3_num"
    "eq:var_error_reducido"
    "eq:rcs")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

