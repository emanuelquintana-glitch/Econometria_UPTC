;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_4_econometria_damodar"
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
    '("Rd" 2)
    '("rp" 2)
    "X"
    "y"
    "bhat"
    "lam"
    "Cov"
    "Var"
    "Corr"
    "plim"
    "tr")
   (LaTeX-add-labels
    "eq:relacion"
    "eq:pearson"
    "eq:resid_j"
    "eq:resid_k"
    "eq:parcial_def"
    "eq:parcial_formula"
    "eq:reg_gen"
    "eq:R2_def"
    "eq:R2_parciales"
    "eq:despeje_X1"
    "eq:medias"
    "eq:desviaciones"
    "eq:reg_exacta_1"
    "eq:R2_1_23"
    "eq:despeje_X2"
    "eq:R2_2_13"
    "eq:despeje_X3"
    "eq:R2_3_12"
    "eq:rjk"
    "eq:x1_desv"
    "eq:sumas"
    "eq:S11"
    "eq:S12"
    "eq:S13"
    "eq:r12_expr"
    "eq:r13_expr"
    "eq:r23"
    "eq:r12_3_formula"
    "lema1"
    "eq:numerador"
    "eq:1mr13"
    "eq:det_parcial"
    "eq:1mr13_final"
    "eq:denom"
    "eq:r12_3_resultado"
    "eq:r13_2_formula"
    "eq:num_r13_2"
    "eq:1mr12"
    "eq:denom_r13_2"
    "eq:r13_2_resultado"
    "eq:x2_desv"
    "eq:r23_1_formula"
    "eq:r23_1_resultado"
    "eq:nulo"
    "eq:det_cero"
    "eq:beta_mco"
    "eq:var_vif"
    "eq:var_inf"
    "tab:resumen"
    "eq:fwl"
    "eq:var_vif_general"
    "eq:kappa")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

