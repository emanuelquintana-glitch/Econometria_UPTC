;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_7_econometria_damodar"
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
    "Corr"
    "plim")
   (LaTeX-add-labels
    "eq:modelo"
    "eq:det"
    "eq:trend2"
    "eq:trend3"
    "eq:corr_trend"
    "eq:corr_trend_lim"
    "eq:rw2"
    "eq:rw3"
    "eq:rw_expand"
    "eq:AR1"
    "eq:FAC"
    "eq:corr_factor"
    "eq:XpX_elem"
    "eq:factor2"
    "eq:factor3"
    "eq:corr_factor_expr"
    "eq:corr_factor_lim"
    "eq:var_vif"
    "eq:t_stat"
    "eq:beta_error"
    "eq:VIF_criterio"
    "eq:kappa"
    "eq:t_espurio"
    "eq:cond_bound")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

