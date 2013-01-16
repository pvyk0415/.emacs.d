;;; 初期設定ファイル ----- init.el -----

;; ==================================================
;; パス設定
;; ==================================================

;;; Emacs23 より前のバージョンを利用している場合は, user-emacs-directory 変数が未定義のため次の設定を追加
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))
;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
;; ~/.emacs.d ディレクトリ以下のサブディレクトリをロードパスに追加
(add-to-load-path "config" "packages" "insert")


;; ==================================================
;; 基本設定
;; ==================================================

;;; キーバインド
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)	      ; ヘルプ
(define-key global-map (kbd "C-_") 'toggle-input-method)  ; 日本語入力切り替え
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント

;;; 日本語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;;; yes-no を y-n に置換
(fset 'yes-or-no-p 'y-or-n-p)

;;; 現在行に色をつける
;; (global-hl-line-mode t)

;;; 対応する括弧を光らせる
(show-paren-mode t)

;;; 行番号及び桁番号を表示
(line-number-mode t)
(column-number-mode t)

;;; バックファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 最終行に必ず一行入れる
(setq require-final-newline t)

;;; TAB キーによるインデントではモードを問わず空白を挿入する
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)

;;; ターミナル以外はツールバー、スクロールバーを非表示
(when window-system
  ;; tool-bar を非表示
  (tool-bar-mode 0)
  ;; scroll-bar を非表示
  (scroll-bar-mode 0))

;;; Emacs起動時にEshellを起動
(add-hook 'after-init-hook (lambda() (eshell)))

;; ==================================================
;; 環境に応じた設定の分岐
;; ==================================================

(cond
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Windows設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq window-system 'w32)

  ;; フレーム透過設定
  (set-frame-parameter (selected-frame) 'alpha '(85 50))

  ;; フォントの設定
  (set-face-attribute 'default nil
                      :family "メイリオ"
                      :height 110
                      )

  (cond
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 研究室Win-PC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((string-match "^Yasuharu-PC" system-name)

    ;; ウィンドウサイズ等設定
    (setq initial-frame-alist '(
                                (width . 128)
                                (height . 44)
                                (top . 5)
                                (left . 80)
                                ))
    (set-background-color "Black") ; 背景色
    (set-foreground-color "White") ; 字の色
    (set-cursor-color "Gray")      ; カーソルの色
    )

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 家Win-PC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((string-match "^Yasuharu-HP" system-name)

    ;; ウィンドウサイズ等設定
    (setq initial-frame-alist '(
                                (width . 128)
                                (height . 44)
                                (top . 5)
                                (left . 80)
                                ))
    (set-background-color "Black") ; 背景色
    (set-foreground-color "White") ; 字の色
    (set-cursor-color "Gray")      ; カーソルの色
    )
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Mac設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq window-system 'ns) 

  ;; バックスラッシュ入力
  (mac-translate-from-yen-to-backslash)
      
  ;; フレーム透過設定
  (set-frame-parameter (selected-frame) 'alpha '(85 50))

  ;; ウィンドウサイズ等設定
  (setq initial-frame-alist '(
                              (width . 190)
                              (height . 50)
                              (top . 30)
                              (left . 5)
                              ))
  (set-background-color "Black") ; 背景色
  (set-foreground-color "White") ; 字の色
  (set-cursor-color "Gray")      ; カーソルの色

  )

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Linux設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq window-system 'x)
      
  ;; フレーム透過設定
  (set-frame-parameter (selected-frame) 'alpha '(85 50))

  (cond
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 研究室Ubuntu ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((string-match "^konishi-PC" system-name)

    ;; フォント設定
    (set-face-attribute 'default nil
                        :height 170)

    ;; ウィンドウサイズ等設定
    (setq initial-frame-alist '(
                                (width . 200)
                                (height . 53)
                                (top . 36)
                                (left . 90)
                                ))
    (set-background-color "Black") ; 背景色
    (set-foreground-color "White") ; 字の色
    (set-cursor-color "Gray")      ; カーソルの色
    )

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; スパコンcamphor ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((string-match "^xe" system-name)

    ;; フォント設定
    (set-face-attribute 'default nil
                        :height 140)

    ;; ウィンドウサイズ等設定
    (setq initial-frame-alist '(
                                (width . 200)
                                (height . 53)
                                (top . 36)
                                (left . 90)
                                ))
    (set-background-color "Black") ; 背景色
    (set-foreground-color "White") ; 字の色
    (set-cursor-color "Gray")      ; カーソルの色
    )

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; スパコンcamphor ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((string-match "^ap" system-name)

    ;; フォント設定
    (set-face-attribute 'default nil
                        :height 140)

    ;; ウィンドウサイズ等設定
    (setq initial-frame-alist '(
                                (width . 200)
                                (height . 53)
                                (top . 36)
                                (left . 90)
                                ))
    (set-background-color "Black") ; 背景色
    (set-foreground-color "White") ; 字の色
    (set-cursor-color "Gray")      ; カーソルの色
    )
   )
  )
 )

;; ==================================================
;; 追加の設定をロード
;; ==================================================

;;; 標準Elispの設定 (builtins.el)
(load "builtins")

;;; 非標準Elispの設定 (packages.el)
(load "packages")
