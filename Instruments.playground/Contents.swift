import UIKit

class Music {
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

// 1
class Instrument {
    // 2
    let brand: String
    // 3
    init(brand: String) {
        //4
        self.brand = brand
    }
    func  tune () -> String {
        fatalError ( "Implemente este método para \(brand) " )
    }
    
    func play(_ music: Music) -> String {
        return music.prepared()
    }
    
    func play(_ music: Music, usingPedals: Bool) -> String {
      let preparedNotes = super.play(music)
      if hasPedals && usingPedals {
        return "Play piano notes \(preparedNotes) with pedals."
      }
      else {
        return "Play piano notes \(preparedNotes) without pedals."
      }
    }

    
    func perform(_ music: Music) {
        print(tune())
        print(play(music))
    }
}

// 1
class Piano: Instrument {
    let hasPedals: Bool
    // 2
    static let whiteKeys = 52
    static let blackKeys = 36
    
    // 3
    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        // 4
        super.init(brand: brand)
    }
    
    // 5
    override func tune() -> String {
        return "Piano standard tuning for \(brand)."
    }
    
    override func play(_ music: Music) -> String {
        return play(music, usingPedals: hasPedals)
    }
}

// Instances
// 1
let piano = Piano(brand: "Yamaha", hasPedals: true)
piano.tune()
// 2
let music = Music(notes: ["C", "G", "F"])
piano.play(music, usingPedals: false)
// 3
piano.play(music)
// 4
Piano.whiteKeys
Piano.blackKeys

class Guitar: Instrument {
    let stringGauge: String
    
    init(brand: String, stringGauge: String = "medium") {
        self.stringGauge = stringGauge
        super.init(brand: brand)
    }
}

class AcousticGuitar: Guitar {
    static let numberOfStrings = 6
    static let fretCount = 20
    
    override func tune() -> String {
        return "Tune \(brand) acoustic with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play folk tune on frets \(preparedNotes)."
    }
}

let acousticGuitar = AcousticGuitar(brand: "Roland", stringGauge: "light")
acousticGuitar.tune()
acousticGuitar.play(music)

// 1
class Amplifier {
    // 2
    private var _volume: Int
    // 3
    private(set) var isOn: Bool
    
    init() {
        isOn = false
        _volume = 0
    }
    
    // 4
    func plugIn() {
        isOn = true
    }
    
    func unplug() {
        isOn = false
    }
    
    // 5
    var volume: Int {
        // 6
        get {
            return isOn ? _volume : 0
        }
        // 7
        set {
            _volume = min(max(newValue, 0), 10)
        }
    }
}

// 1
class ElectricGuitar: Guitar {
    // 2
    let amplifier: Amplifier
    
    // 3
    init(brand: String, stringGauge: String = "light", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    // 4
    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volume = 5
        return "Tune \(brand) electric with E A D G B E"
    }
    
    // 5
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volume)."
    }
}

class BassGuitar: Guitar {
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play bass line \(preparedNotes) at volume \(amplifier.volume)."
    }
}

let amplifier = Amplifier()
let electricGuitar = ElectricGuitar(brand: "Gibson", stringGauge: "medium", amplifier: amplifier)
electricGuitar.tune()

let bassGuitar = BassGuitar(brand: "Fender", stringGauge: "heavy", amplifier: amplifier)
bassGuitar.tune()

// Notice that because of class reference semantics, the amplifier is a shared
// resource between these two guitars.

bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

bassGuitar.amplifier.unplug()
bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

bassGuitar.amplifier.plugIn()
bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

class Band {
    let instruments: [Instrument]
    
    init(instruments: [Instrument]) {
        self.instruments = instruments
    }
    
    func perform(_ music: Music) {
        for instrument in instruments {
            instrument.perform(music)
        }
    }
}

let instruments = [piano, acousticGuitar, electricGuitar, bassGuitar]
let band = Band(instruments: instruments)
band.perform(music)


/*
 
 class Instrument
 // 1
 Você cria a Instrument classe base com a palavra- classchave. Esta é a classe raiz da hierarquia de instrumentos. Ele define um projeto que forma a base de qualquer tipo de instrumento. Por ser um tipo, o nome Instrumenté capitalizado. Não precisa ser capitalizado, porém esta é a convenção em Swift.
 // 2
Você declara as propriedades armazenadas do instrumento (dados) que todos os instrumentos possuem. Nesse caso, é apenas a marca, que você representa como um domínio String.
 // 3
 3. Você cria um inicializador para a classe com a palavra- initchave. Seu objetivo é construir novos instrumentos inicializando todas as propriedades armazenadas.
 // 4
Você define a propriedade armazenada do instrumento brandpara o que foi passado como parâmetro. Como a propriedade e o parâmetro têm o mesmo nome, você usa a selfpalavra-chave para distingui-los.
 
 class Piano
 // 1
 Você cria a Pianoclasse como uma subclasse da Instrument classe pai . Todas as propriedades e métodos armazenados são herdados automaticamente pela Piano classe filha e ficam disponíveis para uso.
 // 2
 Todos os pianos têm exatamente o mesmo número de teclas brancas e pretas, independentemente da marca. Os valores associados de suas propriedades correspondentes não mudam dinamicamente, então você marca as propriedades como staticpara refletir isso.
 // 3
 O inicializador fornece um valor padrão para seu hasPedalsparâmetro, que permite que você o deixe desativado, se desejar.
 // 4
 Você usa a superpalavra-chave para chamar o inicializador da classe pai depois de definir a propriedade armazenada da classe filha hasPedals. O inicializador de superclasse cuida de inicializar propriedades herdadas — neste caso, brand.
 // 5
 Você substituitune() a implementação do método herdado pela palavra- overridechave. Isso fornece uma implementação tune()que não chama fatalError(), mas faz algo específico para Piano.
 // 6
 Você substitui o método herdado play(_:). E dentro desse método, você usa a superpalavra-chave desta vez para chamar o Instrumentmétodo pai para obter as notas preparadas da música e depois tocar no piano.
 let preparedNotes = super.play(music)
 return "Piano playing \(preparedNotes)"
 
 Instances
 // 1
 Você cria um piano como uma instância da Piano classe e tune ele. Observe que enquanto os tipos (classes) são sempre em maiúsculas, as instâncias são sempre todas em minúsculas. Novamente, isso é convenção.
 // 2
 Você declara uma musicinstância da Music classe any play no piano com sua sobrecarga especial que permite tocar a música sem usar os pedais.
 // 3
 Você chama a Pianoversão de classe play(_:)que sempre usa os pedais se puder.
 // 4
 As contagens de chaves são staticvalores constantes dentro da Pianoclasse, portanto, você não precisa de uma instância específica para chamá-los — basta usar o prefixo do nome da classe.
 
 class Amplifier
 // 1
 Você define a Amplifierclasse. Esta também é uma classe raiz, assim como Instrument.
 // 2
 A propriedade armazenada _volumeé marcada privatepara que possa ser acessada apenas dentro da Amplifierclasse e está oculta para usuários externos. O sublinhado no início do nome enfatiza que é um detalhe de implementação privado. Mais uma vez, isso é apenas uma convenção. Mas é bom seguir as convenções. :]
 // 3
 A propriedade armazenada isOnpode ser lida por usuários externos, mas não gravada. Isso é feito com private(set).
 // 4
 plugIn()e unplug()afetar o estado de isOn.
 // 5
 A propriedade computada denominada volumeencapsula a propriedade privada armazenada _volume.
 // 6
 O getter reduz o volume para 0 se não estiver conectado.
 // 7
 O volume sempre será fixado em um determinado valor entre 0 e 10 dentro do setter . Não ajuste o amplificador para 11.
 
 class ElectricGuitar
 // 1
 ElectricGuitar é um tipo concreto que deriva da classe base abstrata e intermediária Guitar.
 // 2
 Uma guitarra elétrica contém um amplificador. Este é um relacionamento tem-um e não um relacionamento é-um como acontece com a herança.
 // 3
 Um inicializador personalizado que inicializa todas as propriedades armazenadas e, em seguida, chama a superclasse.
 // 4
 Um método razoável tune().
 // 5
 Um método razoável play().
 
 */
