;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'darktooth-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq doom-theme 'doom-monokai)

;; Maximize window upon startup
(setq initial-frame-alist '((top . 1) (left . 1) (width . 114) (height . 32)))



;; from https://joshblais.com/blog/literate-doom-emacs-config/
;; Performance optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 8)

;; Garbage collector optimization
(setq gcmh-idle-delay 5)
(setq gcmh-high-cons-threshold (* 1024 1024 1024))

;; Version control optimization
(setq vc-handled-backends '(Git))

;; fonts
(when (doom-font-exists-p "JetBrainsMono Nerd Font")
  (setq doom-font                (font-spec :name "JetBrainsMono Nerd Font" :size 14)))
(when (doom-font-exists-p "EB Garamond")
  (setq doom-variable-pitch-font (font-spec :name "EB Garamond"  :size 16)))
(when (doom-font-exists-p "Noto Color Emoji")
  (setq doom-emoji-font          (font-spec :name "Noto Color Emoji")))
(when (doom-font-exists-p "Symbols Nerd Font Mono")
  (setq doom-symbol-font         (font-spec :name "Symbols Nerd Font Mono")))

;; ligatures
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                                       "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                                       "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                                       "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                                       "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                                       "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                                       "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                                       "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                                       "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                                       "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                                       "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                                       ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                                       "<:<" ";;;"))
  (global-ligature-mode t));



;; nomnom

(add-to-list 'load-path (expand-file-name "local/nomnom/" doom-user-dir))

(use-package! nomnom
  :mode (("\\.nom\\'" . nomnom-mode)
         ("\\.fud\\'" . nomnom-mode))

  :commands (nomnom-calculate nomnom-insert-date nomnom-mode))

(map! :leader
      :desc "Calculate calorie totals"
      "c t" #'nomnom)

(map! :leader
      :desc "Insert current date"
      "c i" #'nomnom-insert-date)

;; webpaste
(use-package webpaste
  :ensure t
  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
         ("C-c C-p C-r" . webpaste-paste-region)
         ("C-c C-p C-p" . webpaste-paste-buffer-or-region)))


;; calorie-tracking

(add-to-list 'load-path (expand-file-name "local/" doom-user-dir))
(use-package! calorie-tracking
  ;;  :load-path "local"
  :mode ("\\.noms\\'" . calorie-tracking-mode)
  :commands (calorie-tracking-mode
             calorie-tracking-add-entry
             calorie-tracking-recalculate-day
             calorie-tracking-recalculate-buffer
             calorie-tracking-insert-today
             calorie-tracking-daily-summary))

(after! calorie-tracking
  ;; Localleader menu for calorie-tracking-mode
  (map! :map calorie-tracking-mode-map
        :localleader
        :desc "Insert today's header" "t" #'calorie-tracking-insert-today
        :desc "Add entry"              "a" #'calorie-tracking-add-entry
        :desc "Recalc day"              "r" #'calorie-tracking-recalculate-day
        :desc "Recalc buffer"           "R" #'calorie-tracking-recalculate-buffer
        :desc "Summary"                 "s" #'calorie-tracking-daily-summary))


;; barebones.el
(use-package! barebones
  :load-path "local"
  :commands (barebones-mode
             barebones/hello
             barebones-toggle)
  :init
  ;; Lazy leader keys (autoload will pull in `barebones.el` on first use):
  (map! :leader
        :desc "Barebones: Hello"  "o h" #'barebones/hello
        :desc "Barebones: Toggle" "o t" #'barebones-toggle)
  ;; Optional defaults you can tweak per-profile:
  (setq barebones-enable-mode-in-prog t
        barebones-greeting "Yo from Doom on Gentoo/Wayland"
        barebones-bling t))




;; ┌──────────────────────────────────────────────────────────┬────┐
;; │                                                          │    │
;; │                                                          │    │
;; │   org-mode                                               │    │
;; └──────────────────────────────────────────────────────────┴────┘

;;  org-agenda
(after! org
  (setq org-agenda-files
        '("~/org/agenda.org")))


(setq org-directory "~/org/")
(after! org (setq org-insert-heading-respect-content nil))


;; enable variable and visual line mode in Org mode by default.
(add-hook! org-mode :append
           #'visual-line-mode
           #'variable-pitch-mode)

;; org
(defun org-reformat-buffer ()
  (interactive)
  (when (y-or-n-p "Really format current buffer? ")
    (let ((document (org-element-interpret-data (org-element-parse-buffer))))
      (erase-buffer)
      (insert document)
      (goto-char (point-min)))))
                                        ;
;; org-roam
(setq org-roam-directory "~/org/org-roam/")
(setq +org-roam-open-buffer-on-find-file t)
(setq org-attach-id-dir "attachments/")


(after! ox-hugo
  (setq org-hugo-use-code-for-kbd t))


(defun zz/org-reformat-buffer ()
  (interactive)
  (when (y-or-n-p "Really format current buffer? ")
    (let ((document (org-element-interpret-data (org-element-parse-buffer))))
      (erase-buffer)
      (insert document)
      (goto-char (point-min)))))


;;( use-package org-roam
;;  :ensure t
;;  :custom
;;  (org-roam-directory "~/org-roam")
;;  :bind (("C-c n l" . org-roam-buffer-toggle)
;;         ("C-c n f" . org-roam-node-find)
;;         ("C-c n i" . org-roam-node-insert))
;;  :config
;;  (org-roam-setup))

(use-package org-roam
  :ensure t
  :init
  ;;  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(put 'dockerfile-image-name 'safe-local-variable #'stringp)


;; https://emacs.stackexchange.com/a/55340/11843:

(defun plain-pipe-for-process () (setq-local process-connection-type nil))
(add-hook 'compilation-mode-hook 'plain-pipe-for-process)


;; iedit
(use-package! iedit
  :defer
  :config
  (set-face-background 'iedit-occurrence "Magenta")
  :bind
  ("C-;" . iedit-mode))


;; for timing things
;; from https://stackoverflow.com/questions/23622296/emacs-timing-execution-of-function-calls-in-emacs-lisp
(defmacro zz/measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; remap insert->normal key to jk
(setq evil-escape-key-sequence "jj")
(setq evil-escape-key-sequence "jk")
(setq evil-escape-delay 0.2)


(menu-bar-mode)

(use-package! doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))



(use-package! org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-hide-leading-stars t)

(setq org-src-fontify-natively t)


(global-prettify-symbols-mode t)




;; pass config
(auth-source-pass-enable)


;; sasl
(after! circe
  (set-irc-server! "irc.libera.chat"
    `(:tls t
      :port 6697
      :nick "agent314"
      :sasl-username "agent314"
      :sasl-password (lambda (&rest _)
                       (auth-source-pass-get 'secret "irc/libera.chat"))
      :channels ("#emacs"))))



;; Treemacs
(require 'treemacs-all-the-icons)
(setq doom-themes-treemacs-theme "all-the-icons")
