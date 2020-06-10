Class {
	#name : #CooperativeHomeComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'paidFeesMember',
		'calculateIncomeStartDate',
		'calculateIncomeEndDate',
		'listUpToDateMembers'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
CooperativeHomeComponent >> calculateIncomeEndDate [
	^ calculateIncomeEndDate
]

{ #category : #accessing }
CooperativeHomeComponent >> calculateIncomeEndDate: anObject [
	calculateIncomeEndDate := anObject asDate
]

{ #category : #accessing }
CooperativeHomeComponent >> calculateIncomeStartDate [
	^ calculateIncomeStartDate
]

{ #category : #accessing }
CooperativeHomeComponent >> calculateIncomeStartDate: anObject [
	calculateIncomeStartDate := anObject asDate
]

{ #category : #accessing }
CooperativeHomeComponent >> paidFeesMember [
	^ paidFeesMember
]

{ #category : #accessing }
CooperativeHomeComponent >> paidFeesMember: anObject [
	paidFeesMember := anObject
]

{ #category : #rendering }
CooperativeHomeComponent >> renderChildrenOn: html [
	html heading: 'Calculate Income'.
	html form: [
		html label: 'Start date'.
		html textInput type: 'date'; on: #calculateIncomeStartDate of: self; value: (Date today onPreviousMonth printFormat: #(3 2 1 $- 1 1 2)). "default value only works if: YYYY-MM-DD"
		html label: 'End date'.
		html textInput type: 'date'; on: #calculateIncomeEndDate of: self; value: (Date today printFormat: #(3 2 1 $- 1 1 2)). "default value only works if: YYYY-MM-DD"
		html break.
		html submitButton
	].
	(calculateIncomeStartDate isNotNil and: calculateIncomeEndDate isNotNil) ifTrue: [
		html label: 'Income between ', calculateIncomeStartDate asString,
						' and: ', calculateIncomeEndDate asString,
						' is: $', (cooperative calculateIncomeBetween: calculateIncomeStartDate and: calculateIncomeEndDate) asString
	].

	html horizontalRule.

	html heading: 'Query Member Paid Fees'.
	html form: [ 
		html label: 'Member'. 
		html select list: cooperative members; on: #paidFeesMember of: self.
		html break.
		html submitButton
	].
	(paidFeesMember) ifNotNil: [
		myhtml tableFor: paidFeesMember payments withHeaders: { 
			(ObjectTableHeader name: 'Payment') tdCallback: [ :e | self showPayment: e ].
			(ObjectTableHeader name: 'Fee') tdSelector: #fee; tdCallback: [ :e | self showFee: e ]
		}
	].

	html horizontalRule.
	
	html heading: 'Query Up To Date Members'.
	html form: [
		html submitButton callback: [ listUpToDateMembers := 'true' ].
	].
	(listUpToDateMembers) ifNotNil: [
		myhtml tableFor: cooperative upToDateMembers withHeaders: {
			(ObjectTableHeader name: 'DNI') tdSelector: #dni; tdCallback: [ :e | self showMember: e ].
			(ObjectTableHeader name: 'Name') tdSelector: #name.
			(ObjectTableHeader name: 'Number') tdSelector: #number.
			(ObjectTableHeader name: 'Phone Number') tdSelector: #phoneNumber.
			(ObjectTableHeader name: 'Up To Date') tdSelector: #upToDate
		}
	].

	html horizontalRule.

]
