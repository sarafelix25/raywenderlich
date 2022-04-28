//: [⇐ Previous: 06 - Challenge - Logical Operators](@previous)
//: ## Episode 07: Optionals
var petName: String?
petName = "Flokinho"
print(petName)
petName = nil

var result: Int? = 30
print(result)
//print(result + 1)

petName = "Flokinho"
var petAge: Int? = 10
var unwrappedPetName = petName!
print("The pet's name is \(unwrappedPetName)")

if let petName = petName,
    let petAge = petAge {
        print("The pet is \(petName) and they are \(petAge)")
} else {
    print("No pet name or age")
}

var optionalInt: Int? = nil
var requiredResult = optionalInt ?? 0
//: [⇒ Next: 08 - Challenge - Optionals](@next)
