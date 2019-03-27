;;; ~/.doom.d/dwim.el -*- lexical-binding: t; -*-


;; python-eldoc--get-symbol-at-point
;;
;;
(defconst python-dwim-non-fn-keywords
  (list
   "and" "del" "from" "not" "while" "as" "elif" "global" "or" "with"
   "assert" "else" "if" "pass" "yield" "break" "except" "import" "class"
   "in" "raise" "continue" "finally" "is" "return" "def" "for" "lambda"
   "try"
   ;; Python 3.5+ PEP492
   "async" "await"
   ;; Extra:
   "self")
  "Keywords in python which are not functions")

(defconst rust-dwim-keywords
  '("as" "async"
    "box" "break"
    "const" "continue" "crate"
    "do" "dyn"
    "else" "enum" "extern"
    "false" "fn" "for"
    "if" "impl" "in"
    "let" "loop"
    "match" "mod" "move" "mut"
    "priv" "pub"
    "ref" "return"
    "self" "static" "struct" "super"
    "true" "trait" "type" "try"
    "use"
    "virtual"
    "where" "while"
    "yield"))

(defun is-alpha (char)
  (memq (get-char-code-property char 'general-category)
      '(Ll Lu Lo Lt Lm Mn Mc Me Nl)))

(defun python-space-dwim ()
    (let ((word (python-eldoc--get-symbol-at-point)))
      (if (and word
               (not (member word python-dwim-non-fn-keywords))
               (is-alpha (preceding-char)))
          (insert-char ?_)
        (insert-char ? ))))


(defun rust-space-dwim ()
  (if (and (not (rust-in-str-or-cmnt))
           (rust-looking-back-ident)
           (not (rust-looking-back-symbols rust-dwim-keywords)))
      (insert-char ?_)
    (insert-char ? )))
