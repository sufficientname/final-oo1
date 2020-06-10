Class {
	#name : #CooperativeTest,
	#superclass : #TestCase,
	#instVars : [
		'cooperative',
		'student',
		'member',
		'fee',
		'paymentMethod',
		'payment',
		'otherStudent',
		'otherMember',
		'otherFee',
		'otherPaymentMethod',
		'otherPayment'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
CooperativeTest >> setUp [
	member := Member name: 'John Doe' dni: 20100100 phoneNumber: 2215558888.
	student := Student name: 'Bob Doe' dni: 40100100 grade: 1 division: 1.
	fee := Fee amount: 100.
	paymentMethod := PaymentMethod name: 'credit card' commission: 10.
	payment := Payment member: member fee: fee paymentMethod: paymentMethod.
	
	otherMember := Member name: 'Jane Doe' dni: 20200200 phoneNumber: 2216669999.
	otherStudent := Student name: 'Bill Doe' dni: 40200200 grade: 1 division: 1.
	otherFee := Fee amount: 200.
	otherPaymentMethod := PaymentMethod name: 'debit card' commission: 10.
	otherPayment := Payment member: member fee: fee paymentMethod: paymentMethod.
	
	cooperative := Cooperative new.
]

{ #category : #running }
CooperativeTest >> testCalculateIncomeBetweenAnd [
	cooperative newPayment: payment.
	cooperative newPayment: otherPayment.

	" fake payment datePaid "
	payment datePaid: Date yesterday.
	
	self assert: (cooperative calculateIncomeBetween: Date yesterday and: Date yesterday) equals: payment amountAfterCommision.
	 self assert: (cooperative calculateIncomeBetween: Date yesterday and: Date today) equals: (payment amountAfterCommision + otherPayment amountAfterCommision).
	self assert: (cooperative calculateIncomeBetween: Date today onPreviousMonth and: Date today onPreviousMonth) equals: 0.
	
]

{ #category : #running }
CooperativeTest >> testFees [
	self assert: cooperative fees isEmpty.
	cooperative newFee: fee.
	cooperative newFee: otherFee.
	self assert: cooperative fees size equals: 2.
	self assertCollection: cooperative fees includesAll: { fee. otherFee }
]

{ #category : #running }
CooperativeTest >> testInitialize [
	| aCooperative |
	aCooperative := Cooperative new.
	self assert: aCooperative paymentMethods isEmpty.
	self assert: aCooperative fees isEmpty.
	self assert: aCooperative students isEmpty.
	self assert: aCooperative payments isEmpty.
]

{ #category : #running }
CooperativeTest >> testMembers [
	self assert: cooperative members isEmpty.
	cooperative newMember: member.
	cooperative newMember: otherMember.
	self assert: cooperative members size equals: 2.
	self assertCollection: cooperative members includesAll: { member. otherMember }
]

{ #category : #running }
CooperativeTest >> testNewFee [
	cooperative newFee: fee.
	self assert: cooperative fees size equals: 1.
	self assertCollection: cooperative fees includesAll: { fee }
]

{ #category : #running }
CooperativeTest >> testNewMember [
	cooperative newMember: member.
	self assert: cooperative members size equals: 1.
	self assertCollection: cooperative members includesAll: { member }.
	self assert: member number equals: cooperative members size
]

{ #category : #running }
CooperativeTest >> testNewPayment [
	cooperative newPayment: payment.
	self assert: cooperative payments size equals: 1.
	self assertCollection: cooperative payments includesAll: { payment }.
	self assert: payment datePaid equals: Date today.
]

{ #category : #running }
CooperativeTest >> testNewPaymentMethod [
	cooperative newPaymentMethod: paymentMethod.
	self assert: cooperative paymentMethods size equals: 1.
	self assertCollection: cooperative paymentMethods includesAll: { paymentMethod }
]

{ #category : #running }
CooperativeTest >> testNewStudent [
	cooperative newStudent: student.
	self assert: cooperative students size equals: 1.
	self assertCollection: cooperative students includesAll: { student }
]

{ #category : #running }
CooperativeTest >> testPaymentMethods [
	self assert: cooperative paymentMethods isEmpty.
	cooperative newPaymentMethod: paymentMethod.
	cooperative newPaymentMethod: otherPaymentMethod.
	self assert: cooperative paymentMethods size equals: 2.
	self assertCollection: cooperative paymentMethods includesAll: { paymentMethod. otherPaymentMethod }
]

{ #category : #running }
CooperativeTest >> testPayments [
	self assert: cooperative payments isEmpty.
	cooperative newPayment: payment.
	cooperative newPayment: otherPayment.
	self assert: cooperative payments size equals: 2.
	self assertCollection: cooperative payments includesAll: { payment. otherPayment }
]

{ #category : #running }
CooperativeTest >> testStudents [
	self assert: cooperative students isEmpty.
	cooperative newStudent: student.
	cooperative newStudent: otherStudent.
	self assert: cooperative students size equals: 2.
	self assertCollection: cooperative students includesAll: { student. otherStudent }
]

{ #category : #running }
CooperativeTest >> testUpToDateMembers [
	| enrollmentFee |
	cooperative newMember: member.
	cooperative newMember: otherMember.
	
	self assert: cooperative upToDateMembers isEmpty.
	
	" member pays enrollment fee "
	enrollmentFee := EnrollmentFee amount: 200.
	cooperative newFee: enrollmentFee.
	cooperative newPayment: (Payment member: member fee: enrollmentFee paymentMethod: paymentMethod).
	
	" still not up to date "
	self assert: cooperative upToDateMembers isEmpty.
	
	" member pays monthly fees "
	1 to: Month current index do: [ :each |
		| monthlyFee |
		monthlyFee := MonthlyFee amount: 100 month: (Month month: each).
		cooperative newFee: monthlyFee.
		cooperative newPayment: (Payment member: member fee: monthlyFee paymentMethod: paymentMethod).
	].	
	
	" now is up to date "
	self assert: cooperative upToDateMembers size equals: 1.
	self assert: (cooperative upToDateMembers includes: member)

]
