Class {
	#name : #PaymentMethodEditorComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'paymentMethod'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
PaymentMethodEditorComponent >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
PaymentMethodEditorComponent >> paymentMethod: aPaymentMethod [
	paymentMethod := aPaymentMethod
]

{ #category : #rendering }
PaymentMethodEditorComponent >> renderChildrenOn: html [
	html heading: 'Payment Method'.
	html form: [ 
		html text: 'name:'.
		html textInput on: #name of: paymentMethod.
		html break.
		html text: 'commission:'.
		html numberInput on: #commission of: paymentMethod.
		html break.
		html submitButton callback: [ self save ]; value: 'Save'.
	]
]

{ #category : #accessing }
PaymentMethodEditorComponent >> save [
	self answer
]
