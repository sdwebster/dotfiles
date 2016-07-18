;; This is the minimum necessary emacs profile required to enable Evil (vim wrapper)
;; Periodically I decide I want to play around w/ emacs,
;; and vim bindings are very helpful
;; Stored at ~/.emacs.d/init.el

;; pull in the melpa package manager (see https://www.emacswiki.org/emacs/MELPA
;; or ergoemacs.org/emacs/emacs_package_system.html)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa-stable" . "http://melpa.org/packages/")
    ;; still figuring out what exactly this "t" does
    t)
  (package-initialize))

(require 'evil)
(evil-mode 1)
