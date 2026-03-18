;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "notas_clase_08_2026_03_17"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("lmodern" "") ("cancel" "") ("longtable" "") ("cleveref" "") ("inputenc" "utf8") ("fontenc" "T1") ("babel" "spanish" "es-nodecimaldot" "es-lcroman") ("palatino" "") ("mathpazo" "") ("microtype" "") ("setspace" "") ("geometry" "top=2.5cm" "bottom=2.5cm" "left=3.0cm" "right=2.5cm" "headheight=14pt" "top=3.0cm" "left=3.5cm" "headheight=16pt" "top=2.8cm" "bottom=2.8cm" "left=3.2cm" "right=3.2cm") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("mathtools" "") ("bm" "") ("tikz" "") ("pgfplots" "") ("graphicx" "") ("float" "") ("booktabs" "") ("array" "") ("tabularx" "") ("multirow" "") ("xcolor" "") ("tcolorbox" "") ("fancyhdr" "") ("titlesec" "") ("enumitem" "") ("abstract" "") ("hyperref" "colorlinks=true" "linkcolor=NavyBlue" "citecolor=NavyBlue" "urlcolor=NavyBlue" "linkcolor=UPTCdark" "urlcolor=SteelBlue" "pdftitle={Autocorrelacion - Econometria UPTC}" "pdfauthor={Emanuel Quintana Silva}" "colorlinks=false" "pdfborder={0 0 0}")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "inputenc"
    "fontenc"
    "babel"
    "palatino"
    "mathpazo"
    "microtype"
    "setspace"
    "geometry"
    "amsmath"
    "amssymb"
    "amsthm"
    "mathtools"
    "bm"
    "tikz"
    "pgfplots"
    "graphicx"
    "float"
    "booktabs"
    "array"
    "tabularx"
    "multirow"
    "xcolor"
    "tcolorbox"
    "fancyhdr"
    "titlesec"
    "enumitem"
    "abstract"
    "hyperref")
   (LaTeX-add-xcolor-definecolors
    "Black"
    "VDark"
    "Dark"
    "Mid"
    "Light"
    "VLight"
    "OffWhite")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("definicion" "1" "" "")
    '("teorema" "1" "" "")
    '("nota" "1" "" "")
    '("formulabox" "1" "" ""))
   (LaTeX-add-tcolorbox-tcbuselibraries
    "skins, breakable"))
 :latex)

