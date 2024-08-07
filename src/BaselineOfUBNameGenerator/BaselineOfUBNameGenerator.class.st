Class {
	#name : 'BaselineOfUBNameGenerator',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfUBNameGenerator',
	#package : 'BaselineOfUBNameGenerator'
}

{ #category : 'dependencies' }
BaselineOfUBNameGenerator >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Camping'
			with: [ spec repository: 'github://mattonem/WildCamping:master' ].
		spec package: #JSUBNameGenerator.
		spec package: #'JSUBNameGenerator-Tests' ]
]
