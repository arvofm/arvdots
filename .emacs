;; best config ever

;; remove annoyances
(setq custom-file "~/.emacs-custom.el")
(load-file custom-file)
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq dired-kill-when-opening-new-dired-buffer t)
(keymap-unset minibuffer-local-completion-map "SPC")
(keymap-unset minibuffer-local-completion-map "?")

;; looks
(setq-default initial-buffer-choice "~/docs/notes/life/nowaways/activities.org")
(custom-set-faces
 '(trailing-whitespace ((t (:foreground "#261824" :background nil :strike-through "#FF4075")))) )


;; for comfi
(fido-mode t)

;; [editing]
(setq-default duplicate-line-final-position 1)

;; fill
(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of fill-paragraph."
  (interactive)
  (let ((fill-column most-positive-fixnum))
    (fill-paragraph)))

;; electromagnetics
(electric-pair-mode 1)
(electric-layout-mode 1)

;; match paren
(setq-default show-paren-context-when-offscreen t)
(setq-default show-paren-when-point-inside-paren t)

;; basic editing
(setq-default shift-select-mode nil)
(setq-default show-trailing-whitespace t) ; face: trailing-whitespace
(add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))

;; [mapping]
(keymap-global-set "C-x C-o" 'duplicate-line)			;; old val: delete-blank-lines
(keymap-global-set "M-g g" 'search-forward)			;; old val: goto-line
(keymap-global-set "M-g M-g" 'search-backward)			;; old-val: M-g g, what a waste
(keymap-global-set "C-M-q" 'unfill-paragraph)
(global-set-key [remap zap-to-char] 'zap-up-to-char)		;; M-z
(global-set-key [remap dabbrev-expand] 'hippie-expand)		;; M-/

;; [org]
(setq-default org-hide-emphasis-markers t
	      org-image-actual-width '(300)
	      org-startup-indented t
	      org-insert-heading-respect-content t
	      org-use-sub-superscripts "{}") ; limits applying sub and superscripts to characters between curly braces
(setq-default org-format-latex-options '(:foreground auto :background "Transparent" :scale 2))
(use-package org-modern
:hook
(org-mode . global-org-modern-mode)
:custom
(org-modern-keyword nil)
(org-modern-checkbox nil)
(org-modern-table nil)
(org-modern-todo nil))

;; [melpa]
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; [backups]
;; Store backup files in a directory
(make-directory "~/.emacs.d/backup/" t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backup/" user-emacs-directory))))
(setq backup-by-copying t      ; Don't clobber symlinks
      delete-old-versions t    ; Clean up old backups
      kept-new-versions 3      ; Keep 3 newest versions
      kept-old-versions 2      ; Keep 2 oldest versions
      version-control t)       ; Use versioned backups

;; Notes
;;
;; Check the value of a variable
;; ex: (default-value 'electric-mode)
