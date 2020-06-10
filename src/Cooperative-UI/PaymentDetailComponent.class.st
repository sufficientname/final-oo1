Class {
	#name : #PaymentDetailComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'payment'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
PaymentDetailComponent >> payment [
	^ payment
]

{ #category : #accessing }
PaymentDetailComponent >> payment: anObject [
	payment := anObject
]

{ #category : #rendering }
PaymentDetailComponent >> renderChildrenOn: html [
	
	myhtml gridRow with: [ 
		myhtml gridColumn with: [ html heading: 'Payment'. ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self updatePayment: payment ]; with: 'Edit' ]
	].
	
	myhtml detailEntry: 'Member' with: [ html anchor callback: [ self showMember: payment member ]; with: payment member ].
	myhtml detailEntry: 'Fee' with: [ html anchor callback: [ self showFee: payment fee ]; with: payment fee ].
	myhtml detailEntry: 'Payment Method' with: [ html anchor callback: [ self showPaymentMethod: payment paymentMethod ]; with: payment paymentMethod ].
	myhtml detailEntry: 'Amount' with: payment amount.
	myhtml detailEntry: 'Commission' with: payment commission.
	myhtml detailEntry: 'Amount after commission' with: payment amountAfterCommision.
	myhtml detailEntry: 'Date Paid' with: payment datePaid.

]
