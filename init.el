(setq lexical-binding t)
(setq custom-file "~/.config/emacs/custom-file.el")
(load custom-file)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode 1)

(require 'xah-fly-keys)
(defun xfk-mentci-modify ()
  (define-key xah-fly-leader-key-map (kbd "t") 'consult-buffer)
  (define-key xah-fly-key-map (kbd "k") 'consult-line)
  )

(defun start-xah-fly-keys ()
  (xah-fly-keys 1)
  (xah-fly-keys-set-layout "colemak")
  (xfk-mentci-modify))

(defun my-config-xah-fly-key ()
  "Modify keys for xah fly key command mode keys
To be added to `xah-fly-command-mode-activate-hook'"
  (interactive))

(add-hook 'xah-fly-command-mode-activate-hook 'my-config-xah-fly-key)

(defun my-xfk-addon-insert ()
  "Modify keys for xah fly key command mode keys To be added to `xah-fly-insert-mode-activate-hook'"
  (interactive))

(add-hook 'xah-fly-insert-mode-activate-hook 'my-xfk-addon-insert)

(if (daemonp)
    (add-hook 'server-after-make-frame-hook 'start-xah-fly-keys)
  (start-xah-fly-keys))

(electric-pair-mode 1)
(pinentry-start)

(load-theme 'modus-operandi t)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(require 'doom-modeline)
(doom-modeline-mode 1)
(require 'which-key)
(which-key-mode)

(recentf-mode 1)
(setq recentf-max-menu-items 256)
(setq recentf-max-saved-items 256)

(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)
(setq prescient-filter-method '(literal regexp fuzzy))
(require 'orderless)
(setq completion-styles '(orderless))
(marginalia-mode)

(require 'org-roam)
(setq org-directory "~/git/wiki")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-roam-directory org-directory)
(add-hook 'after-init-hook 'org-roam-mode)

;; (require 'posframe)
;; (setq selectrum-display-action '(display-buffer-show-in-posframe))
;; (defun display-buffer-show-in-posframe (buffer _alist)
;;   (frame-root-window
;;    (posframe-show buffer
;;                   :min-height 20
;;                   :min-width (frame-width)
;;                   :internal-border-width 1
;;                   :left-fringe 8
;;                   :right-fringe 8
;;                   :poshandler 'posframe-poshandler-frame-bottom-left-corner)))
;; (add-hook 'minibuffer-exit-hook 'posframe-delete-all)

(require 'magit)
(global-git-gutter-mode)

(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/git/" "/git/"))

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map (kbd "M-p") 'consult-history)))


(require 'fish-completion)
(global-fish-completion-mode)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(require 'adaptive-wrap)
(define-globalized-minor-mode global-adaptive-wrap adaptive-wrap-prefix-mode
  (lambda () (adaptive-wrap-prefix-mode 1)))
(global-adaptive-wrap 1)

;; TODO
;; (setq find-function-C-source-directory "~/Projects/emacs-25.1/src/") 
