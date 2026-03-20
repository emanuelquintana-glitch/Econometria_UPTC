;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_5_econometria_damodar"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish") ("geometry" "") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("booktabs" "") ("array" "") ("microtype" "") ("setspace" "") ("parskip" "") ("titlesec" "") ("fancyhdr" "") ("enumitem" "") ("bm" "") ("mathtools" "") ("tcolorbox" "") ("pgfplots" "") ("tikz" "") ("hyperref" "")))
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
    "pgfplots"
    "tikz"
    "hyperref")
   (TeX-add-symbols
    "E"
    "Var"
    "Cov"
    "Corr")
   (LaTeX-add-labels
    "eq:modelo"
    "eq:autocorr"
    "eq:matriz_R"
    "eq:VIF_rho"
    "tab:VIF"
    "eq:var_vif"
    "eq:koyck_supuesto"
    "eq:koyck_infinito"
    "eq:koyck_rezagado"
    "eq:koyck_resta1"
    "eq:cancelacion"
    "eq:koyck_final"
    "eq:mult_LP"
    "eq:almon_supuesto"
    "eq:almon_derivacion"
    "eq:Z0"
    "eq:Z1"
    "eq:Z2"
    "eq:almon_final"
    "eq:rec0"
    "eq:rec1"
    "eq:rec2"
    "eq:rec3"
    "eq:rec4"
    "eq:almon_P"
    "eq:diferencias"
    "eq:corr_diff"
    "eq:mce"
    "eq:sesgo_omision"
    "tab:comparacion"
    "eq:kA"
    "eq:kB")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

