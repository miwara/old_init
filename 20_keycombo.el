;; key-combo
;; last update : 2012/12/25
;

(require 'key-combo)
(key-combo-mode t)

(key-combo-define-global (kbd "+") '(" + " "+"))
(key-combo-define-global (kbd "-") '(" - " "-"))
(key-combo-define-global (kbd "*") '(" * " "*"))
(key-combo-define-global (kbd "/") '(" / " "/"))

(key-combo-load-default)
