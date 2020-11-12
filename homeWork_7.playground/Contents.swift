import Foundation

enum Errors {
    
    case notRace
    case notEnoughFuel
    case fullFuel
}

struct Error_Car: Error {
    
    var errorType: Errors
    var discription: String
    
}

class Car {
    
    var engine: Bool
    var headlights: Bool
    var maxFuel: Int = 85
    var fuel: Int = 0
    
    init(engine: Bool, headlights: Bool) {
        self.engine = engine
        self.headlights = headlights
    }
    
    func fuelUp(liters: Int) throws -> Int {
        guard (self.fuel == 0) || (self.fuel < (self.maxFuel + 1)) else {
            throw Error_Car(errorType: Errors.fullFuel, discription: "Слишком много, \(liters - self.maxFuel) литров лишние")
        }
        self.fuel += liters
        return fuel
    }
    
    func engineOn() throws -> Bool {
        guard self.fuel > 0 || self.fuel <= self.maxFuel else {
            throw Error_Car(errorType: Errors.notEnoughFuel, discription: "Cначала заправьте и заводите")
        }
        self.engine = true
        return engine
    }
    
    func goRace() throws {
        guard (self.fuel > 0) || (self.fuel <= (self.maxFuel + 1)) else {
            throw Error_Car(errorType: Errors.notEnoughFuel, discription: "Недостаточно топлива! сначала заправьте")
        }
        guard self.engine == true && self.fuel > 0 else {
            throw Error_Car(errorType: Errors.notRace, discription: "Движение невозможно! Двигатель заглушен")
        }
    }
    
}
var fuelLiters = 85
var car = Car(engine: false, headlights: false)

do {
    _ = try car.fuelUp(liters: fuelLiters)
    _ = try car.engineOn()
    _ = try car.goRace()
    print("Поехали!")
} catch {
    let error = error as! Error_Car
    print(error)
}

car.engine
try car.fuelUp(liters: fuelLiters)
try car.engineOn()
try car.goRace()





    




