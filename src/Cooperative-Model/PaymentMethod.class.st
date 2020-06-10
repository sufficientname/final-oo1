Class {
	#name : #PaymentMethod,
	#superclass : #Object,
	#instVars : [
		'name',
		'commission',
		'payments'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
PaymentMethod class >> name: aName commission: aCommission [
	| paymentMethod |
	paymentMethod := self new.
	paymentMethod name: aName.
	paymentMethod commission: aCommission.
	^ paymentMethod
]

{ #category : #accessing }
PaymentMethod >> addPayment: aPayment [
	payments add: aPayment.
	(aPayment paymentMethod == self) ifFalse: [ aPayment paymentMethod: self ]
]

{ #category : #accessing }
PaymentMethod >> commission [
	^ commission
]

{ #category : #accessing }
PaymentMethod >> commission: anObject [
	commission := anObject asNumber
]

{ #category : #initialization }
PaymentMethod >> initialize [
	super initialize.
	payments := Set new.
]

{ #category : #accessing }
PaymentMethod >> name [
	^ name
]

{ #category : #accessing }
PaymentMethod >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PaymentMethod >> payments [
	^ payments
]

{ #category : #accessing }
PaymentMethod >> printString [
	^ name
]

{ #category : #accessing }
PaymentMethod >> removePayment: aPayment [
	payments remove: aPayment.
	(aPayment paymentMethod == self) ifTrue: [ aPayment paymentMethod: nil ]
]
