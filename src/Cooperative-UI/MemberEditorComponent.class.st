Class {
	#name : #MemberEditorComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'member'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
MemberEditorComponent >> member [
	^ member
]

{ #category : #accessing }
MemberEditorComponent >> member: anObject [
	member := anObject
]

{ #category : #rendering }
MemberEditorComponent >> renderChildrenOn: html [
	html heading: 'Member'.
	html form with: [  
		html label: 'DNI'.
		html textInput on: #dni of: member.
		html break.
		html label: 'Name'.
		html textInput on: #name of: member.
		html break.
		html label: 'Phone Number: '.
		html textInput on: #phoneNumber of: member.
		html break.
		html label: 'Responsible of: '.
		myhtml gridWith: member responsibleOf columns: 4 cellDo: [ :each |
			html checkbox value: true; callback: [ :checked |	checked ifFalse: [ member beNotResponsibleOf: each ] ].
			html text: each.
		]. 
		myhtml gridWith: (cooperative students difference: member responsibleOf) columns: 4 cellDo: [ :each |
			html checkbox value: false; callback: [ :checked | checked ifTrue: [ member beResponsibleOf: each. ] ].
			html text: each.
		].

		html submitButton callback: [ self save ]; value: 'Save'.
	]
]

{ #category : #accessing }
MemberEditorComponent >> save [
	self answer
]
