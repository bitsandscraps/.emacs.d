(setq straight-recipes-gnu-elpa-use-mirror t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; load org
(require 'subr-x)
(straight-use-package 'git)

(defun org-git-version ()
  "The Git version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun org-release ()
  "The release version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(provide 'org-version)

(straight-use-package 'org)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(inhibit-startup-screen t)
 '(org-directory "~/Dropbox/org")
 '(safe-local-variable-values
   (quote
    ((eval setq student-numbers
	   (quote
	    ("20110957" "20111063" "20120171" "20130430" "20130478" "20140106" "20140199" "20140350" "20140527" "20140672" "20150208" "20150365" "20150383" "20150938" "20150957" "20160309" "20160441" "20170250" "20170766" "20174396" "20175246" "20175487" "20175540" "20176140" "20183026" "20183076" "20183086" "20183141" "20183147" "20183164" "20183180" "20183308" "20183367" "20183370" "20183372" "20183391" "20183411" "20183416" "20183439" "20183455" "20183467" "20183532" "20183542" "20183548" "20183629" "20183660" "20183678" "20184257" "20184305" "20184374" "20184396" "20184402" "20184598" "20184599" "20184623" "20185545" "20185593" "20186392" "20187053")))
     (eval add-to-list
	   (quote company-backends)
	   (function bas/company-backend-complete-student-numbers))
     (eval setq list_of_student_numbers
	   (quote
	    ("20110957" "20111063" "20120171" "20130430" "20130478" "20140106" "20140199" "20140350" "20140527" "20140672" "20150208" "20150365" "20150383" "20150938" "20150957" "20160309" "20160441" "20170250" "20170766" "20174396" "20175246" "20175487" "20175540" "20176140" "20183026" "20183076" "20183086" "20183141" "20183147" "20183164" "20183180" "20183308" "20183367" "20183370" "20183372" "20183391" "20183411" "20183416" "20183439" "20183455" "20183467" "20183532" "20183542" "20183548" "20183629" "20183660" "20183678" "20184257" "20184305" "20184374" "20184396" "20184402" "20184598" "20184599" "20184623" "20185545" "20185593" "20186392" "20187053")))
     (list_of_student_numbers quote
			      ("20110957" "20111063" "20120171" "20130430" "20130478" "20140106" "20140199" "20140350" "20140527" "20140672" "20150208" "20150365" "20150383" "20150938" "20150957" "20160309" "20160441" "20170250" "20170766" "20174396" "20175246" "20175487" "20175540" "20176140" "20183026" "20183076" "20183086" "20183141" "20183147" "20183164" "20183180" "20183308" "20183367" "20183370" "20183372" "20183391" "20183411" "20183416" "20183439" "20183455" "20183467" "20183532" "20183542" "20183548" "20183629" "20183660" "20183678" "20184257" "20184305" "20184374" "20184396" "20184402" "20184598" "20184599" "20184623" "20185545" "20185593" "20186392" "20187053")))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal))))
 '(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button) :height 0.8)))))
