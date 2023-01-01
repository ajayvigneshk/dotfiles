(require 'package)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))
(package-initialize)
; (package-refresh-contents)


;; Download Org
(unless (package-installed-p 'org)
  (package-install 'org))

;;  Enable Org
(require 'org)

;; add more TODO states
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; Org mode mappings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Other stuff from org mode
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
;;(normal-erase-is-backspace-mode 1)

;; conflicts with org mode
(eval-after-load "evil-maps"
  (progn
    (define-key evil-insert-state-map (kbd "S-<right>") nil)
    (define-key evil-insert-state-map (kbd "S-<left>") nil)))

;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(keyboard-translate ?\C-h ?\C-?)  ; translate 'C-h' to DEL
(keyboard-translate ?\C-? ?\C-h)  ; translate DEL to 'C-h'.

;; fonts
(set-frame-font "JetBrainsMono Nerd Font-20" nil t)


;; redo functionality
(evil-set-undo-system 'undo-redo)
;; DOES NOT WORK enable redo in evil mode
; (use-package undo-tree
;   :ensure t
;   :after evil
;   :diminish
;   :config
;   (evil-set-undo-system 'undo-tree)
;   (global-undo-tree-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" default))
 '(org-agenda-files nil)
 '(package-selected-packages '(solarized-theme evil sml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; themes
(load-theme 'solarized-light t)
