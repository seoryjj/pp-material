#lang racket

(require racket/include)
(require "helloWorld.rkt")

(printf
  (if (eq? (helloWorld) "Hello, World!\n")
    "O\n"
    "X\n"))
