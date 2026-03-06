;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "cheatsheet_multicolinealidad"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("extarticle" "6pt" "landscape")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "landscape" "margin=0.3in" "top=0.4in" "bottom=0.3in") ("multicol" "") ("xcolor" "") ("titlesec" "") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("mathtools" "") ("microtype" "") ("booktabs" "") ("enumitem" "") ("tikz" "") ("tcolorbox" "") ("array" "") ("tabularx" "") ("graphicx" "") ("tgtermes" "") ("helvet" "scaled=0.85")))
   (TeX-run-style-hooks
    "latex2e"
    "extarticle"
    "extarticle10"
    "geometry"
    "multicol"
    "xcolor"
    "titlesec"
    "amsmath"
    "amssymb"
    "amsthm"
    "mathtools"
    "microtype"
    "booktabs"
    "enumitem"
    "tikz"
    "tcolorbox"
    "array"
    "tabularx"
    "graphicx"
    "tgtermes"
    "helvet")
   (TeX-add-symbols
    "sectionline"
    "E"
    "Var"
    "Cov"
    "FIV"
    "TOL"
    "Xmat"
    "Ymat"
    "betahat"
    "columnseprulecolor")
   (LaTeX-add-xcolor-definecolors
    "DeepBlack"
    "GoldLeaf"
    "MITRed"
    "UPTCAzul"
    "BoxBg"
    "FormulaBox"
    "WarningBox")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("formulabox" "" "" "")
    '("warningbox" "" "" "")))
 :latex)

