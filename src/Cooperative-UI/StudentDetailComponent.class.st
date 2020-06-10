Class {
	#name : #StudentDetailComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'student'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
StudentDetailComponent >> renderChildrenOn: html [
	html heading: 'Student'.
	
	myhtml detailEntry: 'Name' with: student name. 
	myhtml detailEntry: 'DNi' with: student dni.
	myhtml detailEntry: 'Grade' with: student grade.
	myhtml detailEntry: 'Division' with: student division.
	myhtml detailEntry: 'Responsibles' with: [ html unorderedList list: student responsibles; labels: [ :each | [ html anchor callback: [ self showMember: each ]; with: each ] ] ]

]

{ #category : #accessing }
StudentDetailComponent >> student [
	^ student
]

{ #category : #accessing }
StudentDetailComponent >> student: anObject [
	student := anObject
]
