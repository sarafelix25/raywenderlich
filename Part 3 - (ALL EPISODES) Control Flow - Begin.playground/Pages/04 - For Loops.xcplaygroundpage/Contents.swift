//: [⇐ Previous: 03 - Challenge - While Loops](@previous)
//: ## Episode 04: For Loops

/*
//intervalo fechado
let closedRange = 0...5

//intervalo semi aberto
let halfOpenRange = 0..<5
 
*/

var usefulValues = 5
let closedRange = 0...usefulValues
let halfOpenRange = 0..<usefulValues

var sum = 0
let count = 10
for i in 1...count {
    sum += i
}

print(sum)

for _ in 1...count where count > 100 {
    print("roar")
}

for i in 1...count where i % 2 == 1 {
    print("\(i) is an odd number")
}

//: [⇒ Next: 05 - Challenge - For Loops](@next)
