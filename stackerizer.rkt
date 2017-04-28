#lang br/quicklang
(provide + *)

(define-macro (stackerizer-mb EXPR)
  #'(#%module-begin
     (for-each displayln (reverse (flatten EXPR)))))
(provide (rename-out [stackerizer-mb #%module-begin]))

(define-macro (define-ops OP ...) ; args stored in `OP ...`
  #'(begin
      (define-macro-cases OP ; `OP` from `OP ...`
        [(OP FIRST) #'FIRST]
        [(OP FIRST NEXT (... ...))
         #'(list 'OP FIRST (OP NEXT (... ...)))])
      ...)) ; `...` from `OP ...`

(define-ops + *)