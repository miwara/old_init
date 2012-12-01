;; emacs-skype
;; last update : 2012/07/07
;

(require 'skype)
(setq skype--my-user-handle "aruim_jon")
(defun skype ()
  (interactive)
  (skype--init)
  (skype--open-all-users-buffer-command)
  )


