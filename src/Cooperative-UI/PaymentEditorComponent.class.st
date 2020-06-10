Class {
	#name : #PaymentEditorComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'member',
		'payment'
	],
	#category : #'Cooperative-UI'
}

{ #category : #accessing }
PaymentEditorComponent >> member [
	^ member
]

{ #category : #accessing }
PaymentEditorComponent >> member: anObject [
	member := anObject
]

{ #category : #accessing }
PaymentEditorComponent >> payment [
	^ payment
]

{ #category : #accessing }
PaymentEditorComponent >> payment: anObject [
	payment := anObject
]

{ #category : #rendering }
PaymentEditorComponent >> renderChildrenOn: html [
	" if provided use the payment method member "
	member := member ifNil: [ payment member ]. 
	html heading: 'Payment'.
	html form: [
		html text: 'member: '.
		member
			" select member "
			ifNil: [
				html select list: cooperative members; on: #member of: self.
				html submitButton value: 'select' ]
			" create payment "
			ifNotNil: [
				html select list: cooperative members; selected: member; on: #member of: self.
				html break.
				html text: 'fee: '.
				html select list: cooperative fees; on: #fee of: payment.
				html break.
				html text: 'payment method: '.
				html select list: cooperative paymentMethods; on: #paymentMethod of: payment.
				html break.
				html submitButton callback: [ self save ]; value: 'save' ]
			]
]

{ #category : #accessing }
PaymentEditorComponent >> save [
	payment member: member.
	self answer
]
