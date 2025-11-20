;; Contract Name: simple-escrow.clar
;; Purpose: A minimal escrow smart contract where a payer deposits STX, and an arbiter or payer can release or refund funds.
;; License: MIT

;; Add missing error constant definitions
(define-constant ERR-INVALID-AMOUNT (err u1))
(define-constant ERR-ESCROW-EXISTS (err u2))

;; Define the escrows map that was unresolved
(define-map escrows 
  {id: uint} 
  {payer: principal, recipient: principal, arbiter: principal, amount: uint, deposited: bool, released: bool})

;; Create a new escrow (does not transfer STX yet)
(define-public (create-escrow (id uint) (recipient principal) (arbiter principal) (amount uint))
  (if (<= amount u0)
      (err ERR-INVALID-AMOUNT)
      (if (is-some (map-get? escrows {id: id}))
          (err ERR-ESCROW-EXISTS)
          ;; Fixed map-set syntax - use named tuple syntax {key: value}
          (begin
            (map-set escrows {id: id}
                     {payer: tx-sender,
                      recipient: recipient,
                      arbiter: arbiter,
                      amount: amount,
                      deposited: false,
                      released: false})
            (ok true)))))


;; Get escrow details
(define-read-only (get-escrow (id uint))
  ;; Fixed map-get syntax to use named tuple
  (map-get? escrows {id: id}))
