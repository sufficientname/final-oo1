Class {
	#name : #EnrollmentFeeTest,
	#superclass : #TestCase,
	#instVars : [
		'fee'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
EnrollmentFeeTest >> setUp [
	fee := EnrollmentFee amount: 200.
]

{ #category : #running }
EnrollmentFeeTest >> testIsEnrollmentFee [
	self assert: fee isEnrollmentFee.
	self assert: fee isMonthlyFee not.
]
