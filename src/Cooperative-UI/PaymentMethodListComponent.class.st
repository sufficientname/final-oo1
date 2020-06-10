Class {
	#name : #PaymentMethodListComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'paymentMethods'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
PaymentMethodListComponent >> renderChildrenOn: html [
	myhtml gridRow with: [
		myhtml gridColumn with: [  html heading: 'Payment Methods'. ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self createPaymentMethod ]; with: 'New Payment Method' ].
	].

	myhtml tableFor: cooperative paymentMethods withHeaders: {
		(ObjectTableHeader name: 'Name') tdSelector: #name; tdCallback: [ :e | self showPaymentMethod: e ].
		(ObjectTableHeader name: 'Commission (%)') tdSelector: #commission.
	}.


]
