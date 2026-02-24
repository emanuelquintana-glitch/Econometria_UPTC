;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "teoria"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper" "11pt" "letterpaper" "10pt" "twocolumn")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("libertine" "") ("newtxmath" "libertine") ("tgtermes" "") ("tgheros" "") ("mathdesign" "expert") ("newspaper" "") ("fontspec" "") ("charter" "") ("fourier" "") ("microtype" "") ("hyperref" "") ("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish" "" "es-tabla") ("geometry" "") ("xcolor" "") ("titlesec" "") ("fancyhdr" "") ("titling" "") ("lettrine" "") ("caption" "") ("booktabs" "") ("array" "") ("colortbl" "") ("amsmath" "") ("amsfonts" "") ("amssymb" "") ("amsthm" "") ("mathtools" "") ("bm" "") ("tcolorbox" "") ("enumitem" "") ("multicol" "") ("mdframed" "") ("ragged2e" "")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "inputenc"
    "fontenc"
    "babel"
    "geometry"
    "xcolor"
    "titlesec"
    "fancyhdr"
    "titling"
    "lettrine"
    "caption"
    "booktabs"
    "array"
    "colortbl"
    "amsmath"
    "amsfonts"
    "amssymb"
    "amsthm"
    "mathtools"
    "bm"
    "tcolorbox"
    "enumitem"
    "multicol"
    "mdframed"
    "ragged2e")
   (TeX-add-symbols
    "rg"
    "tr"
    "plim"
    "Var"
    "Cov"
    "E"
    "RSS"
    "ESS"
    "TSS"
    "sxdos"
    "sxtres"
    "sxdxt"
    "sxdy"
    "sxty")
   (LaTeX-add-labels
    "eq:sistema2"
    "eq:momentos"
    "eq:reducido"
    "eq:familia")
   (LaTeX-add-amsthm-newtheorems
    "prop"
    "lema"
    "dem")
   (LaTeX-add-xcolor-definecolors
    "nytblack"
    "harvard"
    "voguegold"
    "vgdark"
    "lightgray"
    "midgray"
    "accentblue"
    "softblue"
    "softgold"
    "alertred"
    "softred"
    "softgreen"
    "darkgreen")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("definicion" "1" "[" "")
    '("teorema" "1" "[" "")
    '("resultado" "1" "[" "")
    '("alerta" "1" "[" "")
    '("corolario" "1" "[" "")
    '("enunciado" "1" "[" ""))
   (LaTeX-add-tcolorbox-tcbuselibraries
    "breakable,skins,theorems"))
 :latex)

