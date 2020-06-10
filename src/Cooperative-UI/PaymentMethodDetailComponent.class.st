Class {
	#name : #PaymentMethodDetailComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'paymentMethod'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
PaymentMethodDetailComponent >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
PaymentMethodDetailComponent >> paymentMethod: anObject [
	paymentMethod := anObject
]

{ #category : #rendering }
PaymentMethodDetailComponent >> renderChildrenOn: html [
	myhtml gridRow with: [
		myhtml gridColumn with: [ html heading: 'Payment Method'. ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self updatePaymentMethod: paymentMethod ]; with: 'Edit' ].
	].
	
	myhtml detailEntry: 'Name' with: paymentMethod name.
	myhtml detailEntry: 'Commission (%)' with: paymentMethod commission.
	
	html label: 'payments'.
	myhtml tableFor: paymentMethod payments withHeaders: {
		(ObjectTableHeader name: '') tdSelector: #printString; tdCallback: [ :e | self showPayment: e ].
		(ObjectTableHeader name: 'Member') tdSelector: #member ; tdCallback: [ :e | self showMember: e member ].
		(ObjectTableHeader name: 'Fee') tdSelector: #fee; tdCallback: [ :e | self showFee: e fee ].
		(ObjectTableHeader name: 'Amount') tdSelector: #amount.
		(ObjectTableHeader name: 'Commission (%)') tdSelector: #commission.
		(ObjectTableHeader name: 'Date Paid') tdSelector: #datePaid
	}
]
