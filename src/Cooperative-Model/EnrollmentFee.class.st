Class {
	#name : #EnrollmentFee,
	#superclass : #Fee,
	#category : #'Cooperative-Model'
}

{ #category : #accessing }
EnrollmentFee >> isEnrollmentFee [
	 ^ true
]

{ #category : #accessing }
EnrollmentFee >> printString [
	^ 'Enrollment Fee'
]
