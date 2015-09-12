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

(defun v/w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address (default: google.com):" nil nil "google.com" nil )))
  (w3m-goto-url
   (concat "http://" site)))

(defun v/w3m-open-site-new-session (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address (default: google.com):" nil nil "google.com" nil )))
  (w3m-goto-url-new-session
   (concat "http://" site)))

(defun w3m/init-w3m()
  "Initializes w3m and adds keybindings for its exposed functionalities."
  (use-package w3m
    :commands (v/w3m-open-site
               w3m-goto-url
               w3m-goto-url-new-session
               w3m-search
               w3m-search-new-session
               )
    :init
    (progn
      (evil-leader/set-key
        "awo" 'v/w3m-open-site
        "awg" 'w3m-goto-url
        "awG" 'w3m-goto-url-new-session
        "aws" 'w3m-search
        "awS" 'w3m-search-new-session
        ))))

(with-eval-after-load 'w3m
  (define-key w3m-mode-map (kbd "C-f") 'evil-scroll-page-down)
  (define-key w3m-mode-map (kbd "C-b") 'evil-scroll-page-up)
  (define-key w3m-mode-map (kbd "SPC") 'evil-evilified-state))

(defun v/init-w3m ()
  (use-package w3m
    :init
    (progn
      (setq-default browse-url-browser-function 'w3m-goto-url-new-session)
      (setq-default w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533."))))
