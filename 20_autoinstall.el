;; auto-install
;; last update : 2012/07/05
;

;; auto-install によってインストールされる Emacs Lisp をロードパスに加える
;; デフォルトは ~/.emacs.d/auto-install/
;
(require 'auto-install)

;; 起動時に EmacsWiki のページ名を補完候補に加える
;
(auto-install-update-emacswiki-package-name t)

;; install-elisp.el 互換モードにする
;
(auto-install-compatibility-setup)

;; ediff 関連のバッファを1つのフレームにまとめる
;
(setq ediff-windows-setup-function 'ediff-setup-windows-plain)

;; proxy 対応関数
;
(defun auto-install-network-available-p (host)
  (if auto-install-use-wget
      (eq (call-process auto-install-wget-command nil nil nil "-q" "--spider" host) 0)
    (let* ((proxy (cdr (assoc "http" url-proxy-services)))
	   (host-port (if proxy (split-string proxy ":")))
	   (host (or (car host-port) host))
	   (port (or (cadr host-port) "80")))
      (ignore-errors (ffap-machine-p host port)))))
(setq auto-install-directory "~/.emacs.d/elisp/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
