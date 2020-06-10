Class {
	#name : #CooperativeWebUI,
	#superclass : #WAComponent,
	#instVars : [
		'cooperative'
	],
	#category : #'Cooperative-UI'
}

{ #category : #initialization }
CooperativeWebUI >> initialize [.
	super initialize.
	(cooperative := Cooperative new)
		"payment methods"
		newPaymentMethod: (PaymentMethod name: 'kiosco' commission: 15);
		newPaymentMethod: (PaymentMethod name: 'transferencia' commission: 0);
		newPaymentMethod: (PaymentMethod name: 'pago facil' commission: 10);
		"students"
		newStudent: (Student new dni: 40000001; name: 'Jack Shephard'; grade: 1; division: 1);
		newStudent: (Student new dni: 40000002; name: 'Kate Austen'; grade: 1; division: 1);
		newStudent: (Student new dni: 40000003; name: 'James Ford'; grade: 1; division: 1);
		newStudent: (Student new dni: 40000004; name: 'Juliet Burke'; grade: 1; division: 1);
		newStudent: (Student new dni: 40000005; name: 'Claire Littleton'; grade: 1; division: 1);
		"enrollment fees"
		newFee: (EnrollmentFee amount: 200);
		"monthly fees"
		newFee: (MonthlyFee amount: 100 month: Month january);
		newFee: (MonthlyFee amount: 100 month: Month february);
		newFee: (MonthlyFee amount: 100 month: Month march);
		newFee: (MonthlyFee amount: 100 month: Month april);
		"members"
		newMember: (Member new dni: 30000001; name: 'John Locke'; phoneNumber: '2215000001'; beResponsibleOf: (cooperative students detect: [ :each | each dni = 40000001 ]));
		newMember: (Member new dni: 30000002; name: 'Sayid Jarrah'; phoneNumber: '2215000002'; beResponsibleOf: (cooperative students detect: [ :each | each dni = 40000002 ]));
		newMember: (Member new dni: 30000003; name: 'Hugo Reyes'; phoneNumber: '2215000003'; beResponsibleOf: (cooperative students detect: [ :each | each dni = 40000003 ]));
		newMember: (Member new dni: 30000004; name: 'Sun-Hwa Kwon'; phoneNumber: '2215000004'; beResponsibleOf: (cooperative students detect: [ :each | each dni = 40000004 ]));
		newMember: (Member new dni: 30000005; name: 'Jin-Soo Kwon'; phoneNumber: '2215000005'; beResponsibleOf: (cooperative students detect: [ :each | each dni = 40000005 ]));
		"payments"
		newPayment: (Payment new member: (cooperative members any); fee: (cooperative fees any); paymentMethod: (cooperative paymentMethods any))
]

{ #category : #rendering }
CooperativeWebUI >> renderContentOn: html [
	html anchor
		callback: [ self call: (CooperativeHomeComponent cooperative: cooperative) ];
		with: 'Enter'.
]
