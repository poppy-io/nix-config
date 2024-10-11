;;;; the legendary poppy io emacs.el
;; started Wednesday October 9th 2024

;; get rid of ugly default clutter so we can replace it with cute customized clutter
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(set-fringe-mode 10) ; add a little breathing room
(setq visible-bell t) ; make emacs stop yelling at me
(eldoc-mode 1)

(setq
 use-package-always-ensure t
 use-package-verbose t)

;; slurp environment variables from the shell
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
(use-package counsel
     :after ivy
     :init
     (counsel-mode 1)
     :bind (:map ivy-minibuffer-map))

;; autocomplete suggestions
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (:map company-mode-map
	("<tab>". tab-indent-or-complete)
	("TAB". tab-indent-or-complete)))

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(use-package company-statistics
  :config
  (add-hook 'after-init-hook 'company-statistics-mode))

;; on-the-fly syntax checking
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode) ;; always lint
  (add-hook 'after-init-hook #'global-flycheck-mode))

;;;; LANGUAGE SUPPORT
;;; hook into language servers
(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-idle-delay 0.6)
  (lsp-inlay-hint-enable t) ; show inferred types

  ;; Rust
  (lsp-rust-analyzer-cargo-watch-command "clippy") ; what to do when checking on save
  (lsp-eldoc-render-all t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  
  :config
  (setq lsp-prefer-flymake nil) ; flymake is outdated, we use flycheck
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")
(add-hook 'after-init-hook 'global-nix-prettify-mode)

(use-package company-nixos-options)
(add-to-list 'company-backends 'company-nixos-options)

(use-package nix-sandbox)
(setq flycheck-command-wrapper-function
        (lambda (cmd) (apply 'nix-shell-command (nix-current-sandbox) cmd))
      flycheck-executable-find
        (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd))

;;; Nushell
(use-package nushell-mode)

;;; Rust
(use-package rustic
  :config
  (setq rustic-cargo-clippy-trigger-fix 'on-compile))
(push 'rustic-clippy flycheck-checkers)

;;;; PROJECT MANAGEMENT
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

;; direnv
(use-package envrc
  :hook (after-init . envrc-global-mode))

;; show a keymap of what's happening for learning purposes
(use-package which-key
  :config
  (which-key-mode t))
