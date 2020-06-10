Class {
	#name : #PaymentListComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'payments'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
PaymentListComponent >> renderChildrenOn: html [
	myhtml gridRow with: [
		myhtml gridColumn with: [  html heading: 'Payments'. ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self createPayment ]; with: 'New Payment' ].
	].

	myhtml tableFor: cooperative payments withHeaders: {
		(ObjectTableHeader name: 'Payment') tdSelector: #printString; tdCallback: [ :e | self showPayment: e ].
		(ObjectTableHeader name: 'Member') tdSelector: #member; tdCallback: [ :e | self showMember: e member ].
		(ObjectTableHeader name: 'Fee') tdSelector: #fee; tdCallback: [ :e | self showFee: e fee ].
		(ObjectTableHeader name: 'Payment Method') tdWith: #paymentMethod; tdCallback: [ :e | self showPaymentMethod: e paymentMethod ].
		(ObjectTableHeader name: 'Amount') tdSelector: #amount.
		(ObjectTableHeader name: 'Commission (%)') tdSelector: #commission.
		(ObjectTableHeader name: 'Date Paid') tdSelector: #datePaid
	}. 

]
