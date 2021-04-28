(setq custom-file "~/.config/emacs/custom-file.el")
(load custom-file)
(electric-pair-mode 1)
(menu-bar-mode -1)
(load-theme 'tango t)
(pinentry-start)

(require 'which-key)
(which-key-mode)

(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq completion-styles '(flex))

(require 'magit)

(setq xah-fly-M-x-command 'helm-M-x)
(require 'xah-fly-keys)
(xah-fly-keys 1)
(xah-fly-keys-set-layout "colemak")

(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/git/"))
