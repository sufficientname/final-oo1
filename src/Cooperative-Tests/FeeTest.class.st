Class {
	#name : #FeeTest,
	#superclass : #TestCase,
	#instVars : [
		'fee'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
FeeTest >> setUp [
	fee := Fee amount: 100
]

{ #category : #running }
FeeTest >> testAddPayment [
	| payment |
	payment := Payment new.
	self assert: fee payments isEmpty.
	fee addPayment: payment.
	self assert: fee payments size equals: 1.
	self assertCollection: fee payments includesAll: { payment }.
	self assert: payment fee equals: fee
	


]

{ #category : #running }
FeeTest >> testAmount [
	fee amount: 100.
	self assert: fee amount equals: 100.
]

{ #category : #running }
FeeTest >> testInitialize [
	| aFee |
	aFee := Fee new.
	self assert: fee payments isEmpty
]

{ #category : #running }
FeeTest >> testIsEnrollmentFee [
	self assert: fee isEnrollmentFee not
]

{ #category : #running }
FeeTest >> testIsMonthlyFee [
	self assert: fee isMonthlyFee not
]

{ #category : #running }
FeeTest >> testPayments [
	| payment |
	payment := Payment new.
	self assert: fee payments isEmpty.
	fee addPayment: payment.
	self assert: fee payments size equals: 1.
	self assertCollection: fee payments includesAll: { payment }.
]

{ #category : #running }
FeeTest >> testRemovePayment [
	| payment |
	payment := Payment new.
	fee addPayment: payment.
	fee removePayment: payment.
	self assert: fee payments isEmpty.
	self assert: payment fee equals: nil
	


]
