Class {
	#name : #Member,
	#superclass : #Person,
	#instVars : [
		'number',
		'phoneNumber',
		'responsibleOf',
		'payments'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
Member class >> name: aName dni: aDNI phoneNumber: aPhoneNumber [
	^ (self name: aName dni: aDNI) phoneNumber: aPhoneNumber; yourself
]

{ #category : #accessing }
Member >> addPayment: aPayment [
	payments add: aPayment.
	(aPayment member == self) ifFalse: [ aPayment member: self ]
]

{ #category : #accessing }
Member >> beNotResponsibleOf: aStudent [
	responsibleOf remove: aStudent.
	(aStudent responsibles includes: self)
		ifTrue: [ aStudent removeResponsible: self ]
	
]

{ #category : #accessing }
Member >> beResponsibleOf: aStudent [
	responsibleOf add: aStudent.
	(aStudent responsibles includes: self)
		ifFalse: [ aStudent addResponsible: self ]
	
]

{ #category : #private }
Member >> enrollmentFeePaid [
	^ self payments anySatisfy: [ :e | e fee isEnrollmentFee ]
]

{ #category : #initialization }
Member >> initialize [
	super initialize.
	responsibleOf := Set new.
	payments := Set new.
]

{ #category : #accessing }
Member >> number [
	^ number
]

{ #category : #accessing }
Member >> number: anObject [
	number := anObject
]

{ #category : #accessing }
Member >> payments [
	^ payments
]

{ #category : #accessing }
Member >> phoneNumber [
	^ phoneNumber
]

{ #category : #accessing }
Member >> phoneNumber: anObject [
	phoneNumber := anObject
]

{ #category : #accessing }
Member >> removePayment: aPayment [
	payments remove: aPayment.
	(aPayment member == self) ifTrue: [ aPayment member: nil ]
]

{ #category : #accessing }
Member >> responsibleOf [
	^ responsibleOf
]

{ #category : #accessing }
Member >> upToDate [ 
	^ self enrollmentFeePaid and: ((payments select: [ :each | each fee isMonthlyFee ]) size >= (1 to: Month current index) size)
]
