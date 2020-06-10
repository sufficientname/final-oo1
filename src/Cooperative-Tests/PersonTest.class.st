Class {
	#name : #PersonTest,
	#superclass : #TestCase,
	#instVars : [
		'person'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
PersonTest >> setUp [
	person := Person name: 'John Doe' dni: 20100100.
]

{ #category : #running }
PersonTest >> testDni [
	person dni: 20100100.
	self assert: person dni equals: 20100100 
]

{ #category : #running }
PersonTest >> testName [
	person name: 'John Doe'.
	self assert: person name equals: 'John Doe' 
]

{ #category : #running }
PersonTest >> testNameDni [
	| aPerson |
	aPerson := Person name: 'John Doe' dni: 20100100.
	self assert: aPerson name equals: 'John Doe'.
	self assert: aPerson dni equals: 20100100
]
