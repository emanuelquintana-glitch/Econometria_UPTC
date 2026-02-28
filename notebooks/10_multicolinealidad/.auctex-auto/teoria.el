;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "teoria"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper" "11pt" "letterpaper" "10pt" "twocolumn" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("libertine" "") ("newtxmath" "libertine") ("tgtermes" "") ("tgheros" "") ("mathdesign" "expert") ("newspaper" "") ("fontspec" "") ("charter" "") ("fourier" "") ("microtype" "") ("hyperref" "") ("fontenc" "T1") ("babel" "spanish" "" "es-tabla") ("geometry" "") ("xcolor" "") ("titlesec" "") ("fancyhdr" "") ("titling" "") ("lettrine" "") ("caption" "") ("booktabs" "") ("array" "") ("colortbl" "") ("amsfonts" "") ("amssymb" "") ("amsthm" "") ("mathtools" "") ("bm" "") ("tcolorbox" "") ("enumitem" "") ("multicol" "") ("mdframed" "") ("ragged2e" "") ("inputenc" "utf8") ("amsmath" "")))
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
    "art10"
    "inputenc"
    "amsmath"))
 :latex)

