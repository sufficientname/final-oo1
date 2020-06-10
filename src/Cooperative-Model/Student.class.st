Class {
	#name : #Student,
	#superclass : #Person,
	#instVars : [
		'grade',
		'division',
		'responsibles'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
Student class >> name: aName dni: aDNI grade: aGrade division: aDivision [
	^ (self name: aName dni: aDNI) grade: aGrade; division: aDivision; yourself
]

{ #category : #accessing }
Student >> addResponsible: aMember [
	responsibles add: aMember.
	(aMember responsibleOf includes: self)
		ifFalse: [ aMember beResponsibleOf: self ]
]

{ #category : #accessing }
Student >> division [
	^ division
]

{ #category : #accessing }
Student >> division: anObject [
	division := anObject
]

{ #category : #accessing }
Student >> grade [
	^ grade
]

{ #category : #accessing }
Student >> grade: anObject [
	grade := anObject
]

{ #category : #initialization }
Student >> initialize [
	super initialize.
	responsibles := Set new
]

{ #category : #accessing }
Student >> removeResponsible: aMember [
	responsibles remove: aMember.
	(aMember responsibleOf includes: self)
		ifTrue: [ aMember beNotResponsibleOf: self ]
]

{ #category : #accessing }
Student >> responsibles [
	^ responsibles
]
