//: [⇐ Previous: 04 - Challenge - Dictionaries](@previous)
//: ## Episode 05: Creating and Populating Sets

var someSet: Set<Int> = [1, 2, 3, 1]

someSet.contains(1)
someSet.contains(99)

someSet.insert(5)
let removedElement = someSet.remove(3)
someSet
let nilElement = someSet.remove(42)

let anotherSet: Set<Int> = [5, 7, 13]

let intersection = someSet.intersection(anotherSet)
let difference = someSet.symmetricDifference(anotherSet)
let union = someSet.union(anotherSet)

someSet.formUnion(anotherSet)
someSet
anotherSet

//: [⇒ Next: 06 - Challenge - Sets](@next)

