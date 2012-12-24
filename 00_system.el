;;; Emacs System
;; last update : 2012/12/12
;

;;; 初期フレームの設定
;
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "black")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "blue")
		    '(width . 100)
		    '(height . 45)
		    '(top . 15)
		    '(left . 650)
		    '(font . "IPAゴシック")
		    )
	      default-frame-alist))

; フォントテスト
; THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.
; the quick brown fox jumps over the lazy dog.0123456789

;;; モードラインの背景，文字の色を設定
;
(set-face-background 'modeline "OrangeRed3")
(set-face-foreground 'modeline "SeaGreen3")

;;; モードラインに時刻を表示する
;
(display-time)

;;; 現在行に色を付ける
;
(global-hl-line-mode 1)
(set-face-background 'hl-line "deep sky blue") ;色
(set-face-foreground 'highlight "wheat")
;; M-x list-colors-display で色一覧

;;; *scratch* バッファのメッセージを消す
;
(setq initial-scratch-message "")

;;; 履歴を次回Emacs起動時にも保存する
;
(savehist-mode 1)

;;; 分割windowにしたときのカーソル移動設定(Shift-↑,←,↓,→ で移動)
;
;(windmove-default-keybindings)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>") 'windmove-up)
(global-set-key (kbd "C-S-<down>") 'windmove-down)

;;; ファイル内のカーソル位置を記録する
;
(setq-default save-place t)
(require 'saveplace)

;; タイムスタンプを表示する
;
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last update : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

;;; 対応する括弧を表示させる
;
(show-paren-mode 1)
; 色設定
(setq show-paren-style 'mixed)
; マッチしたときの設定
(set-face-foreground 'show-paren-match-face "black")
(set-face-background 'show-paren-match-face "green")
; ミスマッチしたときの設定
(set-face-foreground 'show-paren-mismatch-face "black")
(set-face-background 'show-paren-mismatch-face "light coral")

;;; シェルに合わせるため，C-hは後退に割り当てる
;;; ヘルプは<F1>も使える
;
(global-set-key (kbd "C-h") 'delete-backward-char)

;; 行番号・桁番号を表示する
;
(line-number-mode 1)
(column-number-mode 1)

;; 最後行に必ず1行挿入する
;
(setq require-final-newline t)

;;; リージョンに色を付ける
;
(transient-mark-mode 1)

;;; GCを減らして軽くする(デフォルトの10倍)
;;; 現在のマシンパワーではもっと大きくしてもよい
;
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記憶行数を増やす
;
(setq message-log-max 10000)

;;; ミニバッファを再帰的に呼び出せるようにする
;
(setq enable-recursive-minibuffers nil)

;;; ダイアログボックスを使わないようにする
;
(setq use-dialog-box 'message)

;;; 履歴をたくさん保存する
;
(setq history-length 1000)

;;; キーストロークをエコーエリアに早く表示する
;
(setq echo-keystrokes 0.1)

;;; 大きいファイルを開くときに警告を発生させる
;;; デフォルトは10MB. 250MBに拡張
;
(setq large-file-warning-threshold (* 25 1024 1024))

;;; ミニバッファで入力を取り消しても履歴に残す
;;; 誤って取り消して入力が失われるのを防ぐため
;
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;;; yと入力する
;
(defalias 'yes-or-no-p 'y-or-n-p)

;;; ツールバーとスクロールバーを消す
;
(tool-bar-mode nil)
(scroll-bar-mode nil)

;; スクロールを一行づつにする
;
(setq scroll-step 1)

;;; 画像ファイルを表示する
;
(auto-image-file-mode t)

;;; マウスカーソルを消す
;
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;; 括弧の補完
;
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; 自動改行OFF
;
(setq text-mode-hook 'turn-off-auto-fill)

;;; C-; でリージョン選択(M-SPC)した行をコメント(コメントされている場合は解除)
;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;;; C-Shif-k でカーソル位置から行頭までを削除
;
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line"
  (interactive "p")
  (kill-line 0))
;; C-Shift-k に設定
;
(global-set-key (kbd "C-S-k") 'backward-kill-line)

;;; スタートアップスクリーン
(setq inhibit-startup-screen nil)

;;; 指定行へ移動する
(global-set-key (kbd "C-c l") 'goto-line)

;;; cua-mode
;;; 矩形選択の設定
(cua-mode t)
(setq cua-enable-cua-keys nil)
