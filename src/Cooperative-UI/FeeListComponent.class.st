Class {
	#name : #FeeListComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'fees'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
FeeListComponent >> renderChildrenOn: html [
	myhtml gridRow with: [ 
		myhtml gridColumn with: [ html heading: 'Fees' ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self createFee: MonthlyFee ]; with: 'New Monthly Fee' ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self createFee: EnrollmentFee ]; with: 'New Enrollment Fee' ]
	].

	myhtml tableFor: cooperative fees withHeaders: {
		(ObjectTableHeader name: 'Fee') tdCallback: [ :e | self showFee: e ].
		(ObjectTableHeader name: 'Amount') tdSelector: #amount
	}.
]
