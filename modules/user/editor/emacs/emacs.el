;;;; the legendary poppy io emacs.el
;; started Wednesday October 9th 2024

(require 'package)
(package-initialize)

;; get rid of ugly default clutter so we can replace it with cute customized clutter
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

;; make emacs stop yelling at me
(setq visible-bell t)

;; ensure use-package is present. From here on out, all packages are loaded
;; with use-package, a macro for importing and installing packages. Also, refresh the package archive on load so we can pull the latest packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq
 use-package-always-ensure t
 use-package-verbose t)

;; slurp environment variables from the shell.
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; set a cute theme
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

;; manage projects and common project functionality


;; autocomplete suggestions
(use-package company
  :bind (("C-." . company-complete))
  :custom
  (company-idle-delay 0)
  (company-dabbrev-downcase nil "Don't downcase returned candidates")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 10 "The more the merrier.")
  :config
  (global-company-mode) ;; Completion EVERYWHERE!

  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
				  `(lambda () (interactive) (company-complete-number ,x))))
	  (number-sequence 0 9))))

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
