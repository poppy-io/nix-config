;;;; the legendary poppy io emacs.el
;; started Wednesday October 9th 2024

(require 'package)
(package-initialize)
(eval-when-compile
  (require 'use-package))

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

;; stop backup clutter
(setq make-backup-files nil)

;; set a cute theme for now until emacs overlay works with stylix
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-zenburn t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; get icons (if we need them)
(use-package all-the-icons
  :if (display-graphic-p))
(use-package nerd-icons
  :if (display-graphic-p))

(use-package neotree
  :config
  (setq neo-theme 'icons)
  (setq neo-smart-open t)
  (global-set-key [f12] 'neotree-toggle))

(setq projectile-switch-project-action 'neotree-projectile-action)

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
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous))
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

;; rich presence
(use-package elcord
  :custom
  (elcord-editor-icon "Emacs (Legacy)")
  (elcord-idle-message "Taking a nap..."))
(elcord-mode)

;; startup screen
(use-package grid)
(use-package enlight
  :custom
  (enlight-content
   (concat
    "hello!"
    "\n"
    (enlight-menu
     '(("orgmode"
	("org-agenda (current day)" (org-agenda nil "a") "a"))
       ("projects"
	("configs" (projectile-switch-project-by-name "~/nix-config/") "n")
	("dissertation" (projectile-switch-project-by-name "~/dev/dissertation/") "d")
	("other" projectile-switch-project "p")))))))
(setopt initial-buffer-choice #'enlight)

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
  (setq lsp-tex-server 'digestif)
  
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;;; Nix
;;(use-package nix-mode
;;  :mode "\\.nix\\'"
;;  :hook (nix-mode . lsp-deferred))
;;(add-hook 'after-init-hook 'global-nix-prettify-mode)

(use-package company-nixos-options)
(add-to-list 'company-backends 'company-nixos-options)

(use-package nix-sandbox)
(setq flycheck-command-wrapper-function
        (lambda (cmd) (apply 'nix-shell-command (nix-current-sandbox) cmd))
      flycheck-executable-find
      (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd)))

(use-package lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["alejandra"]))

;;; Nushell
(use-package nushell-mode)

;;; Rust
(use-package rustic
  :config
  (setq rustic-cargo-clippy-trigger-fix 'on-compile))
(push 'rustic-clippy flycheck-checkers)

;;; Just
(use-package just-mode)
(use-package justl)

;;; Python
(use-package ruff-format)
(add-hook 'python-mode-hook 'ruff-format-on-save-mode)

(use-package lsp-pyright
  :custom (lsp-pyright-langserver-command "basedpyright")
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))

;;; LaTeX
(use-package pdf-tools
  :init (pdf-tools-install)
  :mode ("\\.pdf\\'" . pdf-tools-modes))
(use-package latex
  :ensure auctex
  :mode ("\\.tex\\$" . latex-mode)
  :custom
  (TeX-engine 'luatex)
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-method 'synctax)
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-electric-math (cons "$" "$"))
  (LaTeX-electric-left-right-brace t)
  (reftex-plug-into-AUCTeX t)
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-source-correlate-start-server t)
  (TeX-master nil))

; update pdf buffers after compile
(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)
(use-package auctex-latexmk
  :after tex
  (auctex-latexmk-inherit-TeX-PDF-mode t)
  :config
  (auctex-latexmk-setup))
(use-package company-auctex
  :after tex
  :init
  (company-auctex-init))

;; spellcheck for latex
(flycheck-define-checker tex-textidote
  "A LaTeX grammar/spelling checker using textidote.

  See https://github.com/sylvainhalle/textidote"
  :modes (latex-mode plain-tex-mode)
  :command ("textidote"
            "--read-all"
            "--output" "singleline"
            "--no-color"
            "--check"   (eval (if ispell-current-dictionary (substring ispell-current-dictionary 0 2) "en_UK"))
            ;; Try to honor local aspell dictionary and replacements if they exist
            "--dict"    (eval (expand-file-name "~/.aspell.en.pws"))
            "--replace" (eval (expand-file-name "~/.aspell.en.prepl"))
            ;; Using source ensures that a single temporary file in a different dir is created
            ;; such that textidote won't process other files. This serves as a hacky workaround for
            ;; https://github.com/sylvainhalle/textidote/issues/200.
            source)
  :error-patterns ((warning line-start (file-name)
                            "(L" line "C" column "-" (or (seq "L" end-line "C" end-column) "?") "): "
                            (message (one-or-more (not "\""))) (one-or-more not-newline) line-end)))
(add-to-list 'flycheck-checkers 'tex-textidote)


;;;; PROJECT MANAGEMENT
(use-package projectile
  :init
  (projectile-mode t)
  :config
  (setq projectile-enable-caching t
	projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))

(use-package counsel-projectile
  :init
  (projectile-known-projects)
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

;; org mode
(setq org-latex-compiler "lualatex")

;;;; MULTIMEDIA
(use-package emms
  :config
  (emms-all)
  (add-to-list 'emms-info-functions 'emms-info-mpd)
  (add-to-list 'emms-player-list 'emms-player-mpd)
  (add-hook 'emms-playlist-cleared-hook 'emms-player-mpd-clear)

  ; (emms-player-mpd-update-all)
  (emms-cache-set-from-mpd-all)
  (emms-player-mpd-connect)
  
  :custom
  (emms-player-mpd-server-name "localhost")
  (emms-player-mpd-server-port "6600")
  (emms-volume-change-function 'emms-volume-mpd-change)
  (emms-browser-covers 'emms-browser-cache-thumbnail)
  (emms-browser-thumbnail-filter 'emms-browser-thumbnail-filter-all)
  (scroll-up-aggressively 0.0)
  (scroll-down-aggressively 0.0)
  (emms-player-mpd-music-directory "/home/poppy/Music")
  (emms-browser-covers-file-extensions '("jpg" "png" "bmp" "gif")))


(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))
  
(provide 'emacs)
;;; emacs.el ends here

