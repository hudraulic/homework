import Foundation

enum Actions {
    
    case engine
    case windows
    case headlights
}

protocol Car: AnyObject {
    
    var brand: String { get }
    var hp: Int { get }
    var wheels: Int { get }
    var engine: Bool { get set }
    var windows: Bool { get set }
    var headlights: Bool { get set }
    
}

extension Car {
    
    func goRace() {
        if self.engine == true && self.headlights == true {
            print("Поехали")
        } else if self.engine == true {
            print("Двигатель заведён, но ехать нельзя. Включите фары")
        } else if headlights == true {
            print("Сначала заведите двигатель, а потом включите фары")
        } else {
            print("Движение невозможно! Заведите двигатель и включите фары")
        }
    }
    
    func windowsСondition() {
        if self.windows == true {
            print("Окна открыты")
        } else {
            print("Окна закрыты")
        }
    }
    
    func engineСondition() {
        if self.engine == true {
            print("Двигатель заведён")
        } else {
            print("Двигатель заглушен")
        }
    }
    func headlightsСondition() {
        if self.headlights == true {
            print("Фары включены")
        } else {
            print("Фары выключены")
        }
    }
    
    func handleAction(action: Actions) {
       switch action {
        case .engine:
            if self.engine == false {
                self.engine = true
            } else {
                self.engine = false
            }
            engineСondition()
        case .windows:
            if self.windows == false {
                self.windows = true
            } else {
                self.windows = false
            }
            windowsСondition()
        case .headlights:
            if self.headlights == false {
                self.headlights = true
            } else {
                self.headlights = false
            }
            headlightsСondition()
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        "Авиомобиль \(brand) мощностью \(hp) л.с и разгоняется от 0 до 100 км/ч за \(timeTo_100) с"
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Авиомобиль \(brand) мощностью \(hp) л.с и объёмом кузова \(volumeBody) литров"
    }
}

class SportCar: Car {
    
    var brand: String
    var hp: Int
    var wheels: Int = 4
    var engine: Bool = false
    var windows: Bool = false
    var headlights: Bool = false
    
    var timeTo_100: Double
    
    init(brand: String, time: Double, hp: Int) {
        self.brand = brand
        self.timeTo_100 = time
        self.hp = hp
    }
}

class TruckCar: Car {
    
    var brand: String
    var hp: Int
    var wheels: Int = 6
    var engine: Bool = false
    var windows: Bool = false
    var headlights: Bool = false
    var volumeBody: Int
    
    init(brand: String ,body: Int, hp: Int) {
        self.brand = brand
        self.volumeBody = body
        self.hp = hp
    }
}

let sc = SportCar.init(brand: "bmw", time: 4.0, hp: 600)
print(sc.description)
sc.engineСondition()
sc.handleAction(action: .engine)
sc.handleAction(action: .headlights)
sc.windowsСondition()
sc.goRace()

print("#####")

let sc1 = SportCar.init(brand: "Mersedes-benz", time: 3.5, hp: 700)
print(sc1.description)
sc1.engineСondition()
sc1.handleAction(action: .engine)
sc1.headlightsСondition()
sc1.windowsСondition()
sc1.goRace()

print("#####")

let tc = TruckCar.init(brand: "Maz", body: 1500, hp: 350)
print(tc.description)
tc.engineСondition()
tc.handleAction(action: .engine)
tc.handleAction(action: .headlights)
tc.windowsСondition()
tc.goRace()

print("#####")

let tc1 = TruckCar.init(brand: "Kamaz" ,body: 1550, hp: 500)
print(tc1.description)
tc1.engineСondition()
tc1.handleAction(action: .engine)
tc1.windowsСondition()
tc1.goRace()
















    




