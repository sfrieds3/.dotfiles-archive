;;; evil-leader-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-leader" "../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader.el"
;;;;;;  "8c5bdaf4909445ec16c272767cdae0ab")
;;; Generated autoloads from ../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader.el

(autoload 'global-evil-leader-mode "evil-leader" "\
Global minor mode for <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader-mode "evil-leader" "\
Minor mode to enable <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader/set-key "evil-leader" "\
Bind `key' to command `def' in `evil-leader/default-map'.

Key has to be readable by `read-kbd-macro' and `def' a command.
Accepts further `key' `def' pairs.

\(fn KEY DEF &rest BINDINGS)" t nil)

(autoload 'evil-leader/set-key-for-mode "evil-leader" "\
Create keybindings for major-mode `mode' with `key' bound to command `def'.

See `evil-leader/set-key'.

\(fn MODE KEY DEF &rest BINDINGS)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-leader"
;;;;;;  "../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-leader" '("evil-leader")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader-autoloads.el"
;;;;;;  "../../../.emacs.d/elpa/evil-leader-0.4.3/evil-leader.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-leader-autoloads.el ends here
