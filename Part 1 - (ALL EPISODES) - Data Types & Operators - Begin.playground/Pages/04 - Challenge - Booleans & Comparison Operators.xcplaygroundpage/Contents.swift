//: [⇐ Previous: 03 - Booleans & Comparison Operators](@previous)
//: ## Episode 04: Challenge - Booleans & Comparison Operators

import Darwin

/*:
 ## Challenge 1
 
 Create a constant named `myAge` and set its value to your age.

 Then, create a constant named `isVotingAge` that uses Boolean logic to determine if the value stored in `myAge` denotes someone of voting age. In my part of the world, the voting age is 18, so I'll use that here.
*/

// TODO: Write solution here

let myAge: Int = 21

let isVotingAge: Int = 18

let isVotingOkAge = myAge >= isVotingAge

/* SOLUTION
 
let isVotingAge = myAge >= 18
 
*/
/*:
 ## Challenge 2
 
 Create a constant named `student` and set its value to your name as a string.
 
 Next, create a constant named `author` and set its value to `"Matt Galloway"`, the original author of these exercises.
 
 Then, create a third constant named `authorIsStudent` that uses string equality to determine if the values of `student` and `author` are equal.
 */

// TODO: Write solution here

let student: String = "Sara Felix"

let author: String = "Matt Galloway"

let authorIsStudent = student == author
/*:
 ## Challenge 3
 
 Create a constant named `studentBeforeAuthor` which uses string comparison to determine if the string value in the constant `student` comes, alphabetically speaking, before the string value in the constant `author`.
 
 The constants `student` and an `author` were declared above in Challenge 2, so you do not need to redeclare them here.
 */

// TODO: Write solution here

//let studentBeforeAuthor = student < author
let studentBeforeAuthor = author > student
//: [⇒ Next: 05 - Logical Operators](@next)
