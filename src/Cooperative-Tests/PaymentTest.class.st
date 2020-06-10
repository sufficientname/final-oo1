Class {
	#name : #PaymentTest,
	#superclass : #TestCase,
	#instVars : [
		'member',
		'fee',
		'paymentMethod',
		'payment',
		'otherMember',
		'otherFee',
		'otherPaymentMethod'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
PaymentTest >> setUp [
	member := Member name: 'John Doe' dni: 20100100 phoneNumber: 2215558888.
	fee := Fee amount: 100.
	paymentMethod := PaymentMethod name: 'credit card' commission: 10.
	
	payment := Payment member: member fee: fee paymentMethod: paymentMethod.
	
	otherMember := Member name: 'Jane Doe' dni: 20200200 phoneNumber: 2216669999.
	otherFee := Fee amount: 200.
	otherPaymentMethod := PaymentMethod name: 'debit card' commission: 10.
	
	
]

{ #category : #running }
PaymentTest >> testAmount [
	| feeAmount |
	self assert: payment amount equals: fee amount.
	" if fee amount is updated... "
	feeAmount := fee amount.
	fee amount: 20.
	self assert: payment amount equals: feeAmount.
	
]

{ #category : #running }
PaymentTest >> testAmountAfterCommision [
	self assert: payment amountAfterCommision equals: (fee amount * (100 - paymentMethod commission) / 100) 
]

{ #category : #running }
PaymentTest >> testCommission [
	| paymentMethodCommission |
	self assert: payment commission equals: paymentMethod commission.
	" if paymentMethod commission is updated... "
	paymentMethodCommission := paymentMethod commission.
	paymentMethod commission: 20.
	self assert: payment commission equals: paymentMethodCommission.
	
]

{ #category : #running }
PaymentTest >> testDatePaid [
	| datePaid |
	datePaid := Date today.
	payment datePaid: datePaid.
	self assert: payment datePaid equals: datePaid.
]

{ #category : #running }
PaymentTest >> testFee [
	payment fee: fee.
	self assert: payment fee equals: fee.
	self assert: payment amount equals: fee amount.
	self assert: (fee payments includes: payment).
	payment fee: otherFee.
	self assert: payment fee equals: otherFee.
	self assert: payment amount equals: otherFee amount.
	self assert: (fee payments includes: payment) not.
	self assert: (otherFee payments includes: payment).
	payment fee: nil.
	self assert: payment fee equals: nil.
	self assert: payment amount equals: 0 .
	self assert: (otherFee payments includes: payment) not.
]

{ #category : #running }
PaymentTest >> testInitialize [
	| aPayment |
	aPayment := Payment new.
	self assert: aPayment amount equals: 0.
	self assert: aPayment commission equals: 0.
]

{ #category : #running }
PaymentTest >> testMember [
	payment member: member.
	self assert: payment member equals: member.
	self assert: (member payments includes: payment).
	payment member: otherMember.
	self assert: payment member equals: otherMember.
	self assert: (member payments includes: payment) not.
	self assert: (otherMember payments includes: payment).
	payment member: nil.
	self assert: payment member equals: nil.
	self assert: (otherMember payments includes: payment) not.
]

{ #category : #running }
PaymentTest >> testMemberFeePaymentMethod [
	| otherPayment |
	otherPayment := Payment member: otherMember fee: otherFee paymentMethod: otherPaymentMethod.
	self assert: otherPayment member equals: otherMember.
	self assert: otherPayment fee equals: otherFee.
	self assert: otherPayment paymentMethod equals: otherPaymentMethod.
]

{ #category : #running }
PaymentTest >> testPaymentMethod [
	payment paymentMethod: paymentMethod.
	self assert: payment paymentMethod equals: paymentMethod.
	self assert: payment commission equals: paymentMethod commission.
	self assert: (paymentMethod payments includes: payment).
	payment paymentMethod: otherPaymentMethod.
	self assert: payment paymentMethod equals: otherPaymentMethod.
	self assert: payment commission equals: otherPaymentMethod commission.
	self assert: (paymentMethod payments includes: payment) not.
	self assert: (otherPaymentMethod payments includes: payment).
	payment paymentMethod: nil.
	self assert: payment paymentMethod equals: nil.
	self assert: payment commission equals: 0 .
	self assert: (otherPaymentMethod payments includes: payment) not.
	
]
