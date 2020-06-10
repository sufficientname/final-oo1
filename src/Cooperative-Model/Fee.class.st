Class {
	#name : #Fee,
	#superclass : #Object,
	#instVars : [
		'amount',
		'payments'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
Fee class >> amount: anAmount [
	^ (self new) amount: anAmount; yourself
]

{ #category : #accessing }
Fee >> addPayment: aPayment [
	payments add: aPayment.
	(aPayment fee == self) ifFalse: [ aPayment fee: self ]
]

{ #category : #accessing }
Fee >> amount [
	^ amount
]

{ #category : #accessing }
Fee >> amount: anObject [
	amount := anObject asNumber
]

{ #category : #initialization }
Fee >> initialize [
	super initialize.
	payments := Set new.
]

{ #category : #accessing }
Fee >> isEnrollmentFee [
	^ false
]

{ #category : #accessing }
Fee >> isMonthlyFee [
	^ false
]

{ #category : #accessing }
Fee >> payments [
	^ payments
]

{ #category : #accessing }
Fee >> removePayment: aPayment [
	payments remove: aPayment.
	(aPayment fee == self) ifTrue: [ aPayment fee: nil ]
]
