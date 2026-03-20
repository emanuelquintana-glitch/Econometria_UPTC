;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_12_econometria_damodar"
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
    "verdadero"
    "falso"
    "incierto")
   (LaTeX-add-labels
    "eq:modelo"
    "eq:det_cero"
    "eq:var_inf"
    "eq:t_vif"
    "eq:VIF_R2"
    "eq:var_VIF"
    "eq:det_S"
    "eq:var_pred"
    "eq:var_vif_def"
    "eq:VIF_geq1"
    "eq:TOL"
    "eq:TOL_VIF"
    "eq:F_global"
    "eq:t_individual"
    "eq:paradoja"
    "eq:var_beta3"
    "eq:var_inf_x3"
    "tab:resumen")
   (LaTeX-add-environments
    "prop"
    "obs"))
 :latex)

