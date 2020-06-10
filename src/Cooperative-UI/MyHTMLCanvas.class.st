Class {
	#name : #MyHTMLCanvas,
	#superclass : #WAComponent,
	#instVars : [
		'html'
	],
	#category : #'Cooperative-UI'
}

{ #category : #'instance creation' }
MyHTMLCanvas class >> on: anObject [
	^ (self new) html: anObject; yourself
]

{ #category : #accessing }
MyHTMLCanvas >> detailEntry: anEntry with: aBlock [
	self gridRow with: [ 
		self gridColumn with: [ html label: anEntry ].
		self gridColumn with: aBlock 
	].
	html break.
]

{ #category : #accessing }
MyHTMLCanvas >> gridColumn [
	^ html div class: 'column'
]

{ #category : #accessing }
MyHTMLCanvas >> gridRow [
	^ html div class: 'row'
]

{ #category : #accessing }
MyHTMLCanvas >> gridWith: aCollection columns: columns cellDo: aBlock [
	| size rows data |
	aCollection ifNotEmpty: [
		data := aCollection asOrderedCollection.
		size := data size.
		rows := (size / columns) ceiling.

		0 to: rows do: [ :row |
			self gridRow with: [
				1 to: columns do: [ :column |
					self gridColumn with: [ | index |
						index := (row * columns) + column.
						(index <= size)
							ifTrue: [ | item |
								item := data at: index.
								aBlock value: item
							]						
					]
				]
			]
		]
	]

	
	
]

{ #category : #accessing }
MyHTMLCanvas >> html: anObject [
	html := anObject
]

{ #category : #accessing }
MyHTMLCanvas >> tableFor: aCollection withHeaders: headers [
	html table: [ 
		html tableHead: [ 
			html tableRow with: [
				headers do: [ :header | html tableHeading: (header headerName) ]
			]			
		].
		html tableBody: [
			aCollection do: [ :each |
				html tableRow with: [
					headers do: [ :header |
						html tableData with: (
							header tdCallback
								ifNil: [ header tdWith value: each ]
								ifNotNil: [ [ html anchor callback: [ header tdCallback value: each ]; with: (header tdWith value: each) ] ]
						)
					]
				]
			]
		]
	]
]
