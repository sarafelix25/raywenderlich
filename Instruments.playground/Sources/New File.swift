import UIKit

// 1
final public class Music {
    // 2
    public let notes: [String]
    
    public init(notes: [String]) {
        self.notes = notes
    }
    
    public func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

// 3
open class Instrument {
    public let brand: String
    
    public init(brand: String) {
        self.brand = brand
    }
    
    // 4
    open func tune() -> String {
        fatalError("Implement this method for \(brand)")
    }
    
    open func play(_ music: Music) -> String {
        return music.prepared()
    }
    
    // 5
    final public func perform(_ music: Music) {
        print(tune())
        print(play(music))
    }
}

/*
 // 1
 final public significa que será visível por todos os de fora, mas você não pode subclassificá-lo.
 // 2
 Cada propriedade armazenada, inicializador, método deve ser marcado publicse você quiser vê-lo de uma fonte externa.
 // 3
 A classe Instrumentestá marcada openporque a subclasse é permitida.
 // 4
 Os métodos também podem ser marcados openpara permitir a substituição.
 // 5
 Os métodos podem ser marcados finalpara que ninguém possa substituí-los. Esta pode ser uma garantia útil.
 */
