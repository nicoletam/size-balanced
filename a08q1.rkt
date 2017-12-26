;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a08q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ****************************
;; Nicole Tam (20704606)
;; CS 115 Fall 2017
;; Assignment 8, Question 1
;; ****************************
;;

(define-struct node (item left right))
; A Node is a (make-node Num BT BT)
; A binary tree (BT) is either
; empty
; (make-node Num BT BT)

;; Define binary trees
(define bt-1 (make-node 10
                        (make-node 9
                                   (make-node 10
                                              empty empty)
                                   empty)
                        (make-node 11
                                   empty
                                   (make-node 12
                                              empty empty))))
(define bt-2 (make-node 9
                        (make-node 18
                                   (make-node 23
                                              empty empty)
                                   empty)
                        empty))


;; (num) consumes a binary tree
;; and outputs the number of nodes
;; in the tree
;; num: BT -> Nat
;; Examples:
(check-expect (num bt-1) 5)

(define (num bt)
  (cond [(empty? bt) 0]
        [else (+ (num (node-left bt))
                 (num (node-right bt))
                 1)]))

;; (size-balanced? bt) consumes a binary
;; tree and determines if the number of
;; nodes in the left and right
;; subtrees are the same or differ by 1
;; Requires: valid binary tree
;; size-balanced?: BT -> Bool
;; Examples:
(check-expect (size-balanced? bt-1) true)
(check-expect (size-balanced? bt-2) false)


(define (size-balanced? bt)
  (cond [(empty? bt) true]
        [(and (empty? (node-left bt))
              (empty? (node-right bt))) true] 
        [(or (= 0 (- (num (node-left bt))
                     (num (node-right bt))))
             (= 1 (- (num (node-right bt))
                     (num (node-left bt))))
             (= -1 (- (num (node-right bt))
                      (num (node-left bt)))))
         (and (size-balanced? (node-left bt))(size-balanced? (node-right bt)))] 
        [else false]))

;; Tests
(check-expect (size-balanced? empty) true)
(check-expect (size-balanced? bt-1) true)
(check-expect (size-balanced? bt-2) false)








