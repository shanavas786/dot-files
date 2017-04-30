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

(defun goto-match-paren ()
  "Go to the matching  if on (){}[], similar to vi style of %."
  (interactive)
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)))
