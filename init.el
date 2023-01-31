;;; package --- Summar
;;; Commentary:
;; (setq url-proxy-services
;;  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;   ("http" . "127.0.0.1:7890")
;;    ("https" . "127.0.0.1:7890")))
;;; Code:
;;; Theme

;;(setq frame-resize-pixelwise t)
(setq inhibit-startup-message t)
(setq initial-major-mode (quote fundamental-mode)) ;;disable scratch start automatically
(delete-selection-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(visual-line-mode 1)
;;(fringe-mode 1)
(display-time-mode 1)
(display-battery-mode 1)
;;(set-fringe-mode 5)
(menu-bar-mode -1)
(setq visible-bell t)
(load-theme 'modus-vivendi)
(setq-default cursor-type '(bar . 3))
(global-prettify-symbols-mode 1)
;;(global-visual-line-mode 1)
;;(paredit-mode -1)
(setq explicit-shell-file-name "/bin/zsh")
(server-start)
;;Global 优化
(setq auto-save-default t)
(setq make-backup-files nil)
(setq ring-bell-function nil)
(setq system-time-locale "C")
(setq org-src-fontify-natively t)
(defalias 'yes-or-no-p 'y-or-n-p)
;; (setq ns-pop-up-frames nil)
;; (setq tab-line-mode 1)
;; (setq tab-bar-mode 1)
(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(custom-safe-themes
   '("3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "7160746eb7ae4ced07bb3084a3421d7f8c9c999d1ca13886db5657cc25ae3f80" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" default))
 '(debug-on-error t)
 '(geiser-chez-binary "/usr/local/bin/scheme")
 '(geiser-racket--binary "/usr/local/bin/racket")
 '(geiser-racket-binary "/usr/local/bin/racket")
 '(global-smart-tab-mode t)
 '(org-agenda-files nil)
 '(org-babel-load-languages
   '((calc . t)
     (dot . t)
     (shell . t)
     (scheme . t)
     (clojure . t)
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
   '(graphviz-dot-mode flycheck-rust racer consult-dash embark-consult embark lsp-mode golden-ratio whole-line-or-region smart-tab cargo cargo-mode toml-mode rust-playground exercism dap-mode tree-sitter-langs tree-sitter rust-mode pandoc-mode geiser-chibi paradox expand-region isend-mode geiser-racket cider clojure-mode ement plz prettier-js rjsx-mode lsp-tailwindcss org-contrib org-re-reveal company-jedi multiple-cursors elpy org-reveal flycheck-aspell pdf-tools go-translate epc quelpa-use-package visual-regexp flyspell-popup flycheck dashboard org load-theme-buffer-local gotest go-eldoc yasnippet go-rename go-guru company-go comany-go go-mode exec-path-from-shell geiser company-graphviz-dot company auto-dim-other-buffers dired-sidebar rainbow-delimiters org-bullets orderless memoize marginalia magit lsp-ui lsp-treemacs helpful general geiser-chez doom-themes doom-modeline dired-single dired-open dired-hide-dotfiles company-box command-log-mode comint-hyperlink centaur-tabs auto-package-update all-the-icons-dired))
 '(paradox-github-token t)
 '(python-shell-exec-path '("/usr/local/lib/python3.9/site-packages"))
 '(python-shell-interpreter "python")
 '(safe-local-variable-values
   '((eval when
	   (and
	    (buffer-file-name)
	    (not
	     (file-directory-p
	      (buffer-file-name)))
	    (string-match-p "^[^.]"
			    (buffer-file-name)))
	   (unless
	       (require 'package-recipe-mode nil t)
	     (let
		 ((load-path
		   (cons "../package-build" load-path)))
	       (require 'package-recipe-mode)))
	   (unless
	       (derived-mode-p 'emacs-lisp-mode)
	     (emacs-lisp-mode))
	   (package-build-minor-mode)
	   (setq-local flycheck-checkers nil)
	   (set
	    (make-local-variable 'package-build-working-dir)
	    (expand-file-name "../working/"))
	   (set
	    (make-local-variable 'package-build-archive-dir)
	    (expand-file-name "../packages/"))
	   (set
	    (make-local-variable 'package-build-recipes-dir)
	    default-directory))
     (geiser-autodoc--inhibit . t)))
 '(warning-suppress-types '((emacs))))
;;
;;Vterm theme
;;

;;define keys
(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))
(defun delete-current-line (arg)
  "Delete (not kill) the current line."
  (interactive "p")
  (save-excursion
    (delete-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line arg) (point)))))
(defun copy-current-line (arg)
  "copy the current line."
  (interactive "p")
  (save-excursion
    (copy-region-as-kill
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line arg) (point)))))
(defun cut-current-line (arg)
  "copy the current line."
  (interactive "p")
  (save-excursion
    (kill-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line arg) (point)))))
(defun paste-current-line (arg)
  "paste the current line."
  (interactive "p")
  (yank))



;;Global binding keys
(global-set-key (kbd "C-y") 'paste-current-line)
(global-set-key (kbd "M-z") 'copy-isearch-match)
(global-set-key (kbd "C-SPC") 'execute-extended-command)
(global-set-key (kbd "C-x z") 'execute-extended-command)
(global-set-key (kbd "<f5>") 'eval-region)
;;(global-set-key (kbd "s-I") 'scroll-down-command)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
;;(global-set-key (kbd "s-K") 'scroll-up-command)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "s-r") 'kill-word):
(global-set-key (kbd "s-y") 'cut-current-line)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x `") 'delete-window)
;(global-set-key (kbd "s-w") 'kill-buffer-and-window)
(global-set-key (kbd "s-w") 'kill-current-buffer)
(global-set-key (kbd "C-x w") 'kill-current-buffer)
(global-set-key (kbd "C-u") 'delete-current-line)
(global-set-key (kbd "M-DEL") 'backward-delete-word)
;; (global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-L") 'forward-word)
(global-set-key (kbd "C-s-l") 'move-end-of-line)
;; (global-set-key (kbd "s-j") 'backward-char)
(global-set-key (kbd "C-s-j") 'move-beginning-of-line)
(global-set-key (kbd "s-J") 'backward-word)
;; (global-set-key (kbd "s-i") 'previous-line)
;; (global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-n") 'set-mark-command)
(global-set-key (kbd "s-N") 'pop-to-mark-command)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-d") 'delete-char)
(global-set-key (kbd "s-p") 'org-export-dispatch)
(global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "<s-return>") (lambda () (interactive) (end-of-line) (newline-and-indent)))
(global-set-key (kbd "s-:") 'comment-or-uncomment-region)
(global-set-key (kbd "s-1") 'centaur-tabs-backward)
(global-set-key (kbd "C-r") 'centaur-tabs-backward)
(global-set-key (kbd "s-2") 'centaur-tabs-forward)
(global-set-key (kbd "C-t") 'centaur-tabs-forward)  
(global-set-key (kbd "s-`") 'centaur-tabs-backward-group)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "<f12>") 'company-mode)
(global-set-key (kbd "s-f") 'consult-line)
(global-set-key (kbd "C-x l") 'consult-line)
(global-set-key (kbd "C-c l") 'consult-grep)
(global-set-key (kbd "C-c C-k") 'cider-eval-all-files)
(global-set-key (kbd "C-/") 'shell-command)
(global-set-key (kbd "C-j") 'mc/mark-next-lines)
(global-set-key (kbd "C-w") 'delete-other-windows)
;;Package install  
(require
 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;			 ("nongnu" . "https://elpa.nongnu.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
;; (use-package auto-dim-other-buffers
;;   :init
;;   (add-hook 'after-init-hook (lambda ()
;;   (when (fboundp 'auto-dim-other-buffers-mode)
;;     (auto-dim-other-buffers-mode t)))))
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
  (setq dashboard-items '((recents  . 20)
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
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'modus-vivendi)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))
(with-eval-after-load "dired"
  (define-key dired-mode-map (kbd "<mouse-2>") #'dired-single-buffer-mouse)
  (define-key dired-mode-map (kbd "<RET>") #'dired-single-buffer))
(use-package dired-single
  :ensure t)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
;;Centaur-tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "box"
	centaur-tabs-height 8
	;;centaur-tabs-width 40
	centaur-tabs-set-icons t
	centaur-tabs-set-bar 'over
	centaur-tabs-label-fixed-length 20
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-close-button t
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*")
  (centaur-tabs-headline-match)
  (centaur-tabs-change-fonts "FiraCode NF" 100)
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
	((derived-mode-p 'clojure-mode)
	 "Clojure")
	((or (derived-mode-p 'eaf-mode)
	     (string-equal "*dashboard*" (substring (buffer-name)))
	     (derived-mode-p 'dired-mode))
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
 '(default ((t (:height 134 :family "FiraCode NF" :background "#17474F"))))
 '(auto-dim-other-buffers-face ((t (:background "#1E5C66"))))
 '(auto-dim-other-buffers-hide-face ((t (:background "#1E5C66" :foreground "#1E5C66"))))
 '(centaur-tabs-selected ((t (:background "#3AB2C5" :box (:line-width (1 . 1) :color "#3AB2C5") :height 120 :family "FiraCode NF"))))
 '(centaur-tabs-selected-tab ((t (:background "D8F0F3"))))
 '(centaur-tabs-unselected ((t (:background "#17474F" :foreground "grey50" :box (:line-width (1 . 1) :color "#17474F") :height 120 :family "FiraCode NF"))))
 '(company-echo ((t nil)) t)
 '(company-preview ((t (:background "#4A7880" :foreground "#e0e6f0"))))
 '(company-scrollbar-bg ((t (:background "orange1"))) t)
 '(company-scrollbar-fg ((t (:background "dark gray"))) t)
 '(company-tooltip ((t (:background "#315F67" :foreground "#a8a8a8"))))
 '(company-tooltip-scrollbar-thumb ((t (:background "dark gray"))))
 '(company-tooltip-scrollbar-track ((t (:background "orange1"))))
 '(company-tooltip-selection ((t (:background "orange3"))))
 '(consult-preview-line ((t (:inherit consult-preview-insertion :extend t :background "Orange" :foreground "gray100"))))
 '(cursor ((t (:background "OliveDrab1"))))
 '(fringe ((t (:background "#17474F" :foreground "#B53134"))))
 '(line-number-current-line ((t (:inherit (bold default) :background "#CF8388" :foreground "#161010"))))
 '(magit-section-highlight ((t (:extend t :background "#17474F"))))
 '(mode-line ((t (:background "#2E8E9E" :foreground "#f4f4f4" :box (:line-width (1 . 1) :color "#17474F") :overline nil :underline nil))))
 '(mode-line-inactive ((t (:background "#1E5C66" :foreground "#bebebe" :box (:line-width (1 . 1) :color "#1E5C66") :overline nil :underline nil :height 1.0))))
 '(modus-themes-intense-blue ((t (:background "#315F67" :foreground "#ffffff"))) t)
 '(modus-themes-reset-soft ((t (:extend nil :background "#17474F" :foreground "#ffffff" :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal))) t)
 '(org-block ((t (:inherit shadow :extend t :width extra-condensed))))
 '(org-block-begin-line ((t (:inherit modus-themes-fixed-pitch :extend t :background "#17474F" :foreground "#a8a8a8"))))
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
 '(region ((t (:extend t :background "#CF8388" :foreground "#161010"))))
 '(show-paren-match ((t (:background "light green" :foreground "#ffffff" :underline nil))))
 '(tab-bar ((t (:inherit nil :background "#1E5C66"))))
 '(tab-bar-tab ((t (:inherit bold :background "#1E5C66" :box (:line-width (2 . 2) :color "#0e0e0e")))))
 '(tab-line ((t (:inherit nil :background "#17474F" :box nil :overline nil :underline nil :height 0.95))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-black))))
 '(vertico-current ((t (:inherit bold :extend t :background "#CF8388" :foreground "#ffffff"))))
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
  :hook (clojure-mode . paredit-mode)
;;  :hook (rust-mode . paredit-mode)
  :bind (
	 ("s-<right>" . paredit-forward-slurp-sexp)
	 ("s-<left>" . paredit-backward-slurp-sexp)
	 ("M-<right>" . paredit-join-sexps)
	 ("M-<left>" . paredit-split-sexp)
	 ("M-<down>" . paredit-splice-sexp)))
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "DEL") nil)
     (define-key paredit-mode-map (kbd "C-j") nil)))
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
  ("C-c f" . consult-find)
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
;;   consult--source-file consult--source-project-file consult--source-bookmark
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
;; (use-package doom-modeline
;;   :init (doom-modeline-mode 1))
(setq doom-modeline-height 5)
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

(add-hook 'org-mode-hook 'org-indent-mode)
;;
;; company mode
;;
(setq company-require-match nil)
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
	'((company-files company-yasnippet 
			 company-keywords
			 company-capf)
	  (company-abbrev company-dabbrev))))
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (add-to-list (make-local-variable 'company-backends)
					       'company-elisp)))
;; (add-hook 'org-mode-hook (lambda ()
;; 			  (add-to-list (make-local-variable 'company-backends)
;; 				       'company-ispell)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil) 
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "e") nil)
  ;; (define-key company-active-map (kbd "SPC") #'company-abort)
  (define-key company-active-map (kbd "s-k") #'company-select-next)
  (define-key company-active-map (kbd "s-i") #'company-select-previous)
  )
(advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda () (when (equal my-company-point (point))
						    (yas-expand))))

(use-package lsp-mode
  :ensure t
  :defer t
  :hook (lsp-mode . (lambda ()
                      (let ((lsp-keymap-prefix "M-c l"))
                        (lsp-enable-which-key-integration))))
  :init
  (setq lsp-keep-workspace-alive nil
        lsp-signature-doc-lines 5
        lsp-idle-delay 0.5
        lsp-prefer-capf t
        lsp-client-packages nil
	lsp-headerline-breadcrumb-enable nil)
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-rust-analyzer-server-display-inlay-hints nil)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (define-key lsp-mode-map (kbd "M-c l") lsp-command-map)
  (define-key lsp-mode-map (kbd "s-l") nil)
  (define-key lsp-mode-map (kbd "c") nil)
 ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )
(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil))
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
  (org-bullets-bullet-list '("✥" "*" "◉" "○" "◈" "◇")))
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
;; (use-package flycheck
;;   :ensure t)
;;SHELL
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
 (setq exec-path-from-shell-variables '("PATH" "GOPATH"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH") ;;very important to go mode
  )
;; (use-package vterm)
;; (define-key vterm-mode-map (kbd "s-j") 'vterm-send-left)
;; (define-key vterm-mode-map (kbd "s-l") 'vterm-send-right)
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
;; (use-package go-mode
;;   :ensure t
;;   :mode (("\\.go\\'" . go-mode))
;;   :hook ((before-save . gofmt-before-save))
;;   :config
;;   (setq gofmt-command "goimports")
;;   (setq exec-path (append exec-path '("/usr/local/bin")))
;;   (setq exec-path (append exec-path '("/Users/iceonfire/go/bin:/Users/iceonfire/go")))
;;   (use-package company-go
;;     :ensure t
;;     :config
;;     (add-hook 'go-mode-hook (lambda ()
;; 			      (add-to-list (make-local-variable 'company-backends)
;; 					   '(company-go company-files company-capf))))
;;     )
;;   (use-package go-eldoc
;;     :ensure t
;;     :hook (go-mode . go-eldoc-setup)
;;     )
;;   (use-package go-guru
;;     :ensure t
;;     :hook (go-mode . go-guru-hl-identifier-mode)
;;     )
;;   (use-package go-rename
;;     :ensure t)
;;   (use-package gotest
;;     :defer 2
;;     :after go-mode)
;;   )

;;python mode
;; (use-package python-mode
;;   :ensure t
;;   :custom
;;   (python-shell-internal "python3"))

;; (use-package jedi-core
;;   :ensure t)
;; (setq python-shell-completion-native-enable nil)
;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (add-hook 'python-mode-hook (lambda ()
;; 				(add-to-list (make-local-variable 'company-backends)
;; 					     'company-jedi)))
;;   )
;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable)
;;   )

;; javascript
(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'")
(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (tide-hl-identifier-mode +1)
  (company-mode +1))
(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (rjsx-mode . setup-tide-mode))
(use-package prettier-js
  :ensure t
  :after (rjsx-mode)
  :hook (rjsx-mode . prettier-js-mode))

;;ox-confluece (install org)
;;(require 'ox-confluence)
;;(require 'ov-highlight)
;;EAF
;(use-package quelpa-use-package)
;; Don't forget to run M-x eaf-install-dependencies
;(use-package eaf 
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser) ;Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :init
;;   (use-package epc      :defer t :ensure t)
;;   (use-package ctable   :defer t :ensure t)
;;   (use-package deferred :defer t :ensure t)
;;   (use-package s        :defer t :ensure t)
;;   (setq browse-url-browser-function 'eaf-open-browser)
;;    :config
;;    (defalias 'browse-web #'eaf-open-browser)
;;    ;; (eaf-bind-key eaf-send-down-key "s-k" eaf-app-keybiding)
;;    ;; (eaf-bind-key eaf-send-up-key "s-i" eaf-app-keybiding)
;;    ;; (eaf-bind-key eaf-send-return-key "s-m" eaf-app-keybiding)		;
;;    ;; ;(eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;    ;; (eaf-bind-key scroll_down "s-i" eaf-pdf-viewer-keybinding)
;;    ;; (eaf-bind-key scroll_up "s-k" eaf-pdf-viewer-keybinding)
;;   ;(eaf-bind-key take_photo "p" eaf-camera-keybinding)
;; 					;(eaf-bind-key nil "M-q" eaf-browser-keybinding)
;;   )
;;(require 'eaf-browser)
;(require 'eaf-pdf`-viewer)
;;google translate
;; (require 'go-translate) 
;; (setq go-translate-base-url "https://translate.google.cn")
;; (setq go-translate-target-language "en")
;; (setq go-translate-local-language "zh-CN")
;; (defun go-translate-token--extract-tkk ()
;;   (cons 430675 2721866133))
;; (global-set-key "\C-cT" 'go-translate)
;; (global-set-key "\C-ct" 'go-translate-popup)
;; (setq go-translate-inputs-function #'go-translate-inputs-current-or-prompt)
;; (setq go-translate-buffer-follow-p t)

;;matrix
;; Install `plz' HTTP library (not on MELPA yet).

;; Install and load `quelpa-use-package'.

(package-install 'quelpa-use-package)
(require 'quelpa-use-package)

(use-package plz
  :quelpa (plz :fetcher github :repo "alphapapa/plz.el"))

;; Install Ement.
(use-package ement
  :quelpa (ement :fetcher github :repo "alphapapa/ement.el"))

;;doom-themes
;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-one t)
;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))
;;epa keyq
(setq-local epa-file-encrypt-to '("iceonfirekun@163.com"))
(setq epa-file-select-keys 1)
(setf epa-pinentry-mode 'loopback)

;;inline todo list
(require 'org-inlinetask)
;;Emacs Predictive Completion
;; predictive install location
;; (add-to-list 'load-path "~/.emacs.d/predictive/")
;; ;; dictionary locations
;; (add-to-list 'load-path "~/.emacs.d/predictive/latex/")
;; (add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
;; (add-to-list 'load-path "~/.emacs.d/predictive/html/")
;; ;; load predictive package
;; (autoload 'predictive-mode "~/.emacs.d/predictive/predictive"
;;   "Turn on Predictive Completion Mode." t)
;; (setq ispell-program-name "aspell")
;; (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=16"))
;; (setq ispell-complete-word-dict
;;   (expand-file-name (concat user-emacs-directory "aspell_words.txt")))
;; load-file ox-reveal.el
;;(require 'ox-reveal)
(setq org-reveal-root "file:////Users/iceonfire/reveal.js")
;;spell-fu
;; (use-package spell-fu)
;; (global-spell-fu-mode)
;;; init.el ends here
(defun copy-isearch-match ()
    (interactive)
    (copy-region-as-kill isearch-other-end (point)))
(setenv "CHEZSCHEMELIBDIRS" "/Users/iceonfire/scheme/lib:")
(setenv "CHEZSCHEMELIBEXTS" ".sc::.so:")

;;taskjuggler.
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")
(setenv "LANGUAGE" "en_US.UTF-8")
(setenv "LC_COLLATE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "LC_MESSAGES" "en_US.UTF-8")
(setenv "LC_MONETARY" "en_US.UTF-8")
(setenv "LC_NUMERIC" "en_US.UTF-8")
(setenv "LC_TIME" "en_US.UTF-8")

;; (defvar infu-bionic-reading-face nil "a face for `infu-bionic-reading-region'.")

;; (setq infu-bionic-reading-face 'bold)
;; (setq infu-bionic-reading-face 'typescript-jsdoc-tag)
;; (setq infu-bionic-reading-face-2 'all-the-icons-lgreen)
;; try
;; 'bold
;; 'error
;; 'warning
;; 'highlight
;; or any value of M-x list-faces-display
;; bionic-reading
;; (defun infu-bionic-reading-buffer ()
;;   (interactive)
;;   (infu-bionic-reading-region (point-min) (point-max)))

;; (defun infu-bionic-reading-region (Begin End)
;;   (interactive "r")
;;   (let (xBounds xWordBegin xWordEnd  )
;;     (save-restriction
;;       (narrow-to-region Begin End)
;;       (goto-char (point-min))
;;       (while (forward-word)
;;         ;; bold the first half of the word to the left of cursor
;;         (setq xBounds (bounds-of-thing-at-point 'word))
;;         (setq xWordBegin (car xBounds))
;;         (setq xWordEnd (cdr xBounds))
;; 	;;        (setq xBoldEndPos (+ xWordBegin (1+ (/ (- xWordEnd xWordBegin) 2))))
;; 	(setq xBoldEndPos (+ xWordBegin 3))
;; ;;	(put-text-property xWordBegin xBoldEndPos
;; ;;                           'font-lock-face infu-bionic-reading-face-2)
;;         (put-text-property xBoldEndPos xWordEnd
;;                            'font-lock-face infu-bionic-reading-face)))))
(use-package expand-region
  :bind ("C-=" . er/expand-region))
(setq er--show-expansion-message t)
(eval-after-load 'rust-mode  '(require 'js-mode-expansions))
;; (use-package paradox
;;   :init
;;   (setq paradox-github-token t)
;;   (setq paradox-execute-asynchronously t)
;;   (setq paradox-automatically-star t))
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))
;;latex
(setenv "PATH" (concat ":/Library/TeX/texbin/" (getenv "PATH")))
(add-to-list 'exec-path "/Library/TeX/texbin/")
(defun my/text-scale-adjust-latex-previews ()
  "Adjust the size of latex preview fragments when changing the
buffer's text scale."
  (pcase major-mode
    ('latex-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'category)
               'preview-overlay)
           (my/text-scale--resize-fragment ov))))
    ('org-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'org-overlay-type)
               'org-latex-overlay)
           (my/text-scale--resize-fragment ov))))))

(defun my/text-scale--resize-fragment (ov)
  (overlay-put
   ov 'display
   (cons 'image
         (plist-put
          (cdr (overlay-get ov 'display))
          :scale (+ 1.0 (* 0.25 text-scale-mode-amount))))))

(add-hook 'text-scale-mode-hook #'my/text-scale-adjust-latex-previews)
(setq org-latex-create-formula-image-program 'dvisvgm)
(setq org-babel-clojure-backend 'cider)

(defun dired-pandoc-docx-org ()
  (interactive)
  (dired-do-async-shell-command
   "pandoc -f docx -t org --wrap=none" current-prefix-arg
   (dired-get-marked-files t current-prefix-arg)))

;;insert date
(defun insert-time ()
  (interactive)
  (insert ";;" (shell-command-to-string "date")))

;;rust
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))
(use-package rust-mode
  :ensure t
  :hook ((rust-mode . flycheck-mode)
	 (rust-mode . paredit-mode)
	 (rust-mode . lsp-deferred))
;;  :bind (("<f6>" . my/rust-format-buffer))
  :config
  (require 'rust-rustfmt)
  (rust-enable-format-on-save)
  (defun my/rust-format-buffer ()
    (interactive)
    (rust-format-buffer)
    (save-buffer))
  (defun rust-run-autosave ()
    (interactive)
    (rust-format-buffer)
    (save-buffer)
    (rust-run))
  (defun rust-test-autosave ()
    (interactive)
    (save-buffer)
    (rust-format-buffer)
    (rust-test))
  (require 'lsp-rust)
  (setq lsp-rust-analyzer-completion-add-call-parenthesis nil
	lsp-rust-analyzer-proc-macro-enable t))
(eval-after-load 'rust-mode (load-library "rust-mode"))
(define-key rust-mode-map (kbd "C-c C-r") 'rust-run-autosave)
(define-key rust-mode-map (kbd "C-c C-t") 'rust-test-autosave)
(define-key rust-mode-map (kbd "s-s") 'my/rust-format-buffer)
(define-key rust-mode-map (kbd "C-y") 'lsp-extend-selection)
(define-key rust-mode-map (kbd "<C-return>") (lambda () (interactive) (end-of-line) (paredit-semicolon) (newline-and-indent)))
(defun paredit-comma (&optional n)
  (interactive "p")
  (if (or (paredit-in-string-p) (paredit-in-comment-p))
      (insert (make-string (or n 1) ?\, ))
    (if (paredit-in-char-p)
        (backward-char 2))
    (let ((line-break-point (paredit-semicolon-find-line-break-point)))
      (if line-break-point
          (paredit-semicolon-with-line-break line-break-point (or n 1))
          (insert (make-string (or n 1) ?\, ))))))
(define-key rust-mode-map (kbd "C-,") (lambda () (interactive) (end-of-line) (paredit-comma) (newline-and-indent)))
(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
;;


;; (use-package rustic
;;   :ensure
;;   :bind (:map rustic-mode-map
;;               ("M-j" . lsp-ui-imenu)
;;               ("M-?" . lsp-find-references)
;;               ("C-c C-c l" . flycheck-list-errors)
;;               ("C-c C-c a" . lsp-execute-code-action)
;;               ("C-c C-c r" . lsp-rename)
;;               ("C-c C-c q" . lsp-workspace-restart)
;;               ("C-c C-c Q" . lsp-workspace-shutdown)
;;               ("C-c C-c s" . lsp-rust-analyzer-status)
;;               ("C-c C-c e" . lsp-rust-analyzer-expand-macro)
;;               ("C-c C-c d" . dap-hydra)
;;               ("C-c C-c h" . lsp-ui-doc-glance))
;;   :config
;;   ;; uncomment for less flashiness
;;   ;; (setq lsp-eldoc-hook nil)
;;   ;; (setq lsp-enable-symbol-highlighting nil)
;;   ;; (setq lsp-signature-auto-activate nil)

;;   ;; comment to disable rustfmt on save
  ;;(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)
(use-package rust-playground
  :config
  (setq rust-playground-basedir (expand-file-name "~/Exercism/playground"))
  ;; :hook
  ;; (rust-mode . rust-playground-mode)
  ;; :bind (:map rust-playground-mode-map
  ;;             ("C-c C-c" . rust-playground-exec)
  ;;             ("C-c b" . rust-playground-switch-between-cargo-and-main)
  ;;             ("C-c k" . rust-playground-rm))
;;  (add-hook 'rust-playground-mode-hook #'my/rust-playground-hook)
  )
(use-package toml-mode :ensure)
(use-package racer
  :defer t
  :after rust-mode
  :hook
  (racer-mode . eldoc-mode))
;;; racer-mode for getting IDE like features for rust-mode
;; https://github.com/racer-rust/emacs-racer


;;dap
;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(with-eval-after-load 'lsp-rust
    (require 'dap-cpptools))

(with-eval-after-load 'dap-cpptools
    ;; Add a template specific for debugging Rust programs.
    ;; It is used for new projects, where I can M-x dap-edit-debug-template
    (dap-register-debug-template "Rust::CppTools Run Configuration"
                                 (list :type "cppdbg"
                                       :request "launch"
                                       :name "Rust::Run"
                                       :MIMode "gdb"
                                       :miDebuggerPath "/usr/local/bin/rust-gdb"
                                       :environment []
                                       :program "${workspaceFolder}/target/debug/${projectname}"
                                       :cwd "${workspaceFolder}"
                                       :console "external"
                                       :dap-compilation "cargo build"
                                       :dap-compilation-dir "${workspaceFolder}")))

  (with-eval-after-load 'dap-mode
    (setq dap-default-terminal-kind "integrated") ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
    (dap-auto-configure-mode +1))


;;exercism
(use-package exercism
  :ensure t)
;;electric pair


(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?\< . ?\>)
			    (?\' . ?\')))
;;initial window size

(use-package golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)
(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

;;windows ratio

