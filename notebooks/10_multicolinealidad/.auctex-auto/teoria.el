;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "teoria"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish" "") ("amsmath" "") ("amsfonts" "") ("amssymb" "") ("amsthm" "") ("mathtools" "") ("bm" "") ("geometry" "") ("booktabs" "") ("array" "") ("colortbl" "") ("xcolor" "") ("fancyhdr" "") ("titlesec" "") ("tcolorbox" "") ("enumitem" "") ("hyperref" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "fontenc"
    "babel"
    "amsmath"
    "amsfonts"
    "amssymb"
    "amsthm"
    "mathtools"
    "bm"
    "geometry"
    "booktabs"
    "array"
    "colortbl"
    "xcolor"
    "fancyhdr"
    "titlesec"
    "tcolorbox"
    "enumitem"
    "hyperref")
   (TeX-add-symbols
    "Var"
    "Cov"
    "E"
    "sxdos"
    "sxtres"
    "sxdxt"
    "sxdy"
    "sxty")
   (LaTeX-add-labels
    "eq:mco"
    "eq:normales"
    "eq:sistema2"
    "eq:momentos"
    "eq:original"
    "eq:reducido"
    "eq:fe1"
    "eq:fe2"
    "eq:ajustado"
    "eq:ce1"
    "eq:ce2"
    "eq:familia")
   (LaTeX-add-environments
    "prop"
    "lema"))
 :latex)

