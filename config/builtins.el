;;; Emacs標準Elisp設定 --- builtins.el ---

;;; autoinsert.el ;ファイル作成時にテンプレートを挿入
(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.c" "c-template.c")       ; C言語用テンプレート
(define-auto-insert "\\.tex" "tex-template.tex") ; tex用テンプレート
(define-auto-insert "\\.plt" "plt-template.plt") ; gnuplot用スクリプトファイル
