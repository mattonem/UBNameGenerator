Class {
	#name : #UBNameGeneratorApp,
	#superclass : #WCComponentApp,
	#category : #JSUBNameGenerator
}

{ #category : #accessing }
UBNameGeneratorApp class >> rootComponentClass [

	^ UBNameGeneratorWidget
]

{ #category : #accessing }
UBNameGeneratorApp class >> staticComponentSerialized [

	<jsLiteralGenerator>
	^ component asPhxJsonString
]

{ #category : #description }
UBNameGeneratorApp class >> title [
	<pharoJsSkip>
	^ 'Ubuntu release name generator'
]

{ #category : #description }
UBNameGeneratorApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]
