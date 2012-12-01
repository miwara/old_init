;; Ruby mode
;; last update : 2012/10/11
;

(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")

;; inf-ruby.el
;
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; ruby-electric.el --- electric editing commands for ruby files
;
(require 'ruby-electric)

;; 閉じ括弧，endを挿入する
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; インデントの設定
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; rubydb3x.el
;

;; Ruby のデバッガを Emacs から使うための設定
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; ミニバッファに表示し，かつ，オーバレイする
(setq ruby-block-highlight-toggle t)
