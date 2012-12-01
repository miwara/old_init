;;; anything
;; last update : 2012/07/05
;

(require 'anything-startup)
(require 'anything-config)

(define-key global-map (kbd "C-:") 'anything)

(setq anything-sources
'(anything-c-source-buffers+
  anything-c-source-bookmarks
anything-c-source-recentf
anything-c-source-emacs-commands
anything-c-source-emacs-functions
anything-c-source-files-in-current-dir+
))
