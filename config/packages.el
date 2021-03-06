;;; Emacs非標準Elisp設定 --- packages.el --- 

;;; install-elisp.el ; Emacs Lisp インストーラ
(require 'install-elisp)
;; Elisp ファイルをインストールする場所を設定
(setq install-elisp-repository-directory "~/.emacs.d/packages/")

;;; auto-async-byte-compile.el ; 自動バイトコンパイルを行う
(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;;; auto-complete.el ; 自動補完を行う
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next) ; C-nで候補を選択
(define-key ac-complete-mode-map "\C-p" 'ac-previous) ; C-pで候補を選択
(add-to-list 'ac-modes 'yatex-mode)

;;; auto-save-buffers.el ;自動保存を行う
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers) ; 0.5秒で保存

;;; screen-lines.el ; 見かけの行で判断
(require 'screen-lines)
;; text-mode かそれを継承したメジャーモードで自動的に有効にする
(add-hook 'text-mode-hook 'turn-on-screen-lines-mode)

;;; yatex.el ; YaTeX モード
(require 'yatex)
;; Yatex モードに関する設定
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; 文書作成時の日本語文字コード
(setq YaTeX-kanji-code nil) ; 1=SJIS 2=JIS 3=EUC 4=UTF-8
