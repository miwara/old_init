;; auto-install
;; last update : 2012/07/05
;

;; auto-install �ɂ���ăC���X�g�[������� Emacs Lisp �����[�h�p�X�ɉ�����
;; �f�t�H���g�� ~/.emacs.d/auto-install/
;
(require 'auto-install)

;; �N������ EmacsWiki �̃y�[�W����⊮���ɉ�����
;
(auto-install-update-emacswiki-package-name t)

;; install-elisp.el �݊����[�h�ɂ���
;
(auto-install-compatibility-setup)

;; ediff �֘A�̃o�b�t�@��1�̃t���[���ɂ܂Ƃ߂�
;
(setq ediff-windows-setup-function 'ediff-setup-windows-plain)

;; proxy �Ή��֐�
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
