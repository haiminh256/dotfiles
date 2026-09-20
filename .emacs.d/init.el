(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(menu-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(setq package-check-signature nil)
(package-initialize)
(xterm-mouse-mode)
(global-set-key (kbd "<mouse-4>") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "<mouse-5>") (lambda () (interactive) (scroll-up 1)))
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)


(use-package tokyo-night
  :ensure t
  :config
  (load-theme 'tokyo-night-storm t))

(use-package nerd-icons
  :ensure t)

(use-package treemacs
  :ensure t
  :defer t
  :custom
  (treemacs-width 30)
  (treemacs-position 'left)
  (treemacs-show-hidden-files t)
  (treemacs-silent-refresh t)
  (treemacs-indentation 2)
  (treemacs-git-mode 'deferred)
  (treemacs-find-workspace-method 'find-for-file-or-pick-first)
  :config
  (add-hook 'emacs-startup-hook #'treemacs-add-and-display-current-project-exclusively)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t s"   . treemacs-switch-workspace)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)))

(use-package treemacs-nerd-icons
  :ensure t
  :after (treemacs nerd-icons)
  :config
  (treemacs-load-theme "nerd-icons"))


(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-minor-modes nil))

(when (member "JetBrainsMono Nerd Font" (font-family-list))
  (set-font-set-font t 'unicode "JetBrainsMono Nerd Font" nil 'prepend))

(when (and (fboundp 'treesit-available-p) (treesit-available-p))
  (use-package treesit-auto
    :ensure t
    :custom
    (treesit-auto-install 'prompt)
    :config
    (global-treesit-auto-mode)))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-icon-type 'nerd-icons)
(use-package company
  :ensure t
  :init
  (global-company-mode t)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0
        company-tooltip-align-annotations t))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((vue-mode . lsp-deferred)
         (typescript-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-auto-guess-root t)
  (lsp-idle-delay 0.5)
  (lsp-log-io nil)
  (read-process-output-max (* 1024 1024))
  (gc-cons-threshold 100000000)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-delay 0.5)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil))
(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :hook (vue-mode . lsp-deferred))

(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook (rust-mode . lsp-deferred))

(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode) . lsp-deferred)
  :custom
  (ccls-executable "ccls")
  (ccls-initialization-options
   '(:index (:threads 0)
     :completion (:detailedLabel t)))))
(use-package vterm
  :ensure t
  :commands vterm
  :custom
  (vterm-shell "/bin/zsh")
  (vterm-max-scrollback 10000)
  (vterm-kill-buffer-on-exit t)
  :bind
  (("C-c t" . vterm)
   :map vterm-mode-map
   ("C-c C-k" . kill-buffer)          ;; đóng luôn, không hỏi
   ("C-c C-q" . kill-buffer)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ccls centaur-tabs company doom-modeline eat lsp-ui rust-mode
	  tokyo-night treemacs-nerd-icons treesit-auto typescript-mode
	  vterm vue-mode web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
