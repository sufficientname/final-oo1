Class {
	#name : #Cooperative,
	#superclass : #Object,
	#instVars : [
		'paymentMethods',
		'fees',
		'students',
		'members',
		'payments'
	],
	#category : #'Cooperative-Model'
}

{ #category : #accessing }
Cooperative >> calculateIncomeBetween: startDate and: endDate [
	^ (payments select: [ :each | each datePaid between: startDate and: endDate ]) inject: 0 into: [ :sum :each | sum + each amountAfterCommision ]
]

{ #category : #accessing }
Cooperative >> fees [
	^ fees
]

{ #category : #initialization }
Cooperative >> initialize [
	super initialize.
	paymentMethods := Set new.
	fees := Set new.
	students := Set new.
	members := Set new.
	payments := Set new.
]

{ #category : #accessing }
Cooperative >> members [
	^ members
]

{ #category : #accessing }
Cooperative >> newFee: aFee [
	fees add: aFee
]

{ #category : #accessing }
Cooperative >> newMember: aMember [
	members add: aMember.
	aMember number: members size
	
]

{ #category : #accessing }
Cooperative >> newPayment: aPayment [ 
	aPayment datePaid: Date today.
	payments add: aPayment
	 
]

{ #category : #accessing }
Cooperative >> newPaymentMethod: aPaymentMethod [ 
	paymentMethods add: aPaymentMethod
]

{ #category : #accessing }
Cooperative >> newStudent: aStudent [
	students add: aStudent
]

{ #category : #accessing }
Cooperative >> paymentMethods [
	^ paymentMethods
]

{ #category : #accessing }
Cooperative >> payments [
	^ payments
]

{ #category : #accessing }
Cooperative >> students [
	^ students
]

{ #category : #accessing }
Cooperative >> upToDateMembers [
	^ members select: [ :each | each upToDate ]
]
