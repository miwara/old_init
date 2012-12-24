;; Haskell mode
;; last update : 2012/12/25
;

(require 'haskell-mode)
(require 'haskell-cabal)

(load-library "haskell-site-file")

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))

;;; key-combo
(defun my-haskell-key-combo ()
  (key-combo-define-local (kbd "-") '("-" " - " " -> " "--"))
  (key-combo-define-local (kbd "<") '("<" " <- " " <= " " =<< " "<<" "<"))
  (key-combo-define-local (kbd "=") '("=" " = " " == " "=="))
  (key-combo-define-local (kbd ":") '(":" " :: " "::"))
  (key-combo-define-local (kbd "|") '(" | "))
  )

;;; 後でまとめてadd-hookするための関数
(defun my-haskell-add-hook ()
  (turn-on-haskell-indentation)
  (turn-on-haskell-doc-mode)
  (font-lock-mode)
  (my-haskell-key-combo)
  )

;;; add-hook
(custom-set-variables
 '(haskell-mode-hook 'my-haskell-add-hook)
 )


;; ;;; ghc-mod
;; ;
;; (add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))

;; ;;; ghc-flymake.el などがあるディレクトリ ghc-mod を ~/.emacs.d 以下で管理することにした
;; ;
;; (add-to-list 'load-path "~/.emacs.d/elisp/ghc-mod")

;; (autoload 'ghc-init "ghc" nil t)

;; (add-hook 'haskell-mode-hook
;; 	  (lambda () (ghc-init)))
