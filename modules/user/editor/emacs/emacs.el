;;;; the legendary poppy io emacs.el
;; started Wednesday October 9th 2024

(package-initialize)

;; get rid of ugly default clutter so we can replace it with cute customized clutter
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(set-fringe-mode 10) ; add a little breathing room
(setq visible-bell t) ; make emacs stop yelling at me
(eldoc-mode 1)

(require 'use-package)
(setq
 use-package-always-ensure t
 use-package-verbose t)

;; slurp environment variables from the shell.
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; set a cute theme for now until emacs overlay works with stylix
(use-package doom-themes
  :init
  (load-theme 'doom-fairy-floss))

;; make M-x and other mini-buffers sortable and filterable
(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-height 15
	ivy-use-virtual-buffers t
	ivy-use-selectable-prompt t))
(use package counsel
     :after ivy
     :init
     (counsel-mode 1)
     :bind (:map ivy-minibuffer-map))

;; autocomplete suggestions
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))

;; flycheck replaces flymake and stops lsp-mode from doing too much
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode) ;; always lint
  (add-hook 'after-init-hook #'global-flycheck-mode))

;;; Language support
;; hook into language servers
(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)) ; see above, flymake is outdated

(use-package nushell-mode)

;;; Project management
(use-package projectile
  :init
  (projectile-mode t)
  :config
  (setq projectile-enable-caching t
	projectile-completion-system 'ivy))
(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

;; git
(use-package magit)

;; show a keymap of what's happening for learning purposes
(use-package which-key
  :config
  (which-key-mode t))
