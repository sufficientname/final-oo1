Class {
	#name : #FeeEditorComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'fee'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
FeeEditorComponent >> fee [
	^ fee
]

{ #category : #accessing }
FeeEditorComponent >> fee: anObject [
	fee := anObject
]

{ #category : #rendering }
FeeEditorComponent >> renderChildrenOn: html [
	(fee isMonthlyFee) ifTrue: [  
		html heading: 'Monthly Fee'.
		html form: [ 
			html text: 'amount: '.
			html numberInput on: #amount of: fee.
			html break.
			html text: 'month: '.
			html select list: self months; on: #month of: fee.
			html break.
			html submitButton callback: [ self save ]; value: 'Save'.
		]
	].
	(fee isEnrollmentFee) ifTrue: [  
		html heading: 'Enrollment Fee'.
		html form: [
			html text: 'amount: '.
			html numberInput on: #amount of: fee.
			html break.
			html submitButton callback: [ self save ]; value: 'Save'.
		]
	]
	
]

{ #category : #accessing }
FeeEditorComponent >> save [
	self answer.
]
