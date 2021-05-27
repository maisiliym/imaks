(setq lexical-binding t)
(setq custom-file "~/.config/emacs/custom-file.el")
(load custom-file)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode 1)

(require 'xah-fly-keys)

;; Innovation impossible without mass-overriding; most maps copied-over
(defun xfk-mentci-modify ()
  (xah-fly--define-keys
   xah-fly-command-map
   '(
     ("~" . nil)
     (":" . nil)
     ("SPC" . xah-fly-leader-key-map)
     ("DEL" . xah-fly-leader-key-map)
     ("'" . xah-reformat-lines)
     ("," . xah-shrink-whitespaces)
     ("-" . xah-cycle-hyphen-underscore-space)
     ("." . xah-backward-kill-word)
     (";" . xah-comment-dwim)
     ("/" . hippie-expand)
     ("\\" . nil)
     ;; ("=" . xah-forward-equal-sign)
     ("[" . xah-backward-punct )
     ("]" . xah-forward-punct)
     ("`" . other-frame)
     ("1" . xah-extend-selection)
     ("2" . xah-select-line)
     ("3" . delete-other-windows)
     ("4" . split-window-below)
     ("5" . delete-char)
     ("6" . xah-select-block)
     ("7" . xah-select-line)
     ("8" . xah-extend-selection)
     ("9" . xah-select-text-in-quote)
     ("0" . xah-pop-local-mark-ring)
     ("a" . xah-fly-M-x)
     ("b" . swiper-isearch)
     ("c" . previous-line)
     ("d" . xah-beginning-of-line-or-block)
     ("e" . xah-delete-backward-char-or-bracket-text)
     ("f" . undo)
     ("g" . backward-word)
     ("h" . backward-char)
     ("i" . xah-delete-current-text-block)
     ("j" . xah-copy-line-or-region)
     ("k" . xah-paste-or-paste-previous)
     ("l" . xah-insert-space-before)
     ("m" . xah-backward-left-bracket)
     ("n" . forward-char)
     ("o" . open-line)
     ("p" . xah-kill-word)
     ("q" . xah-cut-line-or-region)
     ("r" . forward-word)
     ("s" . xah-end-of-line-or-block)
     ("t" . next-line)
     ("u" . xah-fly-insert-mode-activate)
     ("v" . xah-forward-right-bracket)
     ("w" . xah-next-window-or-frame)
     ("x" . xah-toggle-letter-case)
     ("y" . set-mark-command)
     ("z" . xah-goto-matching-bracket)))

  (xah-fly--define-keys
   (define-prefix-command 'navigate-filesystem)
   '(("h" . consult-buffer)
     ("t" . projectile-find-file-dwim)
     ("c" . projectile-switch-project)
     ("n" . magit-find-file)
     ("s" . find-file)
     ))

  (xah-fly--define-keys
   (define-prefix-command 'xah-fly-leader-key-map)
   '(("SPC" . xah-fly-insert-mode-activate)
     ("DEL" . xah-fly-insert-mode-activate)
     ("RET" . xah-fly-M-x)
     ("TAB" . xah-fly--tab-key-map)
     ("." . xah-fly-dot-keymap)
     ("'" . xah-fill-or-unfill)
     ("," . xah-fly-comma-keymap)
     ("-" . xah-show-formfeed-as-line)
     ("\\" . toggle-input-method)
     ("3" . delete-window)
     ("4" . split-window-right)
     ("5" . balance-windows)
     ("6" . xah-upcase-sentence)
     ("9" . ispell-word)
     ("a" . mark-whole-buffer)
     ("b" . end-of-buffer)
     ("c" . xah-fly-c-keymap)
     ("d" . beginning-of-buffer)
     ("e" . xah-fly-e-keymap)
     ("f" . xah-search-current-word)
     ("g" . xah-close-current-buffer)
     ("h" . xah-fly-h-keymap)
     ("i" . kill-line)
     ("j" . xah-copy-all-or-region)
     ("k" . xah-paste-or-paste-previous)
     ("l" . recenter-top-bottom)
     ("m" . treemacs)
     ("n" . xah-fly-n-keymap)
     ("o" . exchange-point-and-mark)
     ("p" . query-replace)
     ("q" . xah-cut-all-or-region)
     ("r" . xah-fly-r-keymap)
     ("s" . save-buffer)
     ("t" . xah-fly-t-keymap)
     ("u" . navigate-filesystem)
     ;; v
     ("w" . xah-fly-w-keymap)
     ("x" . xah-toggle-previous-letter-case)
     ("y" . xah-show-kill-ring)
     ;; z
     ))
  )

(defun start-xah-fly-keys ()
  (xah-fly-keys 1)
  (xah-fly-keys-set-layout "colemak")
  (xfk-mentci-modify))

;; (defun my-config-xah-fly-key ()
;;   "Modify keys for xah fly key command mode keys To be added to `xah-fly-command-mode-activate-hook'"
;;   (interactive))

;; (defun my-xfk-addon-insert ()
;;   "Modify keys for xah fly key command mode keys To be added to `xah-fly-insert-mode-activate-hook'"
;;   (interactive))

;; (add-hook 'xah-fly-command-mode-activate-hook 'my-config-xah-fly-key)
;; (add-hook 'xah-fly-insert-mode-activate-hook 'my-xfk-addon-insert)

(if (daemonp)
    (add-hook 'server-after-make-frame-hook 'start-xah-fly-keys)
  (start-xah-fly-keys))

(electric-pair-mode 1)
(pinentry-start)

(require 'multiple-cursors)
(setq mc/always-run-for-all t)

(load-theme 'modus-operandi t)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(require 'doom-modeline)
(doom-modeline-mode 1)
(require 'which-key)
(which-key-mode)

(recentf-mode 1)
(setq recentf-max-menu-items 1024)
(setq recentf-max-saved-items 1024)

(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)
(setq selectrum-max-window-height 20)
(setq selectrum-prescient-enable-filtering nil) ; orderless
;; (setq prescient-filter-method '(literal regexp fuzzy))

(require 'orderless)
(setq completion-styles '(orderless))
(setq orderless-skip-highlighting (lambda () selectrum-is-active))

(marginalia-mode)
(marginalia-cycle)

(company-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

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

(with-eval-after-load 'magit
  (require 'forge))
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
(eval-after-load "lispy"
  `(progn
     ;; replace a local binding
     (lispy-define-key lispy-mode-map "e" 'lispy-down)))

(require 'adaptive-wrap)
(define-globalized-minor-mode global-adaptive-wrap adaptive-wrap-prefix-mode
  (lambda () (adaptive-wrap-prefix-mode 1)))
(global-adaptive-wrap 1)

(setq geiser-mode-start-repl-p t)
(setq geiser-guile-load-path
      '("/data/li/git/guix"
	"/data/li/git/giiks"
	"/data/li/git/guix-home-manager"))

;; (setq guix-load-path
;;       '("/data/li/git/guix"))

(advice-add 'slime-display-or-scroll-completions :around
             (defun my--slime-completion-in-region (_ completions start end)
               (completion-in-region start end completions)))

;; TODO
;; (setq find-function-C-source-directory "~/Projects/emacs-25.1/src/") 
