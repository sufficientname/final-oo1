Class {
	#name : #StudentTest,
	#superclass : #TestCase,
	#instVars : [
		'student',
		'member',
		'otherMember'
	],
	#category : #'Cooperative-Tests'
}

{ #category : #running }
StudentTest >> setUp [
	student := Student name: 'Bob Doe' dni: 40100100 grade: 1 division: 1.
	
	member := Member name: 'John Doe' dni: 20100100 phoneNumber: 2215558888.
	otherMember := Member name: 'Jane Doe' dni: 20200200 phoneNumber: 2216669999.
]

{ #category : #running }
StudentTest >> testAddResponsible [
	student addResponsible: member.
	self assert: student responsibles size equals: 1.
	self assertCollection: student responsibles includesAll: { member }.
	self assert: member responsibleOf size equals: 1.
	self assertCollection: member responsibleOf includesAll: { student }.	
]

{ #category : #running }
StudentTest >> testDivision [
	student division: 1.
	self assert: student division equals: 1.
]

{ #category : #running }
StudentTest >> testGrade [
	student grade: 1.
	self assert: student grade equals: 1.
]

{ #category : #running }
StudentTest >> testInitialize [
	| aStudent |
	aStudent := Student new.
	self assert: aStudent responsibles isEmpty
]

{ #category : #running }
StudentTest >> testNameDniGradeDivision [
	| aStudent |
	aStudent := Student name: 'Bob Doe' dni: 40100100 grade: 1 division: 1.
	self assert: aStudent name equals: 'Bob Doe'.
	self assert: aStudent dni equals: 40100100.
	self assert: aStudent grade equals: 1.
	self assert: aStudent division equals: 1.
]

{ #category : #running }
StudentTest >> testRemoveResponsible [
	student addResponsible: member.
	student removeResponsible: member.
	self assert: student responsibles isEmpty.
	self assert: member responsibleOf isEmpty.	
]

{ #category : #running }
StudentTest >> testResponsibles [
	self assert: student responsibles isEmpty.
	student addResponsible: member.
	student addResponsible: otherMember.
	self assert: student responsibles size equals: 2.
	self assertCollection: student responsibles includesAll: { member. otherMember }.
	self assert: member responsibleOf size equals: 1.
	self assertCollection: member responsibleOf includesAll: { student }.
	self assert: otherMember responsibleOf size equals: 1.
	self assertCollection: otherMember responsibleOf includesAll: { student }.	
]
