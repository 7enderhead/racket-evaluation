#lang racket

(require setup/getinfo)
(require "db-data-provider.rkt")

(define info (get-info/full "."))

(define provider #f)

(define (data-provider)
  (when (not provider)
    (set! provider (new db-data-provider%
                        [server (info 'db-server)]
                        [user (info 'db-user)]
                        [password (info 'db-password)]
                        [database (info 'db-name)])))
  provider)

(provide data-provider)