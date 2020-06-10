Class {
	#name : #MemberDetailComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'member'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
MemberDetailComponent >> member [
	^ member
]

{ #category : #accessing }
MemberDetailComponent >> member: anObject [
	member := anObject
]

{ #category : #rendering }
MemberDetailComponent >> renderChildrenOn: html [
	myhtml gridRow with: [ 
		myhtml gridColumn with: [ html heading: 'Member' ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self updateMember: member ]; with: 'Edit' ].
	].
	
	myhtml detailEntry: 'Name' with: member name. 
	myhtml detailEntry: 'DNI' with: member dni.
	myhtml detailEntry: 'Number' with: member number.
	myhtml detailEntry: 'Phone number' with: member phoneNumber.
	myhtml detailEntry: 'Up To Date' with: member upToDate.
	myhtml detailEntry: 'Responsible of' with: [ html unorderedList list: member responsibleOf; labels: [ :each | [ html anchor callback: [ self showStudent: each ]; with: each ] ] ].
		
	html label: 'Payments'.
	myhtml tableFor: member payments withHeaders: {
		(ObjectTableHeader name: '') tdSelector: #printString; tdCallback: [ :e | self showPayment: e ].
		(ObjectTableHeader name: 'Fee') tdSelector: #fee; tdCallback: [ :e | self showFee: e fee ].
		(ObjectTableHeader name: 'Payment Method') tdSelector: #paymentMethod; tdCallback: [ :e | self showPaymentMethod: e paymentMethod ].
		(ObjectTableHeader name: 'Amount') tdSelector: #amount.
		(ObjectTableHeader name: 'Commission (%)') tdSelector: #commission.
		(ObjectTableHeader name: 'Date Paid') tdSelector: #datePaid
	}
]
