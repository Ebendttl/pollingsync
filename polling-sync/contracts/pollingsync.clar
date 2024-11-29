
;; Simple Fungible Token Contract
;; A minimal Clarity smart contract implementing a basic fungible token with core functionality for minting, transferring, and balance checking.


(define-fungible-token my-token) ;; Define the token

;; Constants
(define-constant contract-owner tx-sender) ;; Owner of the contract

;; data vars and maps
(define-data-var total-supply uint u1000000) ;; Total supply of tokens

;; Mint tokens (only contract owner can mint)
(define-public (mint (amount uint) (recipient principal))
    (begin
        ;; Check if the sender is the contract owner
        (asserts! (is-eq tx-sender contract-owner) (err u1))
        
        ;; Mint tokens to the recipient
        (try! (ft-mint? my-token amount recipient))
        
        (ok true)
    )
)

;; Transfer tokens
(define-public (transfer (amount uint) (sender principal) (recipient principal))
    (begin
        ;; Check if sender has sufficient balance
        (asserts! (>= (ft-get-balance my-token sender) amount) (err u2))
        
        ;; Perform the transfer
        (try! (ft-transfer? my-token amount sender recipient))
        
        (ok true)
    )
)

;; Get token balance
(define-read-only (get-balance (account principal))
    (ok (ft-get-balance my-token account))
)

;; Get total supply
(define-read-only (get-total-supply)
    (ok (var-get total-supply))
)
