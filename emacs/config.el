;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dhruv Patel"
      user-mail-address "predaking2612@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "Jetbrains Mono" :size 14))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-dark+)
(setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'vs-dark-theme)
; (load-theme 'naysayer t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Indentation
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(add-hook 'python-mode-hook
	(lambda ()
	(setq indent-tabs-mode t)
	(setq python-indent 4)
	(setq tab-width 4))
	(tabify (point-min) (point-max)))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq flycheck-check-syntax-automatically
      '(save-mode-enable))

;; Clang - Format
(add-hook 'c-mode-common-hook
	  (function (lamda ()
		 (add-hook (make-local-variable 'before-save-hook)
			   'clang-format-buffer))))
(defun format-and-save()
	(interactive)
	(clang-format-buffer)
	(save-buffer))

;; Auto-format: Similar to Vim
(defun clang-format-save-hook-for-this-buffer ()
  "Create a buffer local save hook."
  (add-hook 'before-save-hook
	    (lambda ()
	      (progn
		(when (locate-dominating-file "." ".clang-format")
		  (clang-format-buffer))
		nil))
	    nil
	    t))

(add-hook 'c-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
(add-hook 'c++-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
(add-hook 'glsl-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))


;; Bash Support
(use-package lsp-mode
  :commands lsp
  :hook
  (sh-mode . lsp))

;; Assembly Support
(defun assembly-hook ()
  (local-unset-key (vector asm-comment-char))
  (electric-indent-local-mode)
  (defun asm-calculate-indentation ()
    (or
     (and (looking-at "[.@_[:word:]]+:") 0)
     (and (looking-at "\\s<\\s<\\s<") 0)
     (and (looking-at "%") 0)
     (and (looking-at "c?global\\|section\\|default\\|align\\|INIT_..X") 0)
     (or 4)))
  )
(add-hook 'asm-mode-hook #'assembly-hook)

(add-to-list 'default-frame-alist
	     '(inhibit-double-buffering . t))

