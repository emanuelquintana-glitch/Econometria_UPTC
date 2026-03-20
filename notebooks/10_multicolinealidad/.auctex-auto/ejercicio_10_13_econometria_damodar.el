;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_10_13_econometria_damodar"
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
    "Cov")
   (LaTeX-add-labels
    "eq:modelo"
    "eq:ortog"
    "eq:normales"
    "eq:normales_cero"
    "eq:betas_cero"
    "eq:R2_escalar"
    "eq:R2_cero"
    "eq:MCO_mat"
    "eq:ortog_mat"
    "eq:pred_media")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

