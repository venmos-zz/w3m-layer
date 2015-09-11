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

;; Variables

(setq w3m/key-binding-prefixes '(("aw" . "applications-w3m")))
(mapc (lambda (x) (spacemacs/declare-prefix (car x) (cdr x)))
      w3m/key-binding-prefixes)
