;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_8_econometria_damodar"
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
    "eq:multiple"
    "eq:ortogonal"
    "eq:simple1"
    "eq:simple2"
    "eq:normal1"
    "eq:normal2"
    "eq:beta2_general"
    "eq:beta3_general"
    "eq:beta2_ortogonal"
    "eq:alpha2"
    "eq:igual_beta2"
    "eq:beta3_ortogonal"
    "eq:igual_beta3"
    "eq:desacoplado1"
    "eq:desacoplado2"
    "eq:beta1"
    "eq:alpha1"
    "eq:gamma1"
    "eq:beta1_vs_alpha1"
    "eq:beta1_vs_gamma1"
    "eq:relacion_interceptos"
    "eq:var_beta2"
    "eq:error_simple"
    "eq:var_error_simple"
    "eq:desigualdad_var"
    "eq:var_alpha2"
    "eq:diferencia_var"
    "eq:ineq_var"
    "eq:var_error_simple2"
    "eq:ineq_var_gamma"
    "tab:resumen"
    "eq:XpX"
    "eq:S"
    "eq:S_diag"
    "eq:Sinv"
    "eq:betahat_diag"
    "eq:varmat"
    "eq:exceso_relativo")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

