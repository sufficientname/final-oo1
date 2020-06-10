Class {
	#name : #StudentImportComponent,
	#superclass : #CooperativeComponent,
	#instVars : [
		'stringCSV'
	],
	#category : #'Cooperative-UI'
}

{ #category : #rendering }
StudentImportComponent >> renderChildrenOn: html [
	html heading: 'Import Students'.
	html form: [
		html label: 'CSV'.
		html text: '(row separator: < new line > | valueSeparator < ; >)'.
		html break.
		html text: 'name;dni;grade;division'.
		html textArea on: #stringCSV of: self.
		html submitButton callback: [ self save ]; value: 'Save'.
	]

]

{ #category : #accessing }
StudentImportComponent >> save [
	| rowSeparator valueSeparator |
	rowSeparator := Character cr.
	valueSeparator := ';'.
	(stringCSV) trim splitOn: rowSeparator do: [ :row |
		| values |
		values := row splitOn: valueSeparator.
		(values size >= 4) ifTrue: [ 
			cooperative newStudent: (Student new
				name: (values at: 1) trim;
				dni: (values at: 2) trim;
				grade: (values at: 3) trim;
				division: (values at: 4) trim
			). 
		]
	].
	self answer
]

{ #category : #accessing }
StudentImportComponent >> stringCSV [
	^ stringCSV
]

{ #category : #accessing }
StudentImportComponent >> stringCSV: anObject [
	stringCSV := anObject
]
