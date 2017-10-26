(defun my-dwim ()
  (let ((next-char (following-char))
        (inserted-char (preceding-char))
        (previous-char (char-before (- (point) 1)))
        (current-pos (point)))
    (cond
     ((eq inserted-char ?\;)
      (end-of-line)
      (if (eq (preceding-char) inserted-char)
          (unless (= current-pos (point))
            (progn
              (delete-char -1)
              (goto-char current-pos)))
        (progn
          (insert-char inserted-char)
          (goto-char current-pos)
          (delete-char -1)))))
    ;; $. --> $this->
    (cond
     ((and
       (eq inserted-char ?\.)
       (eq (char-before (1- (point))) ?\$))
      (delete-char -1)
      (insert "this->")))))

;; rustfmt-nightly fails without it
(setenv "LD_LIBRARY_PATH" (concat (replace-regexp-in-string "\n" "" (shell-command-to-string "rustc --print sysroot")) "/" "lib"))
