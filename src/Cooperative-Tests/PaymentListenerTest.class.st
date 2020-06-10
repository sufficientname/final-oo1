Class {
	#name : #PaymentListenerTest,
	#superclass : #TestCase,
	#category : #'Cooperative-Tests'
}

{ #category : #running }
PaymentListenerTest >> testAddPayment [
	| paymentListener payment |
	payment := Payment new.
	paymentListener := Fee new.
	self assert: paymentListener payments isEmpty.
	paymentListener addPayment: payment.
	self assert: paymentListener payments size equals: 1.
	self assertCollection: paymentListener payments includesAll: { payment } 
]

{ #category : #running }
PaymentListenerTest >> testPayments [
	| paymentListener payment |
	payment := Payment new.
	paymentListener := Fee new.
	self assert: paymentListener payments isEmpty.
	paymentListener addPayment: payment.
	self assert: paymentListener payments size equals: 1.
	self assertCollection: paymentListener payments includesAll: { payment } 
	
]

{ #category : #running }
PaymentListenerTest >> testRemovePayment [
	| paymentListener payment |
	payment := Payment new.
	paymentListener := Fee new.
	paymentListener addPayment: payment.
	paymentListener removePayment: payment.
	self assert: paymentListener payments isEmpty. 
]
