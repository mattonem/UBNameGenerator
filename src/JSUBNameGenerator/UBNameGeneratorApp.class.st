Class {
	#name : #UBNameGeneratorApp,
	#superclass : #PjFileBasedWebApp,
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#category : #JSUBNameGenerator
}

{ #category : #description }
UBNameGeneratorApp class >> appClasses [

	<pharoJsSkip>
	^ super appClasses , { UBNameGeneratorWidget }
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
	UBNameGeneratorWidget for: self on: html named: #nameGenerator
]

{ #category : #description }
UBNameGeneratorApp class >> title [
	<pharoJsSkip>
	^ 'Ubuntu release name generator'
]

{ #category : #description }
UBNameGeneratorApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root meta language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> initialize [

	super initialize.
	self initializeComponentHolder  
]

{ #category : #'initialize-release' }
UBNameGeneratorApp >> start [
	super start.
]
