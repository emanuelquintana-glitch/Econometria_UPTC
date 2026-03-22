;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "ejercicio_11_5_econometria_damodar"
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
    "sw"
    "swx"
    "swy"
    "swxy"
    "swxx"
    "Ybar"
    "Xbar"
    "ystar"
    "xstar")
   (LaTeX-add-labels
    "eq:modelo"
    "eq:beta2_original"
    "eq:var_original"
    "eq:beta2_nuevo"
    "eq:var_nuevo"
    "eq:medias_pond"
    "eq:desviaciones"
    "lema1"
    "lema2"
    "lema3"
    "eq:lema3_resultado"
    "eq:num_paso1"
    "eq:num_resultado"
    "eq:num_final"
    "eq:den_final"
    "eq:cociente"
    "eq:beta2_demostrado"
    "eq:var_punto_partida"
    "eq:lema3_rep"
    "eq:despeje"
    "eq:var_final"
    "eq:var_demostrada"
    "eq:eficiencia"
    "eq:prop1"
    "eq:prop2")
   (LaTeX-add-environments
    "prop"
    "lema"
    "obs"))
 :latex)

