Class {
	#name : #StudentListComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'students'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
StudentListComponent >> renderChildrenOn: html [
	myhtml gridRow with: [
		myhtml gridColumn with: [  html heading: 'Students'. ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self importStudents ]; with: 'Import Students' ].
	].

	myhtml tableFor: cooperative students withHeaders: {
		(ObjectTableHeader name: 'DNI') tdSelector: #dni; tdCallback: [ :e | self showStudent: e  ].
		(ObjectTableHeader name: 'Name') tdSelector: #name.
		(ObjectTableHeader name: 'Grade') tdSelector: #grade.
		(ObjectTableHeader name: 'Division') tdSelector: #division.
	}.

]
