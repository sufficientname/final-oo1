Class {
	#name : #Payment,
	#superclass : #Object,
	#instVars : [
		'member',
		'fee',
		'paymentMethod',
		'amount',
		'commission',
		'datePaid'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
Payment class >> member: aMember fee: aFee paymentMethod: aPaymentMethod [
	^ (self new) member: aMember; fee: aFee; paymentMethod: aPaymentMethod; yourself
]

{ #category : #accessing }
Payment >> amount [
	^ amount
]

{ #category : #accessing }
Payment >> amountAfterCommision [
	^ amount * ((100 - commission) / 100)
]

{ #category : #accessing }
Payment >> commission [
	^ commission
]

{ #category : #accessing }
Payment >> datePaid [
	^ datePaid
]

{ #category : #accessing }
Payment >> datePaid: anObject [
	datePaid := anObject
]

{ #category : #accessing }
Payment >> fee [
	^ fee
]

{ #category : #accessing }
Payment >> fee: anObject [
	fee ifNotNil: [ (fee payments includes: self) ifTrue: [ fee removePayment: self ] ].
	fee := anObject.
	fee ifNotNil: [ amount := fee amount. fee addPayment: self ]
		 ifNil: [ amount := 0 ] 
	 
	
	
	
	
]

{ #category : #initialization }
Payment >> initialize [
	amount := 0.
	commission := 0.
]

{ #category : #accessing }
Payment >> member [
	^ member
]

{ #category : #accessing }
Payment >> member: anObject [
	member ifNotNil: [ (member payments includes: self) ifTrue: [ member removePayment: self ] ].
	member := anObject.
	member ifNotNil: [ member addPayment: self	]	
	
]

{ #category : #accessing }
Payment >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
Payment >> paymentMethod: anObject [
	paymentMethod ifNotNil: [ (paymentMethod payments includes: self) ifTrue: [ paymentMethod removePayment: self ] ].
	paymentMethod := anObject.
	paymentMethod ifNotNil: [ commission := paymentMethod commission. paymentMethod addPayment: self ]
					  ifNil: [ commission := 0 ]
]

{ #category : #accessing }
Payment >> printString [
	^ 'Payment($' , amount printString , ')'
]
