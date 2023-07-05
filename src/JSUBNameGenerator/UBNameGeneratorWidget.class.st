Class {
	#name : #UBNameGeneratorWidget,
	#superclass : #WCComponent,
	#category : #JSUBNameGenerator
}

{ #category : #rendering }
UBNameGeneratorWidget >> _getLocationHash [
	<javascript:'return window.location.hash'>
]

{ #category : #rendering }
UBNameGeneratorWidget >> generateNameWithTextInput: nameInput [

	| generatedName |
	generatedName := nameInput value
		                 ifNotEmpty: [ 
		                 UBNameGenerator generateNameStartingWith:
			                 nameInput value first ]
		                 ifEmpty: [ UBNameGenerator generateName ].
	^ generatedName
]

{ #category : #rendering }
UBNameGeneratorWidget >> getLocationHash [
	^ self _getLocationHash allButFirst
]

{ #category : #rendering }
UBNameGeneratorWidget >> renderHtmlOn: html [

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

{ #category : #rendering }
UBNameGeneratorWidget >> start [

	| nameInput result generateName generatedName |
	nameInput := self getElementById: #start.
	result := self getElementById: #result.
	generateName := self getElementById: #generateName.

	generateName addEventListener: #click block: [ 
		generatedName := self generateNameWithTextInput: nameInput.
		result innerHTML: generatedName ].
	nameInput addEventListener: #change block: [ 
		generatedName := self generateNameWithTextInput: nameInput.
		result innerHTML: generatedName ].
	 
	self getLocationHash
		at: 1
		ifPresent: [ :value | (self getElementById: #start) value: value ].
	generatedName := self generateNameWithTextInput: nameInput.
	result innerHTML: generatedName
]
