;;;;;;;;;;;;
; Packages ;
;;;;;;;;;;;;

; Package sources
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

; Evil Emacs
(require 'evil)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;
; Custom Funtions ;
;;;;;;;;;;;;;;;;;;;

(defun reload-pdfOLD ()
  (interactive
  (let* ((fname buffer-file-name)
        (fname-no-ext (substring fname 0 -4))
        (pdf-file (concat fname-no-ext ".pdf"))
        (cmd (format "pdflatex %s" fname)))
    (delete-othe1r-windows)
    (split-window-horizontally)
    (split-window-vertically)
    (shell-command cmd)
    (other-window 2)
    (find-file pdf-file)
    (balance-windows))))

(defun reload-pdf ()
  (interactive
  (let* ((fname buffer-file-name)
        (fname-no-ext (substring fname 0 -4))
        (pdf-file (concat fname-no-ext ".pdf")))
    (find-file pdf-file)
    (balance-windows))))

;;;;;;;;;;;;;;;;;;;
; Custom Keybinds ;
;;;;;;;;;;;;;;;;;;;

; for custom funtion
(global-set-key "\C-x\p" 'reload-pdf)

; Disable arrow keyes
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

; Make META+hjkl switch windows
          (define-key evil-normal-state-map "\M-h" 'evil-window-left)
          (define-key evil-normal-state-map "\M-j" 'evil-window-down)
          (define-key evil-normal-state-map "\M-k" 'evil-window-up)
          (define-key evil-normal-state-map "\M-l" 'evil-window-right)
