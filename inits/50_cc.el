;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

;;;=============================================================================
;;; cc-mode
;;;=============================================================================

;; C/C++ 用のカスタマイズ
(defconst my-c-style
  '(
    (c-basic-offset             . 4)        ; 基本オフセット量の設定
    (c-tab-always-indent        . t)        ; tab キーでインデントを実行
    (c-comment-only-line-offset . 0)        ; コメント行のオフセット量の設定
    (c-block-comment-prefix . "* ")         ; ブロックコメントの継続行の書式
    (c-indent-comments-syntactically-p . t) ; コメント行もインデント
    (c-backslash-column . 32)           ; コメントのバックスラッシュ開始の最低値
    (c-backslash-max-column . 100)      ; ラインコメントの最後尾のカラム

    ;; カッコ前後の自動改行処理の設定
    (c-hanging-braces-alist
     . (
        (class-open before after)       ; クラス宣言の'{'の後
        (class-close before)            ; クラス宣言の'}'の前
        (defun-open before after)       ; 関数宣言の'{'の前
        (defun-close before after)      ; 関数宣言の'}'の後
        (inline-open before after)      ; クラス内のインライン関数宣言の'{'の
        (inline-close before after)     ; クラス内のインライン関数宣言の'}'の後
        (brace-list-open before)        ; 列挙型、配列宣言の'{'の前後
        (brace-list-close after)        ; 列挙型、配列宣言の'}'の後
        (block-open after)              ; ステートメントの'{'の後
        (block-close before after)      ; ステートメントの'}'前後
        (substatement-open after)       ; サブステートメント(if 文等)の'{'の後
        (substatement-close before after) ; サブステートメント(if 文等)の'}'の前
        (statement-case-open after)       ; case 文の'{'の後
        (extern-lang-open after)          ; 他言語へのリンケージ宣言の'{'の前後
        (extern-lang-close after)         ; 他言語へのリンケージ宣言の'}'の前後
        ))

    ;; コロン前後の自動改行処理の設定
    (c-hanging-colons-alist
     . (
        (case-label after)              ; case ラベルの':'の後
        (label after)                   ; ラベルの':'の後
        (access-label after)            ; アクセスラベル(public等)の':'の後
        (member-init-intro after)       ; コンストラクタでのメンバー初期化
                                        ; リストの先頭の':'では改行しない
        (inher-intro before)            ; クラス宣言での継承リストの先頭の
                                        ; ':'では改行しない
        ))

    ;; 挿入された余計な空白文字のキャンセル条件の設定
    ;; 下記の*を削除する
    (c-cleanup-list
     . (
        ;;  brace-else-brace                ; else の直前
        ;;                                      ; "} * else {"  ->  "} else {"
        ;;  brace-elseif-brace              ; else if の直前
        ;;                                      ; "} * else if (.*) {"
        ;;                                      ; ->  } "else if (.*) {"
        empty-defun-braces              ; 空のクラス・関数定義の'}' の直前
        ;;；"{ * }"  ->  "{}"
        defun-close-semi                ; クラス・関数定義後の';' の直前
                                        ; "} * ;"  ->  "};"
        list-close-comma                ; 配列初期化時の'},'の直前
                                        ; "} * ,"  ->  "},"
        scope-operator                  ; スコープ演算子'::' の間
                                        ; ": * :"  ->  "::"
        ))

    ;; オフセット量の設定
    ;; 必要部分のみ抜粋(他の設定に付いては info 参照)
    ;; オフセット量は下記で指定
    ;; +  c-basic-offsetの 1倍, ++ c-basic-offsetの 2倍
    ;; -  c-basic-offsetの-1倍, -- c-basic-offsetの-2倍
    (c-offsets-alist
     . (
        (comment-intro          . 0)    ; コメント開始
        (arglist-intro          . +)    ; 引数リストの開始
        ;;(arglist-close          . c-lineup-arglist)   ; 引数リストの終了
        (arglist-close          . 0)    ; 引数リストの終了
        (substatement-open      . 0)    ; サブステートメントの開始
        (statement-cont         . ++)   ; ステートメントの継続
        (case-label             . 0)    ; case 文のラベル
        (label                  . 0)    ; ラベル行
        (block-open             . 0)    ; ブロックの開始行
        (member-init-cont       . c-lineup-multi-inher) ; メンバオブジェクトの初期化リスト
        (inline-open            . 0)                    ; 関数の開始
        (inline-close           . 0)
        (namespace-open         . 0)
        (namespace-close        . 0)
        (innamespace            . 0)
        (template-args-cont     (c-lineup-template-args +))
        ;;(template-args-cont     . +)
        ))

    (c-doc-comment-style . javadoc)     ; ドキュメント用コメントのスタイル
    )
  "My C Programming Style")

;; my-c-style を登録して有効にする場合
(c-add-style "PERSONAL" my-c-style)

(defun my-c-mode-common-hook()
  ;; 次のスタイルがデフォルトで用意されているスタイル
  ;;   * gnu:インデントは 2 ．GNU の推奨スタイル
  ;;   * k&r:インデントは 5 ．K&R のスタイル
  ;;   * bsd:インデントは 8 ．BSD のスタイル("Allman style")
  ;;   * stroustrup:インデントは 4 ． Bjarne Stroustrup による，「プロ
  ;;   グラミング言語 C++ 」のスタイル
  ;;   * whitesmith:インデントは 4 ． P ・ J ・プローガーのスタイル．
  ;;   * ellemtel:インデントは 3 ．Programming in C++ Rules and Recommendations で提案されているスタイル．
  ;;   * linux:インデントは 8 ． Linux のスタイル
  ;;   * cc-mode:インデントは 4 ． cc-mode オリジナル
  ;;   * python:インデントは 8 ． Python 用のスタイル
  ;;   * java:インデントは 4 ． JAVA 用のスタイル．
  ;; java style を使用
  ;; (c-set-style "java")
  (c-set-style "PERSONAL")

  (setq-default fill-column 80) ; 段落整形時の折り返しの文字数
  (setq indent-tabs-mode nil)   ; Tabの代わりにスペースでインデント
  (setq c-echo-syntactic-information-p t) ; インデント時に構文解析情報を表示する
  (setq c-toggle-auto-state t) ; 自動改行(auto-newline)を有効にする
  (setq c-toggle-hungry-state t) ; 連続する空白の一括削除(hungry-delete)を有効にする
  (setq c-toggle-hungry-state t) ; 連続する空白の一括削除(hungry-delete)を有効にする
  (setq c-hanging-semi&comma-criteria nil) ; セミコロンで自動改行しない
  (subword-mode 1)                         ; CamelCase

  ;; キーバインドの追加
  ;; ------------------
  ;; C-m        改行＋インデント
  ;; C-h        空白の一括削除
  ;; (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map "\C-h" 'c-electric-backspace)

  ;;
  ;; ClangFormat for formatting source files
  ;;
  (when (load "clang-format" nil t)
    (define-key c-mode-base-map [C-M-tab] 'clang-format-region))
  )

;; hook の設定
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Additional C++11 keywords
;;  <http://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs>
(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
             'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
             'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
             'font-lock-comment-face)

;; (setq font-lock-maximum-decoration t)

(add-hook 'c++-mode-hook
          '(lambda()
             ;; We could place some regexes into `c-mode-common-hook', but note that their evaluation order
             ;; matters.
             (font-lock-add-keywords
              nil '(;; complete some fundamental keywords
                    ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
                    ;; namespace names and tags - these are rendered as constants by cc-mode
                    ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
                    ;;  new C++11 keywords
                    ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
                    ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
                    ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
                    ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
                    ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
                    ;; hexadecimal numbers
                    ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
                    ;; integer/float/scientific numbers
                    ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?[fFlL]?\\>" . font-lock-constant-face)
                    ;; c++11 string literals
                    ;;       L"wide string"
                    ;;       L"wide string with UNICODE codepoint: \u2018"
                    ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
                    ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
                    ;;       R"(user-defined literal)"
                    ;;       R"( a "quot'd" string )"
                    ;;       R"delimiter(The String Data" )delimiter"
                    ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
                    ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
                    (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
                    (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

                    ;; user-defined types (rather project-specific)
                    ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
                    ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
                    ))
             ) t)

;;;=============================================================================
;;; Fortran
;;;=============================================================================

;; fortran-mode
(add-hook 'fortran-mode-hook
          (lambda ()
            ;; インデントの変更
            (setq fortran-continuation-indent 4
                  fortran-structure-indent 2
                  fortran-do-indent 2
                  fortran-if-indent 2)
            (fortran-auto-fill-mode 1) ;; wrap lines in 72 columns
            ))

;; f90-mode
(add-hook 'f90-mode-hook
          (lambda ()
            (setq
             ;; キーワードの最初の1文字を大文字で
             f90-auto-keyword-case 'downcase-word
             ;; 継続行の最初に"&"を追加
             f90-beginning-ampersand t
             ;; インデントの変更
             f90-continuation-indent 4
             f90-do-indent 2
             f90-if-indent 2
             f90-type-indent 2
             f90-program-indent 2
             f90-leave-line-no nil)
            (setq comment-column 35)
            ))

