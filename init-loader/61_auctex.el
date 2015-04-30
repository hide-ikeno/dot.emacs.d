;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_auctex.el
;;; Description: Customize AUCTeX mode
;;;
;;; Code:
;;;

(el-get 'sync '(auctex company-auctex))

;;;=============================================================================
;;; AucTeX
;;;=============================================================================
(use-package tex-jp
  :mode ("\\.tex\\'" . auctex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :config
  (setq TeX-engine-alist
        '((pdfuptex "pdfupTeX"
                    "/usr/texbin/ptex2pdf -u -e -ot '%S %(mode)'"
                    "/usr/texbin/ptex2pdf -u -l -ot '%S %(mode)'"
                    "euptex")))
  (setq japanese-TeX-engine-default 'pdfuptex)

  (setq TeX-view-program-selection '((output-dvi "displayline")
                                     (output-pdf "displayline")))

  (setq japanese-LaTeX-default-style "jsarticle")
  (dolist (command '("pTeX" "pLaTeX" "pBibTeX" "jTeX" "jLaTeX" "jBibTeX" "Mendex"))
    (delq (assoc command TeX-command-list) TeX-command-list))

  (setq preview-image-type 'dvipng)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook
            (function (lambda ()
                        (add-to-list 'TeX-command-list
                                     '("Latexmk"
                                       "/usr/texbin/latexmk %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-pdfupLaTeX"
                                       "/usr/texbin/latexmk -e '$latex=q/uplatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/mendex %%O -U -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfupLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-pdfupLaTeX2"
                                       "/usr/texbin/latexmk -e '$latex=q/uplatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/mendex %%O -U -o %%D %%S/' -e '$dvips=q/dvips %%O -z -f %%S | convbkmk -u > %%D/' -e '$ps2pdf=q/ps2pdf %%O %%S %%D/' -norc -gg -pdfps %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfupLaTeX2"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-pdfLaTeX"
                                       "/usr/texbin/latexmk -e '$pdflatex=q/pdflatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-LuaLaTeX"
                                       "/usr/texbin/latexmk -e '$pdflatex=q/lualatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtexu %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-LuaJITLaTeX"
                                       "/usr/texbin/latexmk -e '$pdflatex=q/luajitlatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtexu %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaJITLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-XeLaTeX"
                                       "/usr/texbin/latexmk -e '$pdflatex=q/xelatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtexu %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-XeLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("displayline"
                                       "/Applications/Skim.app/Contents/SharedSupport/displayline %n %s.pdf \"%b\""
                                       TeX-run-discard-or-function t t :help "Forward search with Skim"))
                        (add-to-list 'TeX-command-list
                                     '("Skim"
                                       "/usr/bin/open -a Skim.app %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Skim"))
                        (add-to-list 'TeX-command-list
                                     '("Preview"
                                       "/usr/bin/open -a Preview.app %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Preview"))
                        (add-to-list 'TeX-command-list
                                     '("TeXShop"
                                       "/usr/bin/open -a TeXShop.app %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run TeXShop"))
                        (add-to-list 'TeX-command-list
                                     '("TeXworks"
                                       "/usr/texbin/synctex view -i \"%n:0:%b\" -o %s.pdf -x \"/Applications/TeXworks.app/Contents/MacOS/TeXworks --position=%%{page+1} %%{output}\""
                                       TeX-run-discard-or-function t t :help "Run TeXworks"))
                        (add-to-list 'TeX-command-list
                                     '("TeXstudio"
                                       "/usr/texbin/synctex view -i \"%n:0:%b\" -o %s.pdf -x \"/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only --page %%{page+1} %%{output}\""
                                       TeX-run-discard-or-function t t :help "Run TeXstudio"))
                        (add-to-list 'TeX-command-list
                                     '("Firefox"
                                       "/usr/bin/open -a Firefox.app %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Mozilla Firefox"))
                        (add-to-list 'TeX-command-list
                                     '("AdobeReader"
                                       "/usr/bin/open -a \"Adobe Reader.app\" %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Adobe Reader")))))

  
  ;;
  ;; kinsoku.el
  ;;
  (setq kinsoku-limit 10)
  )

;;;
;;; RefTeX with AUCTeX
;;;
(use-package reftex
  :commands (turn-on-reftex)
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t))
  )
;;;
;;; BibTeX
;;;
(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120))))
  )

;;;=============================================================================
;;; company-auctex -- company backend for AucTeX
;;;=============================================================================
(use-package company-auctex)
