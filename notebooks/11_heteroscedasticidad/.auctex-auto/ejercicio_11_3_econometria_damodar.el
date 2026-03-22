;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_3_econometria_damodar"
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
    "plim")
   (LaTeX-add-labels
    "eq:modelo1"
    "eq:modelo2"
    "eq:SCR"
    "eq:lineal_param"
    "eq:deriv_lineal"
    "eq:f_modelo1"
    "eq:df_db1"
    "eq:df_db2"
    "eq:ec_normales"
    "eq:cuadrado"
    "eq:MCNL"
    "eq:var_MCNL"
    "eq:F_matrix"
    "eq:taylor"
    "eq:Ytilde"
    "eq:Xtilde"
    "eq:GN_update"
    "eq:GN_X1"
    "eq:GN_X2"
    "eq:NR"
    "eq:Marquardt"
    "eq:loglik"
    "tab:metodos"
    "eq:FOC1"
    "eq:FOC2"
    "eq:FOC1_simp"
    "eq:FOC2_simp")
   (LaTeX-add-environments
    "prop"
    "obs"))
 :latex)

