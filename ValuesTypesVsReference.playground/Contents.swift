import UIKit

// Reference Types:

class Dog {
    var wasFed = false
}

let dog = Dog
let puppy = dog

dog.wasFed = true
puppy.wasFed = true
// Value Types:

var a = 42
var b = a
b += 1

a    // 42
b    // 43

struct Cat {
    var wasFed = false
}

var cat = Cat()
var kitty = cat
kitty.wasFed = true

cat.wasFed        // false
kitty.wasFed      // true

// when to use a value type

struct Point: CustomStringConvertible {
  var x: Float
  var y: Float

  var description: String {
    return "{x: \(x), y: \(y)}"
  }
}

let point1 = Point(x: 2, y: 3)
let point2 = Point(x: 2, y: 3)


extension Point: Equatable { }
func ==(lhs: Point, rhs: Point) -> Bool {
  return lhs.x == rhs.x && lhs.y == rhs.y
}

struct Shape {
  var center: Point
}

let initialPoint = Point(x: 0, y: 0)
let circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)

struct Shape {
  var center: Point
}

let initialPoint = Point(x: 0, y: 0)
let circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)


// when to use a reference type
class Account {
  var balance = 0.0
}

class Person {
  let account: Account

  init(_ account: Account) {
    self.account = account
  }
}

let account = Account()

let person1 = Person(account)
let person2 = Person(account)

person2.account.balance += 100.0

person1.account.balance    // 100
person2.account.balance    // 100


// reference types containing value type properties and mixing
struct Address {
  var streetAddress: String
  var city: String
  var state: String
  var postalCode: String
}

class Person {          // Reference type
  var name: String      // Value type
  var address: Address  // Value type

  init(name: String, address: Address) {
    self.name = name
    self.address = address
  }
}

// 1
let kingsLanding = Address(
  streetAddress: "1 King Way",
  city: "Kings Landing",
  state: "Westeros",
  postalCode: "12345")
let madKing = Person(name: "Aerys", address: kingsLanding)
let kingSlayer = Person(name: "Jaime", address: kingsLanding)

// 2
kingSlayer.address.streetAddress = "1 King Way Apt. 1"

// 3
madKing.address.streetAddress  // 1 King Way
kingSlayer.address.streetAddress // 1 King Way Apt. 1


/*
 // 1
 Primeiro, você criou dois novos Personobjetos da mesma Addressinstância.
 // 2
 Em seguida, você alterou o endereço de uma pessoa.
 // 3
 Por último, você verificou que os dois endereços são diferentes. Mesmo que cada objeto tenha sido criado usando o mesmo endereço, alterar um não afeta o outro.
 */

// value type properties containing reference types
//struct Bill {
//  let amount: Float
//  let billedTo: Person
//}

/*
 example
 extension Bill: Equatable { }
 func ==(lhs: Bill, rhs: Bill) -> Bool {
   return lhs.amount == rhs.amount && lhs.billedTo === rhs.billedTo
 }

 */

// 1
//let billPayer = Person(name: "Robert", address: kingsLanding)
//
//// 2
//let bill = Bill(amount: 42.99, billedTo: billPayer)
//let bill2 = bill
//
//// 3
//billPayer.name = "Bob"
//
//// Inspect values
//bill.billedTo.name    // "Bob"
//bill2.billedTo.name   // "Bob"

/*
 // 1
 Primeiro, você criou um novo Personcom base em um Addresse nome.
 // 2
 Em seguida, você instancia um novo Billusando o inicializador padrão e cria uma cópia atribuindo-o a uma nova constante.
 // 3
 Finalmente, você modificou o Personobjeto passado, que por sua vez afetou as instâncias supostamente únicas.
 */

//init(amount: Float, billedTo: Person) {
//  self.amount = amount
//  // Create a new Person reference from the parameter
//  self.billedTo = Person(name: billedTo.name, address: billedTo.address)
//}

//struct Bill {
//  let amount: Float
//  private var _billedTo: Person // 1
//
//  // 2
//  var billedToForRead: Person {
//    return _billedTo
//  }
//  // 3
//  var billedToForWrite: Person {
//    mutating get {
//      _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
//      return _billedTo
//    }
//  }
//
//  init(amount: Float, billedTo: Person) {
//    self.amount = amount
//    _billedTo = Person(name: billedTo.name, address: billedTo.address)
//  }
//}

/*
 // 1
 Você criou uma variável privada _billedTo para manter uma referência ao Person objeto.
 // 2
 Em seguida, você criou uma propriedade computada billedToForRead para retornar a variável privada para operações de leitura.
 // 3
 Por fim, você criou uma propriedade computada billedToForWrite que sempre fará uma cópia nova e exclusiva Person para operações de gravação . Observe que essa propriedade também deve ser declarada como mutante, pois altera o valor subjacente da estrutura.
 */

struct Bill {
    let amount: Float
    private var _billedTo: Person
    var myBill = Bill(amount: 99.99, billedTo: billPayer)
    var billCopy = myBill

  // 1
  private var billedToForRead: Person {
    return _billedTo
  }

//  private var billedToForWrite: Person {
//    mutating get {
//      _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
//      return _billedTo
//    }
//  }
    
//    private var billedToForWrite: Person {
//      mutating get {
//        if !isKnownUniquelyReferenced(&_billedTo) {
//          _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
//        }
//        return _billedTo
//      }
//    }

    private var billedToForWrite: Person {
      mutating get {
        if !isKnownUniquelyReferenced(&_billedTo) {
          print("Making a copy of _billedTo")
          _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
        } else {
          print("Not making a copy of _billedTo")
        }
        return _billedTo
      }
    }


  init(amount: Float, billedTo: Person) {
    self.amount = amount
    _billedTo = Person(name: billedTo.name, address: billedTo.address)
  }

  // 2
  mutating func updateBilledToAddress(address: Address) {
    billedToForWrite.address = address
  }

  mutating func updateBilledToName(name: String) {
    billedToForWrite.name = name
  }

  // ... Methods to read billedToForRead data
}

/*
 // 1
 Você fez ambas as propriedades computadas privatepara que os chamadores não possam acessar as propriedades diretamente.
// 2
 Você adicionou updateBilledToAddresse updateBilledToNamealterou a Personreferência com um novo endereço ou nome. Essa abordagem impossibilita que outra pessoa atualize incorretamente billedTo, pois você está ocultando a propriedade subjacente.
 */

myBill.updateBilledToName(name: "Eric") // Not making a copy of _billedTo
