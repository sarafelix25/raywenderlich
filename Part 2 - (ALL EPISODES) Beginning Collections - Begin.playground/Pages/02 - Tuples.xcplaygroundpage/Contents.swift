//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Tuples

let studentMark: (String, Int) = ("Sara", 21)
studentMark.0
studentMark.1
let studentData = (name: "Sara", mark: 21, petName: "Flokinho")
let theName = studentData.name
let theMark = studentData.mark
let thePetName = studentData.petName
let (name, mark, pet) = studentData
name
mark
pet

//: [⇒ Next: 03 - Challenge - Tuples](@next)

