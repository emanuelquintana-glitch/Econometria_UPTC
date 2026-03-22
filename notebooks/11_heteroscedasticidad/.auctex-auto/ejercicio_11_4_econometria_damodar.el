;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_4_econometria_damodar"
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
    "Var")
   (LaTeX-add-labels
    "eq:nivel"
    "eq:log"
    "eq:log_v2"
    "eq:cond_a"
    "eq:lognormal_cond"
    "eq:fdp_lognormal"
    "eq:momentos_lognormal"
    "eq:media_u"
    "eq:mom2_u"
    "eq:var_u"
    "eq:media_u_no_uno"
    "eq:Jensen"
    "eq:Jensen_aplicado"
    "eq:Jensen_resultado"
    "eq:mu_condicion"
    "eq:media_lnu_negativa"
    "eq:problema"
    "eq:vi_def"
    "eq:vi_media_cero"
    "eq:modelo_corregido"
    "eq:beta1_recuperado"
    "eq:w_estimado"
    "eq:beta1_corregido"
    "tab:resumen"
    "eq:taylor_ln"
    "eq:jensen_taylor"
    "eq:resultado_exacto"
    "eq:predictor_Goldberger")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

