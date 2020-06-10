Class {
	#name : #MonthlyFeeTest,
	#superclass : #TestCase,
	#instVars : [
		'fee'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
MonthlyFeeTest >> setUp [
	fee := MonthlyFee amount: 100 month: Month january.
]

{ #category : #running }
MonthlyFeeTest >> testAmountMonth [
	| aFee |
	aFee := MonthlyFee amount: 200 month: Month january.
	self assert: aFee amount equals: 200.
	self assert: aFee month equals: Month january
]

{ #category : #running }
MonthlyFeeTest >> testIsMonthlyFee [
	self assert: fee isMonthlyFee.
	self assert: fee isEnrollmentFee not.
]

{ #category : #running }
MonthlyFeeTest >> testMonth [
	fee month: Month january.
	self assert: fee month equals: Month january.
	
	
]
