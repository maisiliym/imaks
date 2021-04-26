(electric-pair-mode 1)
(menu-bar-mode -1)
(load-theme 'tango t)

(require 'which-key)
(which-key-mode)

(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-mode-fuzzy-match t
      helm-completion-in-region-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-completion-style 'emacs
      completion-styles '(flex))

(require 'magit)

(setq xah-fly-M-x-command 'helm-M-x)
(require 'xah-fly-keys)
(xah-fly-keys 1)
(xah-fly-keys-set-layout "colemak")

(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/git/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval let
	   ((root-dir-unexpanded
	     (locate-dominating-file default-directory ".dir-locals.el")))
	   (when root-dir-unexpanded
	     (let*
		 ((root-dir
		   (expand-file-name root-dir-unexpanded))
		  (root-dir*
		   (directory-file-name root-dir)))
	       (unless
		   (boundp 'geiser-guile-load-path)
		 (defvar geiser-guile-load-path 'nil))
	       (make-local-variable 'geiser-guile-load-path)
	       (require 'cl-lib)
	       (cl-pushnew root-dir* geiser-guile-load-path :test #'string-equal))))
     (eval setq-local guix-directory
	   (locate-dominating-file default-directory ".dir-locals.el")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
