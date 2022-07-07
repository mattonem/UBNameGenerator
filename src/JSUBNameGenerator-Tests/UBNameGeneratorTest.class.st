"
An UBNameGeneratorTest is a test class for testing the behavior of UBNameGenerator
"
Class {
	#name : #UBNameGeneratorTest,
	#superclass : #TestCase,
	#category : #'JSUBNameGenerator-Tests'
}

{ #category : #tests }
UBNameGeneratorTest >> testGenerateName [
	| generated |
	generated := UBNameGenerator generateNameStartingWith: $a.
	self assert: generated first equals: $A
]
