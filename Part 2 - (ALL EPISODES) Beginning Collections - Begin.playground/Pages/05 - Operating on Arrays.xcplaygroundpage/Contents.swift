//: [⇐ Previous: 04 - Arrays](@previous)
//: ## Episode 05: Operating on Arrays

var pastries: [String] = ["cookie", "danish", "cupcake", "donut", "pie", "brownie"]
pastries[0]
//pastries[13]

let firstThree = Array(pastries[1...3])
firstThree[0]
pastries.append("eclair")
//pastries.removeAll()
pastries.isEmpty
pastries.count
pastries.first
pastries.last

if let first = pastries.first {
    print(first)
}

pastries.contains("donut")
pastries.contains("lasagna")
pastries.insert("tart", at: 0)

let removedTwo = pastries.remove(at: 2)
let removeLast = pastries.removeLast()
let removeFirst = pastries.removeFirst()
removedTwo
removeLast
pastries[0...1] = ["brownie","fritter","tart"]
pastries

//serve para trocar os valores - fritter e tart ficaram invertidos
pastries.swapAt(1, 2)
//: [⇒ Next: 06 - Challenge - Arrays](@next)
