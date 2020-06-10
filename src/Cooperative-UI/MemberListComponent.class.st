Class {
	#name : #MemberListComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'members'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
MemberListComponent >> renderChildrenOn: html [

	myhtml gridRow with: [ 
		myhtml gridColumn with: [ html heading: 'Members' ].
		myhtml gridColumn with: [ html anchor class: 'button column'; callback: [ self createMember ]; with: 'New Member' ].
	].

	myhtml tableFor: cooperative members withHeaders: {
		(ObjectTableHeader name: 'DNI') tdSelector: #dni; tdCallback: [ :e | self showMember: e ].
		(ObjectTableHeader name: 'Name') tdSelector: #name.
		(ObjectTableHeader name: 'Number') tdSelector: #number.
		(ObjectTableHeader name: 'Phone Number') tdSelector: #phoneNumber.
		(ObjectTableHeader name: 'Up To Date') tdSelector: #upToDate
	}


]
