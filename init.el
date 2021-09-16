;;; package --- Summary
;;; Commentary:
;; (setq url-proxy-services
;;   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;    ("http" . "127.0.0.1:7890")
;;     ("https" . "127.0.0.1:7890")))

;;; Code:
;;; Theme
(setq inhibit-startup-message t)
(setq initial-major-mode (quote fundamental-mode)) ;;disable scratch start automatically
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(fringe-mode 1)
(display-time-mode 1)
(display-battery-mode 1)
(set-fringe-mode 5)
;;(menu-bar-mode -1)
(setq visible-bell t)
(load-theme 'wombat)
(setq-default cursor-type 'bar)
(global-prettify-symbols-mode 1)
;;(global-visual-line-mode 1)
(paredit-mode -1)
(setq explicit-shell-file-name "/bin/zsh")
(server-start)


;;Global 优化
(setq auto-save-default t)
(setq make-backup-files nil)
(setq ring-bell-function nil)
(setq system-time-locale "C")
(defalias 'yes-or-no-p 'y-or-n-p)
;; (setq ns-pop-up-frames nil)
;; (setq tab-line-mode 1)
;; (setq tab-bar-mode 1)
;; (show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(centaur-tabs-gray-out-icons 'buffer)
 '(centaur-tabs-hide-tabs-hooks nil)
 '(centaur-tabs-mode t nil (centaur-tabs))
 '(centaur-tabs-modified-marker "*")
 '(centaur-tabs-set-bar 'left)
 '(centaur-tabs-set-close-button nil)
 '(centaur-tabs-set-icons t)
 '(centaur-tabs-set-modified-marker t)
 '(debug-on-error t)
 '(doom-modeline-mode t)
 '(geiser-chez-binary "/usr/local/bin/scheme")
 '(global-smart-tab-mode t)
 '(org-agenda-files
   '("~/inceptio/Agenda/confluence.org" "~/inceptio/Agenda/agenda.org"))
 '(org-babel-load-languages
   '((calc . t)
     (dot . t)
     (shell . t)
     (scheme . t)
     (python . t)
     (emacs-lisp . t)
     (shell . t)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-list-allow-alphabetical t)
 '(org-log-note-headings
   '((done . "CLOSING NOTE %t")
     (state . "State %-12s from %-12S %t")
     (note . "%t")
     (reschedule . "Rescheduled from %S on %t")
     (delschedule . "Not scheduled, was %S on %t")
     (redeadline . "New deadline from %S on %t")
     (deldeadline . "Removed deadline, was %S on %t")
     (refile . "Refiled on %t")
     (clock-out . "")))
 '(org-todo-keywords '((sequence "TODO" "DOING" "DONE")))
 '(package-selected-packages
   '(posframe go-translate epc quelpa-use-package visual-regexp flyspell-popup flycheck dashboard smart-tab org ox-confluence load-theme-buffer-local gotest go-eldoc yasnippet-snippets yasnippet go-rename go-guru company-go comany-go go-mode multi-vterm vterm exec-path-from-shell geiser company-graphviz-dot company embark consult auto-dim-other-buffers dired-sidebar which-key vertico use-package rainbow-delimiters projectile popup paredit org-bullets orderless memoize marginalia magit lsp-ui lsp-treemacs helpful general geiser-chez embark-consult doom-themes doom-modeline dired-single dired-open dired-hide-dotfiles company-box command-log-mode comint-hyperlink centaur-tabs auto-package-update all-the-icons-dired)))

;;
;;Vterm theme
;;


;;Global binding keys
(global-set-key (kbd "C-SPC") 'execute-extended-command)
(global-set-key (kbd "<f5>") 'eval-buffer)
(global-set-key (kbd "s-M-i") 'scroll-down-command)
(global-set-key (kbd "s-I") 'beginning-of-buffer)
(global-set-key (kbd "s-M-k") 'scroll-up-command)
(global-set-key (kbd "s-K") 'end-of-buffer)
(global-set-key (kbd "s-r") 'kill-word):
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;(global-set-key (kbd "s-w") 'delete-window)
;(global-set-key (kbd "s-w") 'kill-buffer-and-window)
(global-set-key (kbd "s-w") 'kill-current-buffer)
(global-set-key (kbd "s-u") 'kill-whole-line)
(global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-M-l") 'forward-word)
(global-set-key (kbd "s-L") 'move-end-of-line)
(global-set-key (kbd "s-j") 'backward-char)
(global-set-key (kbd "s-J") 'move-beginning-of-line)
(global-set-key (kbd "s-M-j") 'backward-word)
(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-n") 'set-mark-command)
(global-set-key (kbd "s-N") 'pop-to-mark-command)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-d") 'delete-char)
(global-set-key (kbd "s-p") 'org-export-dispatch)
(global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "<s-return>") (lambda () (interactive) (end-of-line) (newline-and-indent)))
(global-set-key (kbd "s-:") 'comment-or-uncomment-region)
(global-set-key (kbd "s-1") 'centaur-tabs-backward)
(global-set-key (kbd "s-2") 'centaur-tabs-forward)
(global-set-key (kbd "s-`") 'centaur-tabs-backward-group)
(global-set-key (kbd "s-x") 'kill-region)

;;Package install
(require
 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")			 ))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-dim-other-buffers
  :init
  (add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t)))))
;;dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content nil)
  ;(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  (add-to-list 'dashboard-items '(agenda) t)
  (setq dashboard-week-agenda t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents  . 10)
					;(bookmarks . 5)
			  (agenda . 8)
			  ;(projects . 5)
					;(registers . 5)
			  ))
  (image-type-available-p 'png)
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-startup-banner "/Users/iceonfire/.emacs.d/elpa/dashboard-20210815.445/banners/5.png")
  (dashboard-setup-startup-hook))

;;Dired
;; (use-package dired-sidebar
;;   :bind (("C-c C-n" . dired-sidebar-toggle-sidebar))
;;   :ensure t
;;   :commands (dired-sidebar-toggle-sidebar)
;;   :init
;; (add-hook 'dired-sidebar-mode-hook
;;           (lambda ()
;;             (unless (file-remote-p default-directory)
;;               (auto-revert-mode)))))
;; :config
;; (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;; (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
;; (setq dired-sidebar-width 30)
;; (setq dired-sidebar-subtree-line-prefix "__")
;; (setq dired-sidebar-theme 'wombat)
;; (setq dired-sidebar-use-term-integration t)
;; (setq dired-sidebar-use-custom-font t)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;;Centaur-tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
	centaur-tabs-height 25
	;;centaur-tabs-width 40
	centaur-tabs-set-icons t
	centaur-tabs-set-bar 'left
	centaur-tabs-label-fixed-length 20
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-close-button nil
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*")
  (centaur-tabs-headline-match)
  (centaur-tabs-change-fonts "Fira Code" 120)
  (defun centaur-tabs-buffer-groups ()
     (list
      (cond
	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
       ;; "Remote")
       ((or (and (string-equal "*" (substring (buffer-name) 0 1))
		 (not (string-equal "*dashboard*" (substring (buffer-name)))))
	     (memq major-mode '(magit-process-mode
				magit-status-mode
				magit-diff-mode
				magit-log-mode
				magit-file-mode
				magit-blob-mode
				magit-blame-mode
				)))
	"Emacs")
	((derived-mode-p 'dired-mode)
	 "Dired")
	((or (derived-mode-p 'eaf-mode)
	     (string-equal "*dashboard*" (substring (buffer-name))))
	 "eap")
	(t "Edit"))))
  :bind
  ;; ("m-1" . centaur-tabs-backward)
  ;; ("m-2" . centaur-tabs-forward)
  ;; ("m-`" . centaur-tabs-backward-group)
  )

(use-package rainbow-delimiters
  :ensure t)
(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme" t)

;; (custom-theme-set-faces
;;  'wombat
;;  '(default ((t (:background "gray8")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 134 :family "Fira Code"))))
 '(auto-dim-other-buffers-face ((t (:background "gray22"))))
 '(centaur-tabs-unselected ((t (:background "#3D3C3D" :foreground "grey50" :height 120 :family "Fira Code"))))
 '(company-echo ((t nil)) t)
 '(company-scrollbar-bg ((t (:background "orange1"))))
 '(company-scrollbar-fg ((t (:background "dark gray"))))
 '(company-tooltip-selection ((t (:background "orange3"))))
 '(consult-preview-line ((t (:inherit consult-preview-insertion :extend t :background "Orange" :foreground "gray100"))))
 '(cursor ((t (:background "OliveDrab1"))))
 '(mode-line-inactive ((t (:background "gray22" :foreground "#bebebe" :height 1.0))))
 '(org-block ((t (:inherit shadow :extend t :width extra-condensed))))
 '(org-date ((t (:foreground "dim gray" :underline t))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :foreground "brown1" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :extend nil :foreground "green3"))))
 '(org-level-3 ((t (:inherit outline-3 :extend nil :foreground "tomato2"))))
 '(org-level-4 ((t (:inherit outline-4 :extend nil :foreground "medium sea green"))))
 '(rainbow-delimiters-base-face ((t (:inherit nil))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "brown3"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "MediumPurple3"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "light coral"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "PeachPuff1"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "tomato"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "green yellow"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "PaleVioletRed3"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-black))))
 '(vterm-color-black ((t (:inherit term-color-black :background "gray100"))))
 '(web-mode-current-element-highlight-face ((t (:background "#000000" :foreground "red" :weight bold)))))

;;Packages-use

;;(add-to-list 'load-path "~/lisp/geiser-gambit")
;; (setq scheme-program-name "chez")
;; ;;(setq geiser-chez-binary "chez")
;; (setq geiser-active-implementations '(chez))
;; (setq geiser-mode-start-repl-p nil)
;; (setq geiser-default-implementation 'scheme)
;; (use-package geiser
;;   :bind (
;; 	 ("s-b" . geiser-eval-definition)
;;          ("s-B" . geiser-eval-buffer))
;;   :init
;;   (geiser-mode 1))
;; (use-package geiser-chez)

(use-package paredit
  :hook (scheme-mode . paredit-mode)
  :bind (
	 ("s-)" . paredit-forward-slurp-sexp)
	 ("s-(" . paredit-backward-slurp-sexp)
	 ("M-)" . paredit-join-sexps)
	 ("M-(" . paredit-split-sexp)))

;;Vertico, Consult
(use-package vertico
  :init
  (vertico-mode)
  :bind
  (
   ("M-j" . vertico-next)
   ("M-k" . vertico-previous)))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind ;; C-c bindings (mode-specific-map)
  ("C-c h" . consult-history)
  ("C-c m" . consult-mode-command)
  ("C-c b" . consult-bookmark)
  ("C-c k" . consult-kmacro)
  ;; C-x bindings (ctl-x-map)
  ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
  ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
  ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
  ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
  ;; Custom M-# bindings for fast register access
  ("M-#" . consult-register-load)
  ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
  ("C-M-#" . consult-register)
  ;; Other custom bindings
  ("M-y" . consult-yank-pop)                ;; orig. yank-pop
  ("<help> a" . consult-apropos)            ;; orig. apropos-command
  ;; M-g bindings (goto-map)
  ("M-g e" . consult-compile-error)
  ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
  ("M-g g" . consult-goto-line)             ;; orig. goto-line
  ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
  ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
  ("M-g m" . consult-mark)
  ("M-g k" . consult-global-mark)
  ("M-g i" . consult-imenu)
  ("M-g I" . consult-project-imenu)
  ;; M-s bindings (search-map)
  ("M-s f" . consult-find)
  ("M-s L" . consult-locate)
  ("M-s g" . consult-grep)
  ("M-s G" . consult-git-grep)
  ("M-s r" . consult-ripgrep)
  ("M-s l" . consult-line)
  ("M-s m" . consult-multi-occur)
  ("M-s k" . consult-keep-lines)
  ("M-s u" . consult-focus-lines)
  ;; Isearch integration
  ("M-s e" . consult-isearch)
;;  :map isearch-mode-map
  ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
  ("M-s e" . consult-isearch)               ;; orig. isearch-edit-string
  ("M-s l" . consult-line)                 ;; needed by consult-line to detect isearch
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark
   :preview-key (kbd "M-."))
  (setq consult-narrow-key "<") ;; (kbd "C-+")
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project))))))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))
;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-moden
  :config
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15) ))

(use-package general)

;;projectile, magit
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "/Users/iceonfire/inceptio")
    (setq projectile-project-search-path '("/Users/iceonfire/inceptio")))
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-enable-caching t))

(use-package magit
  :commands magit-status
  :custom
  (magit-display-bufferp-function #'magit-display-buffer-same-window-except-diff-v1))
;;(add-to-list 'exec-path "c:/Program Files/Git/bin")

;;
;; yasnippet
;;

(use-package yasnippet
  :ensure t
  :init
  (add-hook 'org-mode-hook #'yas-minor-mode)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all)
  (use-package yasnippet-snippets
    :ensure t))


;;
;; company mode
;;

(use-package company
  ;;  :after ((scheme-mode . go-mode))
;;  :hook (scheme-mode . company-mode)
  :ensure t
  :config
  (global-company-mode t)
  ;; :bind (:map company-active-map
  ;; 	      ("<tab>" . company-complete-selection))
  ;;       (:map scheme-mode-map
  ;;             ("<tab>" . company-indent-or-complete-common))
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.0)
  (setq company-backends
	'((company-files company-yasnippet ;;company-ispell
			 company-keywords company-capf)
	  (company-abbrev company-dabbrev)))) 

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (add-to-list (make-local-variable 'company-backends)
					       'company-elisp)))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "e") nil)
  (define-key company-active-map (kbd "SPC") #'company-abort)
  (define-key company-active-map (kbd "s-k") #'company-select-next)
  (define-key company-active-map (kbd "s-i") #'company-select-previous)
  )

(advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda () (when (equal my-company-point (point))
						    (yas-expand))))

;; (use-package term
;;   :commands term
;;   :hook (term-line-mode)
;;   :config
;;   (setq explicit-shell-file-name "zsh") ;; Change this to zsh, etc
;;   (setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific
;;   (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))


;; org-mode
(setq org-image-actual-width nil)
(require 'org-tempo)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("✥" "⚫" "◉" "○" "◈" "◇")))

(use-package org
  :config
  (setq org-ellipsis " ▾"))

;(setenv "PATH" (concat "/opt/local/bin/:" (getenv "PATH")))

;;always show image inline automatically after src code
(eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images))

;;org babel
(setq org-confirm-babel-evaluate nil)

;;org text highlight
(org-add-link-type "color"
 (lambda (path)
   (message (concat "color "
                    (progn (add-text-properties
                            0 (length path)
                            (list 'face `((t (:foreground ,path))))
                            path) path))))
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<span style=\"color:%s;\">%s</span>" path desc))
    ((eq format 'latex)
     (format "{\\color{%s}%s}" path desc)))))


;;flycheck
(use-package flycheck
  :ensure t)

;; (dolist (hook '(org-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1) (flycheck-mode 1) (flyspell-auto-correct-previous-hook 1))))
;;SHELL
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
 (setq exec-path-from-shell-variables '("PATH" "GOPATH"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH") ;;very important to go mode
  )

(use-package vterm)
;;  :load-path  "/usr/local/Cellar/emacs-libvterm"
;;  (setq vterm-kill-buffer-on-exit t))

(use-package smart-tab
  :ensure t
  :config
  (global-smart-tab-mode t))

;; k8S
;; (use-package kubernetes
;;   :ensure t
;;   :commands (kubernetes-overview)
;;   :config
;;   (setq kubernetes-poll-frequency 3600
;;         kubernetes-redraw-frequency 3600))


;;defun

(defun keyboard-escape-quit ()
  (interactive)
  (cond ((eq last-command 'mode-exited) nil)
        ((region-active-p)
         (deactivate-mark))
        ((> (minibuffer-depth) 0)
         (abort-recursive-edit))
        (current-prefix-arg
         nil)
        ((> (recursion-depth) 0)
         (exit-recursive-edit))
        (buffer-quit-function
         (funcall buffer-quit-function))
        ;((not (one-window-p t))
         ;(delete-other-windows))
        ((string-match "^ \\*" (buffer-name (current-buffer)))
         (bury-buffer))))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(put 'downcase-region 'disabled nil)


;;
;; go
;;
(use-package go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :hook ((before-save . gofmt-before-save))
  :config
  (setq gofmt-command "goimports")
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq exec-path (append exec-path '("/Users/iceonfire/go/bin:/Users/iceonfire/go")))
  (use-package company-go
    :ensure t
    :config
    (add-hook 'go-mode-hook (lambda ()
			      (add-to-list (make-local-variable 'company-backends)
					   '(company-go company-files company-capf))))
    )
  (use-package go-eldoc
    :ensure t
    :hook (go-mode . go-eldoc-setup)
    )
  (use-package go-guru
    :ensure t
    :hook (go-mode . go-guru-hl-identifier-mode)
    )
  (use-package go-rename
    :ensure t)
  (use-package gotest
    :defer 2
    :after go-mode)
  )

;;ox-confluece (install org)
(require 'ox-confluence)
;;(require 'ov-highlight)

;;EAF
(use-package quelpa-use-package)
;; Don't forget to run M-x eaf-install-dependencies
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser) ;Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package epc      :defer t :ensure t)
  (use-package ctable   :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s        :defer t :ensure t)
  (setq browse-url-browser-function 'eaf-open-browser)
   :config
   (defalias 'browse-web #'eaf-open-browser)
   ;; (eaf-bind-key eaf-send-down-key "s-k" eaf-app-keybiding)
   ;; (eaf-bind-key eaf-send-up-key "s-i" eaf-app-keybiding)
   ;; (eaf-bind-key eaf-send-return-key "s-m" eaf-app-keybiding)					;
   ;; ;(eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
   (eaf-bind-key scroll_down "s-i" eaf-pdf-viewer-keybinding)
   (eaf-bind-key scroll_up "s-k" eaf-pdf-viewer-keybinding)
   (eaf-bind-key page_down "s-K" eaf-pdf-viewer-keybinding)
     (eaf-bind-key scroll_up "s-I" eaf-pdf-viewer-keybinding)
  ;(eaf-bind-key take_photo "p" eaf-camera-keybinding)
					;(eaf-bind-key nil "M-q" eaf-browser-keybinding)
  )
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
;(require 'eaf-terminal)
;(require 'eaf-org-previewer)

;;google translate
(require 'go-translate)
(setq go-translate-base-url "https://translate.google.cn")
(setq go-translate-target-language "en")
(setq go-translate-local-language "zh-CN")
(defun go-translate-token--extract-tkk ()
  (cons 430675 2721866130))
(global-set-key "\C-cT" 'go-translate)
(global-set-key "\C-ct" 'go-translate-popup)
(setq go-translate-inputs-function #'go-translate-inputs-current-or-prompt)
(setq go-translate-buffer-follow-p t)
;;; init.el ends here
