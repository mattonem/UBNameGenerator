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

{ #category : #description }
UBNameGeneratorApp class >> bridgeClientClass [
	<pharoJsSkip>
	
	^ PjZnHostedBrowserBridgeClient
]

{ #category : #description }
UBNameGeneratorApp class >> exporterClass [
	<pharoJsSkip>
	
	^ PjFileExporterWithIndexHtml
]

{ #category : #description }
UBNameGeneratorApp class >> generateHtmlUsing: html [

	<pharoJsSkip>
	html div
		class: 'container';
		with: [ :cont | 
			cont div
				class: 'card';
				with: [ :card | 
					card div
						class: 'card-header';
						with: 'Ubuntu Name Generator'.
					card div
						class: 'card-body';
						with: [ :cardBody | 
							cardBody div
								class: 'mb-3 row';
								with: [ :form | 
									form label
										class: 'col-auto col-form-label';
										for: 'start';
										with: 'First letter:'.
									form div
										class: 'col-auto';
										with: [ :buttonDiv | 
											buttonDiv textInput
												class: 'form-control';
												maxLength: 1;
												id: #start ].
									form div
										class: 'col-auto';
										with: [ :inputDiv | 
											inputDiv button
												class: 'btn btn-primary mb-3';
												id: #generateName;
												with: 'Generate name' ].
									form preformatted id: 'result' ] ] ] ]
]

{ #category : #description }
UBNameGeneratorApp class >> title [
	<pharoJsSkip>
	^ 'Ubuntu release name generator'
]

{ #category : #description }
UBNameGeneratorApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
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
