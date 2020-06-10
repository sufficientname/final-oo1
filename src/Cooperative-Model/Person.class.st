Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'name',
		'dni'
	],
	#category : #'Cooperative-Model'
}

{ #category : #'instance creation' }
Person class >> name: aName dni: aDNI [
	^ (self new) name: aName; dni: aDNI; yourself
]

{ #category : #accessing }
Person >> dni [
	^ dni
]

{ #category : #accessing }
Person >> dni: anObject [
	dni := anObject
]

{ #category : #accessing }
Person >> name [
	^ name
]

{ #category : #accessing }
Person >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Person >> printString [
	^ name, '(', dni printString ,')'
]
