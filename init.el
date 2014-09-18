(setq ns-use-srgb-colorspace t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'default-frame-alist '(alpha . (90 70)))
(setq ns-use-native-fullscreen nil)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-lisp
                      ;; Clojure & friends
                      clojure-mode
                      ;;nrepl
                      cider
                      rainbow-delimiters
                      ;; Project navigation
                      ;;projectile
                      ;;project-explorer
                      ack-and-a-half
                      ;; Misc.
                      markdown-mode
                      twilight-theme
                      hlinum
                      color-theme
                      exec-path-from-shell
                      scala-mode2
                      ensime
                      tree-mode
		      paredit
		      iflipb
          move-text
          multiple-cursors
          monokai-theme)
  "A list of packages to ensure are installed at launch.")

;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'windata)
;(require 'dirtree)
;(require 'move-text)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(exec-path-from-shell-initialize)

;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))

(if (display-graphic-p)
 (progn
   (set-face-attribute 'default nil :font "Consolas-12")
   (load-theme 'monokai t))
 (set-face-background 'default "nil"))
;(load-theme 'deeper-blue t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:inherit nil :foreground "light pink" :background nil))))
 '(font-lock-warning-face ((t (:inherit nil :foreground "red" :background nil))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))) t)
 '(show-paren-match ((((class color) (background dark)) (:inherit nil :foreground "red")))))


;;(global-set-key [M-left] 'windmove-left)          ; move to left windnow
;;(global-set-key [M-right] 'windmove-right)        ; move to right window
;;(global-set-key [M-up] 'windmove-up)              ; move to upper window
;;(global-set-key [M-down] 'windmove-down)          ; move to downer window
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("913dbc7c5f6919c9fe77e743044a06b018c519ef4f638d99caccf9814e304539" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" default)))
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (whitespace-line-column . 80)
     (lexical-binding . t)))))

(global-set-key (kbd "<C-tab>") 'iflipb-next-buffer)
(global-set-key (kbd "<C-M-tab>") 'iflipb-previous-buffer)
(setq iflipb-wrap-around t)

(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;;(define-key input-decode-map "\e\eOA" [(meta up)])
;;(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key (kbd "ESC <up>") 'move-text-up)
(global-set-key (kbd "ESC <down>") 'move-text-down)
(global-set-key (kbd "<M-S-up>") 'move-text-up)
(global-set-key (kbd "<M-S-down>") 'move-text-down)

(move-text-default-bindings)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-auto-revert-mode t)
