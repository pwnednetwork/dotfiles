;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fd22a3aac273624858a4184079b7134fb4e97104d1627cb2b488821be765ff17"
     "4d714a034e7747598869bef1104e96336a71c3d141fa58618e4606a27507db4c"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326"
     "d12b1d9b0498280f60e5ec92e5ecec4b5db5370d05e787bc7cc49eae6fb07bc0" default))
 '(erc-modules
   '(autojoin bufbar button completion fill imenu irccontrols list match menu
              move-to-prompt netsplit networks nickbar notifications readonly
              ring sasl stamp track))
 '(safe-local-variable-values
   '((eval progn (setq-local +format-with-lsp nil)
           (when (bound-and-true-p apheleia-mode) (apheleia-mode -1))
           (when (bound-and-true-p format-all-mode) (format-all-mode -1))
           (remove-hook 'before-save-hook #'+format-buffer-h t)
           (remove-hook 'before-save-hook #'apheleia-format-buffer t)
           (remove-hook 'before-save-hook #'lsp-format-buffer t)
           (remove-hook 'before-save-hook #'format-all-buffer t)
           (when (bound-and-true-p aggressive-indent-mode)
             (aggressive-indent-mode -1)))))
 '(warning-suppress-types '((erc-sasl) (defvaralias) (lexical-binding))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
