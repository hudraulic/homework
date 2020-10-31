import Foundation

enum Actions {
    
    case raiseBody, lowBody
    case disel, petrol
    case raiseRoof, lowRoof
}

class Car {
    
    var brand: String
    var power: Int
    var weight: Int
    var engineType: Bool
    
    init(brand: String, power: Int, weight: Int, engineType: Bool) {
        self.brand = brand
        self.power = power
        self.weight = weight
        self.engineType = engineType
    }
    
    func actions(action: Actions) {}
}

class SportCar: Car {
    
    var numberDors: Int
    var roof: Bool
    
    init(brand: String, power: Int, weight: Int, engineType: Bool, roof: Bool, numberDors: Int) {
        self.numberDors = numberDors
        self.roof = roof
        super.init(brand: brand, power: power, weight: weight, engineType: engineType)
    }
    
    override func actions(action: Actions) {
        
        switch action {
        case .raiseRoof:
            self.roof = true
            print("Крыша поднята")
        case .lowRoof:
            self.roof = false
            print("Крыша опущена")
        case .petrol:
            self.engineType = true
            print("Бензиновый двигатель")
        case .disel:
            self.engineType = false
            print("Дизельный двигатель")
        default:
            break
        }
    }
}

class TruckCar: Car {
    
    var volumeBody: Int
    var body: Bool
    
    init(brand: String, power: Int, weight: Int, engineType: Bool, volumeBody: Int, body: Bool) {
        self.volumeBody = volumeBody
        self.body = body
        super.init(brand: brand, power: power, weight: weight, engineType: engineType)
        
    }

    override func actions(action: Actions) {
        switch action {
        case .raiseBody:
            self.body = true
            print("Кузов поднят")
        case .lowBody:
            self.body = false
            print("Кузов опущен")
        case .disel:
            self.engineType = true
            print("Дизельный двигатель")
        case .petrol:
            self.engineType = false
            print("Бензиновый двигатель")
        default:
            break
        }
    }
}

let car1 = TruckCar.init(brand: "Камаз", power: 350, weight: 5000, engineType: true, volumeBody: 1000, body: false)
print("Характеристики автомобиля марки \(car1.brand):\n1. мощьность двигателя \(car1.power) л.с\n2. весит \(car1.weight) кг\n3. имеет вместимость кузова \(car1.volumeBody) кг")
car1.actions(action: .disel)
car1.actions(action: .lowBody)

print("######")

let car2 = SportCar.init(brand: "BMW", power: 600, weight: 1500, engineType: true, roof: false, numberDors: 3)
print("Характеристики автомобиля марки \(car2.brand):\n1. мощьность двигателя \(car2.power) л.с\n2. весит \(car2.weight) кг\n3. имеет\(car2.numberDors) двери")
car2.actions(action: .petrol)
car2.actions(action: .raiseRoof)





