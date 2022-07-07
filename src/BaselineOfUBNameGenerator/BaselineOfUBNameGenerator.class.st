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
			baseline: 'PharoJS'
			with: [ spec repository: 'github://PharoJS/PharoJS:pharo9' ].
		spec package: #JSUBNameGenerator ]
]
