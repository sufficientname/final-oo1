Class {
	#name : #MemberTest,
	#superclass : #TestCase,
	#instVars : [
		'member',
		'student',
		'otherStudent'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
MemberTest >> setUp [
	member := Member name: 'John Doe' dni: 20100100 phoneNumber: 2215558888.
	student := Student name: 'Bob Doe' dni: 40100100 grade: 1 division: 1.
	otherStudent := Student name: 'Bill Doe' dni: 40200200 grade: 1 division: 1.
]

{ #category : #running }
MemberTest >> testAddPayment [
	| payment |
	payment := Payment new.
	self assert: member payments isEmpty.
	member addPayment: payment.
	self assert: member payments size equals: 1.
	self assertCollection: member payments includesAll: { payment }.
	self assert: payment member equals: member
	


]

{ #category : #running }
MemberTest >> testBeNotResponsibleOf [
	member beResponsibleOf: student.
	member beNotResponsibleOf: student.
	self assert: member responsibleOf isEmpty.
	self assert: student responsibles isEmpty.
]

{ #category : #running }
MemberTest >> testBeResponsibleOf [
	member beResponsibleOf: student.
	self assert: member responsibleOf size equals: 1.
	self assertCollection: member responsibleOf includesAll: { student }.
	self assert: student responsibles size equals: 1.
	self assertCollection: student responsibles includesAll: { member }.
]

{ #category : #running }
MemberTest >> testInitialize [
	| aMember |
	aMember := Member new.
	self assert: aMember responsibleOf isEmpty.
	self assert: aMember payments isEmpty.
]

{ #category : #running }
MemberTest >> testNameDniPhoneNumber [
	| aMember |
	aMember := Member name: 'John Doe' dni: 20100100 phoneNumber: 2215558888.
	self assert: aMember name equals: 'John Doe'.
	self assert: aMember dni equals: 20100100.
	self assert: aMember phoneNumber equals: 2215558888
]

{ #category : #running }
MemberTest >> testNumber [
	member number: 1.
	self assert: member number equals: 1
]

{ #category : #running }
MemberTest >> testPayments [
	| payment |
	payment := Payment new.
	self assert: member payments isEmpty.
	member addPayment: payment.
	self assert: member payments size equals: 1.
	self assertCollection: member payments includesAll: { payment }.
]

{ #category : #running }
MemberTest >> testPhoneNumber [
	member phoneNumber: 2215558888.
	self assert: member phoneNumber equals: 2215558888 
]

{ #category : #running }
MemberTest >> testRemovePayment [
	| payment |
	payment := Payment new.
	member addPayment: payment.
	member removePayment: payment.
	self assert: member payments isEmpty.
	self assert: payment member equals: nil
	


]

{ #category : #running }
MemberTest >> testResponsibleOf [
	self assert: member responsibleOf isEmpty.
	member beResponsibleOf: student.
	member beResponsibleOf: otherStudent.
	self assert: member responsibleOf size equals: 2.
	self assertCollection: member responsibleOf includesAll: { student. otherStudent }.
	self assert: student responsibles size equals: 1.
	self assertCollection: student responsibles includesAll: { member }.
	self assert: otherStudent responsibles size equals: 1.
	self assertCollection: otherStudent responsibles includesAll: { member }.	
]

{ #category : #running }
MemberTest >> testUpToDate [
	| cooperative paymentMethod enrollmentFee |
	cooperative := Cooperative new.
	paymentMethod := PaymentMethod name: 'credit card' commission: 10.
	
	" member pays enrollment fee "
	enrollmentFee := EnrollmentFee amount: 200.	
	cooperative newFee: enrollmentFee.
	cooperative newPayment: (Payment member: member fee: enrollmentFee paymentMethod: paymentMethod).
	
	" still not up to date "
	self assert: member upToDate not.
	
	" member pays monthly fees "
	1 to: Month current index do: [ :each |
		| monthlyFee |
		monthlyFee := MonthlyFee amount: 100 month: (Month month: each).
		cooperative newFee: monthlyFee.
		cooperative newPayment: (Payment member: member fee: monthlyFee paymentMethod: paymentMethod).
	].	
	
	" now is up to date "
	self assert: member upToDate.
]
