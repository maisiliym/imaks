(setq custom-file "~/.config/emacs/custom-file.el")
(load custom-file)
(electric-pair-mode 1)
(menu-bar-mode -1)
(load-theme 'tango t)
(pinentry-start)

(require 'which-key)
(which-key-mode)

;; (require 'helm)
;; (require 'helm-config)
;; (helm-mode 1)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (setq completion-styles '(fuzzy))

(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)
(setq prescient-filter-method '(literal fuzzy))

(require 'magit)
(global-diff-hl-mode)
(diff-hl-margin-mode)

;; (setq xah-fly-M-x-command 'prescient-sort)
(require 'xah-fly-keys)
(xah-fly-keys 1)
(xah-fly-keys-set-layout "colemak")

(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/git/"))
;; (require 'helm-projectile)
;; (helm-projectile-on)

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

;; (require 'fish-completion)
;; (global-fish-completion-mode)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

;; (note "doesnt work")
;; (require 'adaptive-wrap)
;; (adaptive-wrap-prefix-mode 1)
;; (define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; (define-key xah-fly-key-map (kbd "<C-return>") 'newline-and-indent)
;; (define-key xah-fly-key-map (kbd "C-RET") 'newline-and-indent)

(defun my-xfk-addon-insert ()
  "Modify keys for xah fly key command mode keys To be added to `xah-fly-insert-mode-activate-hook'"
  (interactive)
  (define-key xah-fly-key-map (kbd "C-e") 'newline-and-indent))

(add-hook 'xah-fly-insert-mode-activate-hook 'my-xfk-addon-insert)
