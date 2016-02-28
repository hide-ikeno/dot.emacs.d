;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_auctex.el
;;; Description: Customize AUCTeX mode
;;;
;;; Code:
;;;
;;;=============================================================================
;;; AucTeX
;;;=============================================================================
(el-get-bundle auctex)

(use-package tex-jp
  :defines
  TeX-engine-alist
  TeX-view-program-selection
  TeX-command-list
  TeX-source-correlate-method
  TeX-source-correlate-start-server
  japanese-TeX-engine-default
  japanese-LaTeX-default-style
  preview-image-type
  reftex-plug-into-AUCTeX
  kinsoku-limit
  :config
  (setq TeX-engine-alist
        '((pdfuptex "pdfupTeX"
                    "/Library/TeX/texbin/ptex2pdf -u -e -ot '%S %(mode)'"
                    "/Library/TeX/texbin/ptex2pdf -u -l -ot '%S %(mode)'"
                    "euptex")))
  (setq japanese-TeX-engine-default 'pdfuptex)
  ;; (setq japanese-TeX-engine-default 'luatex)
  ;; (setq japanese-TeX-engine-default 'xetex)
  (setq TeX-view-program-selection '((output-dvi "displayline")
                                     (output-pdf "displayline")))
  ;;(setq TeX-view-program-selection '((output-dvi "Skim")
  ;;                                   (output-pdf "Skim")))
  (setq japanese-LaTeX-default-style "bxjsarticle")
  ;; (setq japanese-LaTeX-default-style "ltjsarticle")
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
                                       "/Library/TeX/texbin/latexmk %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-upLaTeX-pdfdvi"
                                       "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-upLaTeX-pdfdvi"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-upLaTeX-pdfps"
                                       "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvips=q/dvips %%O -z -f %%S | convbkmk -u > %%D/' -e '$ps2pdf=q/ps2pdf %%O %%S %%D/' -norc -gg -pdfps %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-upLaTeX-pdfps"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-pdfLaTeX"
                                       "/Library/TeX/texbin/latexmk -e '$pdflatex=q/pdflatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-LuaLaTeX"
                                       "/Library/TeX/texbin/latexmk -e '$pdflatex=q/lualatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-LuaJITLaTeX"
                                       "/Library/TeX/texbin/latexmk -e '$pdflatex=q/luajitlatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaJITLaTeX"))
                        (add-to-list 'TeX-command-list
                                     '("Latexmk-XeLaTeX"
                                       "/Library/TeX/texbin/latexmk -e '$pdflatex=q/xelatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
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
                                       "/Library/TeX/texbin/synctex view -i \"%n:0:%b\" -o %s.pdf -x \"/Applications/TeXworks.app/Contents/MacOS/TeXworks --position=%%{page+1} %%{output}\""
                                       TeX-run-discard-or-function t t :help "Run TeXworks"))
                        (add-to-list 'TeX-command-list
                                     '("TeXstudio"
                                       "/Library/TeX/texbin/synctex view -i \"%n:0:%b\" -o %s.pdf -x \"/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only --page %%{page+1} %%{output}\""
                                       TeX-run-discard-or-function t t :help "Run TeXstudio"))
                        (add-to-list 'TeX-command-list
                                     '("Firefox"
                                       "/usr/bin/open -a Firefox.app %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Mozilla Firefox"))
                        (add-to-list 'TeX-command-list
                                     '("acroread"
                                       "/usr/bin/open -a \"Adobe Acrobat Reader DC.app\" %s.pdf"
                                       TeX-run-discard-or-function t t :help "Run Adobe Acrobat Reader DC")))))

  ;;
  ;; RefTeX with AUCTeX
  ;;
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  ;;
  ;; kinsoku.el
  ;;
  (setq kinsoku-limit 10)
  )

;;;=============================================================================
;;; Auto completion for AucTeX using company-mode
;;;=============================================================================
(el-get-bundle company-auctex)
(use-package company-auctex
  :config
  ;; Note: require company-math
  (defun my-latex-mode-setup ()
    (setq-local company-backends
                (append '((company-math-symbols-latex company-latex-commands))
                        company-backends)))
  (add-hook 'LaTeX-mode-hook 'my-latex-mode-setup)
  (company-auctex-init)
  )
