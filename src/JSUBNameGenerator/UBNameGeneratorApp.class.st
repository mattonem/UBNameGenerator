Class {
	#name : #UBNameGeneratorApp,
	#superclass : #PjFileBasedWebApp,
	#instVars : [
		'result',
		'nameInput'
	],
	#category : #JSUBNameGenerator
}

{ #category : #description }
UBNameGeneratorApp class >> appClasses [
	<pharoJsSkip>
	^super appClasses, {UBNameGenerator} 
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> generateName [

	| generatedName |
	generatedName := nameInput value
		                 ifNotEmpty: [ 
		                 UBNameGenerator generateNameStartingWith:
			                 nameInput value first ]
		                 ifEmpty: [ UBNameGenerator generateName ].
	^ generatedName
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> start [

	| generateName |
	super start.
	nameInput := document getElementById: #start.
	result := document getElementById: #result.
	generateName := document getElementById: #generateName.
	generateName addEventListener: #click block: [ 
		| generatedName |
		generatedName := self generateName.
		self updateResult: generatedName ].
	nameInput addEventListener: #change block: [ 
		| generatedName |
		generatedName := self generateName.
		self updateResult: generatedName ].
	self updateResult: UBNameGenerator generateName
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> updateResult: generatedName [

	^ result innerHTML: generatedName
]
