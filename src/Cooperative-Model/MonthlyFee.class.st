Class {
	#name : #MonthlyFee,
	#superclass : #Fee,
	#instVars : [
		'month'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
MonthlyFee class >> amount: anAmount month: aMonth [
	^ (self amount: anAmount) month: aMonth; yourself
]

{ #category : #accessing }
MonthlyFee >> isMonthlyFee [
	^ true
]

{ #category : #accessing }
MonthlyFee >> month [
	^ month
]

{ #category : #accessing }
MonthlyFee >> month: anObject [
	month := anObject
]

{ #category : #accessing }
MonthlyFee >> printString [
	"^ 'Monthly Fee(' , month printString , ')'"
	^ month name, ' Fee'
]
