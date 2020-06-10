Class {
	#name : #ObjectTableHeader,
	#superclass : #Object,
	#instVars : [
		'headerName',
		'tdWith',
		'tdCallback'
	],
	#category : #'Cooperative-UI'
}

{ #category : #'instance creation' }
ObjectTableHeader class >> name: headerName [
	^ (self new) headerName: headerName; yourself.
]

{ #category : #accessing }
ObjectTableHeader >> headerName [
	^ headerName
]

{ #category : #accessing }
ObjectTableHeader >> headerName: anObject [
	headerName := anObject
]

{ #category : #accessing }
ObjectTableHeader >> initialize [
	tdWith := [ :e | e ]
]

{ #category : #accessing }
ObjectTableHeader >> tdCallback [
	^ tdCallback
]

{ #category : #accessing }
ObjectTableHeader >> tdCallback: anObject [
	tdCallback := anObject
]

{ #category : #accessing }
ObjectTableHeader >> tdSelector: aSelector [
	tdWith := [ :e | e perform: aSelector ]
]

{ #category : #accessing }
ObjectTableHeader >> tdWith [
	^ tdWith
]

{ #category : #accessing }
ObjectTableHeader >> tdWith: anObject [
	tdWith := anObject
]
