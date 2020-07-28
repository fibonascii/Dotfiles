;; ------ Package Installations ----------------- ;;

(require 'package)

;; Add melpa to package archives.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the packages are loaded before
;; you start trying to modify them.  This also sets the load path.
(package-initialize)

;; Install 'use-package' if it is not installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
;; ----------- Helm Setup ----------------------- ;;
(require 'helm-config)

;; Unbind meta and replace with helm meta
(global-set-key (kbd "M-x") #'helm-M-x)

;; Reset helm command prefix
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; Rebind find file to helm find files
(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Enable Helm Mode
(helm-mode 1)

;; ----------- Evil Mode ----------------------- ;;
(require 'evil)
(evil-mode 1)

;; ---------- YaSnippet Configuration ----------- ;;

(yas-reload-all)
(add-hook 'python-mode-hook)
;; The above code is to disable yas globally and add as a minor mode hook
;; That way it will only load yasnippet in the modes that it's needed

;; ----------- Set Theme and Appearance --------- ;;

(use-package doom-themes
	     :config
	     ;; Global Settings (defaults)
	     (setq doom-themes-enable-bold t ; if nil, bold is universally disabled
		   doom-themes-enable-italic t) ; if nil, italics are universally disabled
	     (load-theme 'doom-one t)

	     ;; Enable flashing mode-line on errors
	     (doom-themes-visual-bell-config)

	     ;; Corrects and improves org-modes native fontification
	     (doom-themes-org-config))

;; ----------- Powerline        ------------------ ;;
(require 'powerline)
(powerline-vim-theme)

;; ----------- General Defaults ------------------ ;;

(setq-default 
 ;; Disable startup message
 inhibit-startup-message t

 ;; Highlight line mode
 global-hl-line-mode t

 ;; Line Number Mode
 line-number-mode t)

;; Remap C-x-o to M-o. Much easier
(global-set-key (kbd "M-o") 'other-window)

;; --------- Disable Unnecessary UI Elements -------- ;;
(progn
  ;; Disable Tool Bar
  (tool-bar-mode -1)

  ;; Disable Menu Bar
  (menu-bar-mode -1)

  ;; Disable scroll bar
  (scroll-bar-mode -1))

;; -------- Change Behavior --------------- ;;

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; ----------- Better General Use Case Keyboard Defaults --------- ;;

(defun toggle-comment-on-line ()
  "Comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet chef-mode nov engine-mode python-mode magit powerline evil helm doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
