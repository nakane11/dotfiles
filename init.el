(setq initial-scratch-message 'nil)

(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-g" 'goto-line)
(global-unset-key "\C-o" )

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(setq initial-scratch-message 'nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (xclip))))

(require 'xclip)
(xclip-mode 1)

(setq rosdistro (getenv "ROS_DISTRO"))
(add-to-list 'load-path (format "/opt/ros/%s/share/emacs/site-lisp" (or rosdistro "melodic")))
(require 'rosemacs)
(invoke-rosemacs)


(add-to-list 'load-path "/opt/ros/melodic/share/euslime")
(require 'euslime-config)
(setq inferior-euslisp-program "roseus")
(slime-setup '(slime-fancy slime-banner slime-repl-ansi-color))

(setq-default tab-width 4 indent-tabs-mode nil)
(global-set-key "\C-x\C-r" ros-keymap)

;; (define-minor-mode inaba-mode
;;   "Toggle font size"
;;   :lighter " inaba"
;;   (if inaba-mode
;;       (set-face-attribute 'default nil :font "UbuntuMono-26")
;;     (set-face-attribute 'default nil :font "UbuntuMono-14")))


(when (require 'nxml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.launch$" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
