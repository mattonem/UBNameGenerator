Class {
	#name : #UBNameGeneratorApp,
	#superclass : #PjFileBasedWebApp,
	#category : #JSUBNameGenerator
}

{ #category : #description }
UBNameGeneratorApp class >> appClasses [
	<pharoJsSkip>
	^super appClasses, {UBNameGenerator} 
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> start [

	| nameInput result |
	super start.
	nameInput := document getElementById: #start.
	result := document getElementById: #result.
	nameInput addEventListener: #change block: [ 
		result innerHTML:
			(UBNameGenerator generateNameStartingWith: nameInput value first) ]
]
