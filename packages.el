;;; config.el --- W3M Layer configuration File for Spacemacs
;;
;; Copyright (c) 2012-2014 venmos
;; Copyright (c) 2014-2015 venmos
;;
;; Author: Kuroi Mato <venmos@fuck.gfw.es>
;; URL: https://github.com/venmos/w3m-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq w3m-packages
      '(
        w3m
        helm-w3m
        ))

(defun w3m/init-helm-w3m ()
  "Initializes helm-w3m and adds keybindings for its exposed functionalities."
  (use-package helm-w3m
    :commands (helm-w3m-bookmarks)
    :init
    (progn
      (evil-leader/set-key
        "awb" 'helm-w3m-bookmarks))))

(defun w3m/init-w3m()
  "Initializes w3m and adds keybindings for its exposed functionalities."
  (use-package w3m
    :commands (w3m-goto-url
               w3m-search
               )
    :init
    (progn
      (evil-leader/set-key
        "awg" 'w3m-goto-url
        "aws" 'w3m-search
        ))))

(with-eval-after-load 'w3m
  (define-key w3m-mode-map (kbd "C-f") 'evil-scroll-page-down)
  (define-key w3m-mode-map (kbd "C-b") 'evil-scroll-page-up)
  (define-key w3m-mode-map (kbd "SPC") 'evil-evilified-state))


(setq w3m-home-page "http://www.google.com")
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-view-this-url-new-session-in-background t)
