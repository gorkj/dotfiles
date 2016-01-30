(setq package-list '(cider clojure-cheatsheet clojure-mode clojure-mode-extra-font-locking clojure-snippets
                           company
                           eval-sexp-fu
                           evil evil-paredit 
                           helm helm-ag helm-core helm-dash 
                           js2-mode php+-mode
                           magit magit-popup evil-magit
                           org evil-org
                           powerline powerline-evil 
                           projectile helm-projectile
                           yasnippet
                           sunrise-commander sunrise-x-buttons
                     ))

;angular-mode angular-snippets dash docker dockerfile-mode evil-visual-mark-mode
;helm-spotify highlight
;pkg-info react-snippets seq
  
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))

(menu-bar-mode -1)

(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(show-paren-mode 1)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

; easy config edit
(global-set-key (kbd "C-`") (lambda() (interactive) (find-file "~/.emacs")))

; easy switching of windows
(global-set-key (kbd "<C-tab>") (lambda() (interactive) (other-window 1)))
(global-set-key (kbd "<C-S-tab>") (lambda() (interactive) (other-window -1)))

; set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("SC"    . "http://joseito.republika.pl/sunrise-commander/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'wombat)
(set-default-font "Consolas 14")
;(set-default-font "Inconsolata 14")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

(require 'cider)
(require 'company)
(require 'eval-sexp-fu)
(require 'evil-magit)
(require 'evil)
(require 'helm-config)
(require 'helm)
(require 'js2-mode)
(require 'magit)
(require 'org)
(require 'powerline-evil)
(require 'powerline)
(require 'projectile)
(require 'yasnippet)

(powerline-default-theme)
(evil-mode 1)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(add-hook 'clojure-mode 'evil-paredit-mode)
(add-hook 'clojurescript-mode 'evil-paredit-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x x") 'sunrise)
(global-set-key (kbd "C-x g") 'magit-status)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
;(helm-projectile-on)
