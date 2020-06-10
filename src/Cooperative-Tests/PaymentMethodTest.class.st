Class {
	#name : #PaymentMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'paymentMethod'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
PaymentMethodTest >> setUp [
	paymentMethod := PaymentMethod name: 'credit card' commission: 10
]

{ #category : #running }
PaymentMethodTest >> testAddPayment [
	| payment |
	payment := Payment new.
	self assert: paymentMethod payments isEmpty.
	paymentMethod addPayment: payment.
	self assert: paymentMethod payments size equals: 1.
	self assertCollection: paymentMethod payments includesAll: { payment }.
	self assert: payment paymentMethod equals: paymentMethod
	


]

{ #category : #running }
PaymentMethodTest >> testCommission [
	paymentMethod commission: 10.
	self assert: paymentMethod commission equals: 10.
]

{ #category : #running }
PaymentMethodTest >> testInitialize [
	| aPaymentMethod |
	aPaymentMethod := PaymentMethod new.
	self assert: aPaymentMethod payments isEmpty.
	
]

{ #category : #running }
PaymentMethodTest >> testName [
	paymentMethod name: 'credit card'.
	self assert: paymentMethod name equals: 'credit card'.
]

{ #category : #running }
PaymentMethodTest >> testNameCommission [
	| aPaymentMethod |
	aPaymentMethod := PaymentMethod name: 'credit card' commission: 10.
	self assert: aPaymentMethod name equals: 'credit card'.
	self assert: aPaymentMethod commission equals: 10.
]

{ #category : #running }
PaymentMethodTest >> testPayments [
	| payment |
	payment := Payment new.
	self assert: paymentMethod payments isEmpty.
	paymentMethod addPayment: payment.
	self assert: paymentMethod payments size equals: 1.
	self assertCollection: paymentMethod payments includesAll: { payment }.
]

{ #category : #running }
PaymentMethodTest >> testRemovePayment [
	| payment |
	payment := Payment new.
	paymentMethod addPayment: payment.
	paymentMethod removePayment: payment.
	self assert: paymentMethod payments isEmpty.
	self assert: payment paymentMethod equals: nil
	


]
