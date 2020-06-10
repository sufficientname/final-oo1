Class {
	#name : #FeeDetailComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'fee'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
FeeDetailComponent >> fee [
	^ fee
]

{ #category : #accessing }
FeeDetailComponent >> fee: anObject [
	fee := anObject
]

{ #category : #rendering }
FeeDetailComponent >> renderChildrenOn: html [
	myhtml gridRow with: [ 
		myhtml gridColumn with: [ html heading: 'Fee' ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self updateFee: fee ]; with: 'Edit' ]
	].
	
	myhtml detailEntry: 'Amount' with: fee amount.
	fee isMonthlyFee ifTrue: [
		myhtml detailEntry: 'Month' with: fee month
	].
	
	html label: 'payments'.
	myhtml tableFor: fee payments withHeaders: {
		(ObjectTableHeader name: '') tdSelector: #printString; tdCallback: [ :e | self showPayment: e ].
		(ObjectTableHeader name: 'Member') tdSelector: #member ; tdCallback: [ :e | self showMember: e ].
		(ObjectTableHeader name: 'Payment Method') tdSelector: #paymentMethod; tdCallback: [ :e | self showPaymentMethod: e paymentMethod ].
		(ObjectTableHeader name: 'Amount') tdSelector: #amount.
		(ObjectTableHeader name: 'Commission (%)') tdSelector: #commission.
		(ObjectTableHeader name: 'Date Paid') tdSelector: #datePaid
	}
]
