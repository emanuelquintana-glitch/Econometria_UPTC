;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_11_econometria_damodar"
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
    "eq:F_increm"
    "eq:SCE"
    "eq:monotonia_SCE"
    "eq:delta_SCE_cond"
    "eq:delta_SCE_cond2"
    "eq:bonferroni"
    "eq:tipo1_10"
    "eq:t_sesgado"
    "eq:sesgo_omision"
    "eq:t_VIF"
    "eq:sensibilidad"
    "eq:AIC"
    "eq:BIC"
    "eq:Ridge"
    "eq:LASSO"
    "tab:comparacion"
    "eq:no_error"
    "eq:alpha_exp"
    "eq:bonferroni_corr"
    "eq:delta_R2")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

