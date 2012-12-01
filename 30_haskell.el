;; Haskell mode
;; last update : 2012/12/01
;

(require 'haskell-mode)
(require 'haskell-cabal)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))


;;; ghc-mod
;
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))

;;; ghc-flymake.el などがあるディレクトリ ghc-mod を ~/.emacs.d 以下で管理することにした
;
(add-to-list 'load-path "~/.emacs.d/elisp/ghc-mod")

(autoload 'ghc-init "ghc" nil t)

(add-hook 'haskell-mode-hook
	  (lambda () (ghc-init)))
