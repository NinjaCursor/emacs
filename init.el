(setq inhibit-startup-message t)
(setq default-directory "c:/Users/jacob/Notes")
(cd "c:/Users/jacob/Notes")


;;prevent emacs from saving to current directory
(setq auto-save-interval 20)
;;(setq mySaveVariable

;;(setq auto-save-file-name-transforms '((".*" (concat (file-name-directory buffer-file-name) ".emacs-saves/\\2") t)))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves/\\2" t)))



;;makes shift tab work
(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))



;;load org-journal from file since mep
(add-to-list 'load-path "C:/Users/jacob/Documents/Emacs/")

(load "Packages/org-journal/org-journal.el")

;;org-journal for da



;;set file header for each daily notes
(setq org-journal-file-header (concat
			       "#+TODO: TODO(t) STARTED(s) WAITING(w) | DONE(d) CANCELED(c)\n"
			       "#+TAGS: { @school(c)  @housekeeping(h) @stuff(s) }\n"
			       "#+STARTUP: indent\n"))





;;(concat (file-name-directory buffer-file-name) "asdf")
				       
;; no startup msg

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;enable packages to be installed from melpa
(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.milkbox.net/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#ffffff" "#37ffff" "#e074e3" "#3732ff" "#ffff0b" "#37ff3c" "#ff400b" "#848088"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("f3b2a32914eebbc95b08f04d4377ed8b51205037082a5f20686c0c1aad2cce89" "5f1bd7f67dc1598977e69c6a0aed3c926f49581fdf395a6246f9bc1df86cb030" "3f5f69bfa958dcf04066ab2661eb2698252c0e40b8e61104e3162e341cee1eb9" default)))
 '(hl-sexp-background-color "#33323e")
 '(package-selected-packages
   (quote
    (use-package eyebrowse org-journal dracula-theme leuven-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;org mode keybinding for showing all nodes
(add-hook 'org-mode-hook (lambda ()
                           (local-set-key (kbd "C-c s") 'org-show-subtree)))

(require 'org-journal)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Notes/work.org"
                             "~/Notes/school.org" 
                             "~/Notes/home.org"))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link)


(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))
x
