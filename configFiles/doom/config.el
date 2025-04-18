(setq doom-font (font-spec :family "JetBrains Mono NL" :size 15)
      doom-symbol-font (font-spec :family "Symbols Nerd Font" :size 10))

(setq doom-theme 'doom-one)

(global-display-line-numbers-mode t)  ; Activa los números de línea globalmente
(setq display-line-numbers-type 'relative)  ; Configura los números de línea relativos

;;(setq-default truncate-lines non-nil)
;;(setq-default toggle-truncate-lines l) ;; esta tambien funciona pero he preferido activar la otra.
;;(add-hook 'c-mode-hook (lambda () (setq truncate-lines nil)))
;;(add-hook 'latex-mode-hook (lambda () (setq truncate-lines t)))
(defun my-c-mode-config ()
  "Called in `c-mode-hook'."
  (setq truncate-lines nil))

(add-hook 'c-mode-hook #'my-c-mode-config)

;; Ensure we're in a Wayland session with cliphist available
(when (executable-find "cliphist")

  ;; Copy to clipboard using cliphist
  (defun copy-to-clipboard (start end)
    (interactive "r")
    (let ((selection (buffer-substring-no-properties start end)))
      (call-process-region start end "cliphist" nil nil nil "store")
      (message "Copied to clipboard!")))

  ;; Paste from clipboard using cliphist
  (defun paste-from-clipboard ()
    (interactive)
    (let ((output (shell-command-to-string "cliphist list | head -n 1 | cliphist decode")))
      (insert output)))

  ;; Bind to keys
  (global-set-key (kbd "C-c M-i") 'copy-to-clipboard)
  (global-set-key (kbd "C-c M-p") 'paste-from-clipboard))

(setq
   ;; org-fancy-priorities-list '("[A]" "[B]" "[C]")
   ;; org-fancy-priorities-list '("❗" "[B]" "[C]")
   org-fancy-priorities-list '("🟥" "🟧" "🟨")
   org-priority-faces
   '((?A :foreground "#ff6c6b" :weight bold)
     (?B :foreground "#98be65" :weight bold)
     (?C :foreground "#c678dd" :weight bold))
   org-agenda-block-separator 8411)

(setq org-agenda-custom-commands
      '(("v" "A better agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (tags "PRIORITY=\"B\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Medium-priority unfinished tasks:")))
          (tags "PRIORITY=\"C\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Low-priority unfinished tasks:")))
          (tags "customtag"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Tasks marked with customtag:")))

          (agenda "")
          (alltodo "")))))

;; This makes that when you set a TODO item DONE it sets the time when you close the item.
(setq org-log-done 'time)
;;(setq org-agenda-span 'month)  ;; Show a full month

;;(setq whitespace-style '(face tabs spaces newline space-mark tab-mark newline-mark))
;;(setq whitespace-style '(face tabs newline space-mark tab-mark newline-mark))
;;(setq whitespace-space-regexp "\\(\u200B\\|[ \t]+\\)")
(global-whitespace-mode 1)

;; Define the whitespace style.
(setq-default whitespace-style
              '(face empty tabs spaces newline trailing space-mark tab-mark newline-mark))

;; Whitespace color corrections.
(require 'color)
(let* ((ws-lighten 30) ;; Amount in percentage to lighten up black.
       (ws-color (color-lighten-name "#3c3836" ws-lighten)))
  (custom-set-faces
   `(whitespace-newline                ((t (:foreground ,ws-color))))
   `(whitespace-missing-newline-at-eof ((t (:foreground ,ws-color))))
   `(whitespace-space                  ((t (:foreground ,ws-color))))
   `(whitespace-space-after-tab        ((t (:foreground ,ws-color))))
   `(whitespace-space-before-tab       ((t (:foreground ,ws-color))))
   `(whitespace-tab                    ((t (:foreground ,ws-color))))
   `(whitespace-trailing               ((t (:foreground ,ws-color))))))

;; Make these characters represent whitespace.
(setq-default whitespace-display-mappings
      '(
        ;; space -> · else .
        (space-mark 32 [183] [46])
        ;; new line -> ¬ else $
        (newline-mark ?\n [172 ?\n] [36 ?\n])
        ;; carriage return (Windows) -> ¶ else #
        (newline-mark ?\r [182] [35])
        ;; tabs -> » else >
        (tab-mark ?\t [187 ?\t] [62 ?\t])))

;; Don't enable whitespace for.
(setq-default whitespace-global-modes
              '(not shell-mode
                    help-mode
                    magit-mode
                    magit-diff-mode
                    ibuffer-mode
                    dired-mode
                    occur-mode))

;;(setq org-agenda-custom-commands
;;      '(("h" "Daily habits"
;;         ((agenda ""))
;;         ((org-agenda-show-log t)
;;          (org-agenda-ndays 7)
;;          (org-agenda-log-mode-items '(state))
;;          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":HABIT_DAILY:"))))
;;        ;; other commands here
;;        ))

(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(setq org-roam-capture-templates
       '(("d" "default" plain
          "%?"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n")
          :unnarrowed t)
         ("n" "notebook" plain
          "%?"
          :if-new (file+head "notebook/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n")
          :unnarrowed t)
         ("c" "Ciberseguridad" plain
          "%?"
          :if-new (file+head "Ciberseguridad/General/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n")
          :unnarrowed t)
         ("h" "Hack4U" plain
          "%?"
          :if-new (file+head "Ciberseguridad/Hack4u/IntroduccionHacking/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n#+STARTUP: inlineimages\n")
          :unnarrowed t)
         ("p" "ElRinconDelHacker" plain
          "%?"
          :if-new (file+head "Ciberseguridad/elRinconDelHacker/PreparacionParaLaCertificacionEJPTV2/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n#+STARTUP: inlineimages\n")
          :unnarrowed t)
         ("l" "linuxThings" plain
          "%?"
          :if-new (file+head "linuxThings/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n")
          :unnarrowed t)
         ("t" "linuxThingsCommands" plain
          "%?"
          :if-new (file+head "linuxThings/commands/%<%Y%m%d%H%M%S>-${slug}.org"
                             "${title}\n#+date: %U\n#+STARTUP: inlineimages\n")
          :unnarrowed t)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documentos/05_Notes/orgRoam"))
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol)
  (org-roam-setup))

;;(use-package! websocket
;;    :after org-roam)
;;
;;(use-package! org-roam-ui
;;    :after org-roam ;; or :after org
;;;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;;;         a hookable mode anymore, you're advised to pick something yourself
;;;;         if you don't care about startup time, use
;;;;  :hook (after-init . org-roam-ui-mode)
;;    :config
;;    (setq org-roam-ui-sync-theme t
;;          org-roam-ui-follow t
;;          org-roam-ui-update-on-save t
;;          org-roam-ui-open-on-start t))
