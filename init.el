(require 'xah-fly-keys)
(xah-fly-keys-set-layout "colemak")
(xah-fly-keys 1)
;(global-set-key (kbd "RET") 'xah-fly-command-mode-activate)
;(global-set-key (kbd "<return>") 'xah-fly-command-mode-activate)
(menu-bar-mode -1)
(require 'which-key)
(which-key-mode)
(require 'helm-config)
(add-to-list 'custom-theme-load-path "~/git/base16-emacs/build")
(load-theme 'base16-google-light t)
