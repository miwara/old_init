;; sdic-inline
;; last update : 2012/08/10
;

;; リージョンで選択したところに英単語の訳を表示
;
(require 'sdic-inline)
(sdic-inline-mode t)			; sdic-inline モード起動
(setq sdic-inline-word-at-point-strict t)

;; 辞書ファイルの設定
;
(setq sdic-inline-eiwa-dictionary "~/.emacs.d/elisp/sdic-2.1.3/dict/gene.sdic")
(setq sdic-inline-waei-dictionary "~/.emacs.d/elisp/sdic-2.1.3/dict/jedict.sdic")

;; sdic tooltip
;
(require 'sdic-inline-pos-tip)
(setq sdic-inline-display-func 'sdic-inline-pos-tip-show)

(setq transient-mark-mode t)

(defun sdic-inline-pos-tip-show-when-region-selected (entry)
  (cond
   ((and transient-mark-mode mark-active)
    (funcall 'sdic-inline-pos-tip-show entry))
   (t
    ;(funcall 'sdic-inline-display-minibuffer entry)
    )))

(setq sdic-inline-search-func 'sdic-inline-search-word-with-stem)
(setq sdic-inline-display-func 'sdic-inline-pos-tip-show-when-region-selected)
(define-key sdic-inline-map "\C-c\C-p" 'sdic-inline-pos-tip-show)
