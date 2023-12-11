Class {
	#name : #BaselineOfUBNameGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfUBNameGenerator
}

{ #category : #dependencies }
BaselineOfUBNameGenerator >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Camping'
			with: [ spec repository: 'github://mattonem/WildCamping:serialization' ].
		spec package: #JSUBNameGenerator.
		spec package: #'JSUBNameGenerator-Tests' ]
]
