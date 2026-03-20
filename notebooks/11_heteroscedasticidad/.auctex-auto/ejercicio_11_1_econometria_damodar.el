;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_1_econometria_damodar"
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
    "eq:modelo"
    "eq:heterosc"
    "eq:Omega"
    "eq:beta_descomp"
    "eq:insesgado"
    "eq:var_heterosc"
    "eq:MCG_eficiente"
    "eq:sigma2_conv"
    "eq:var_conv"
    "eq:White_var"
    "eq:var_verdadera"
    "eq:var_conv_esp"
    "eq:white_reg"
    "eq:white_stat"
    "eq:verdadero"
    "eq:reducido"
    "eq:verdadero_g"
    "eq:reducido_g"
    "eq:var_vi"
    "tab:resumen"
    "eq:E_sigma2"
    "eq:E_sigma2_homosc"
    "eq:white_consistent")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

