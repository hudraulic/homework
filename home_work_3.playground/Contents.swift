import Foundation

struct sportCar {
    
    var carBrand: String
    var yearRelease: Int
    let maxVolumeTrunc: Int
    var volumeTrunc: Int
    var windows: actions
    var engineStatus: actions
    
    mutating func loadingCargo (volumeCargo: Int) {
        if (volumeTrunc >= 0) && (volumeTrunc < maxVolumeTrunc) && (volumeCargo < maxVolumeTrunc){
            volumeTrunc += volumeCargo
        } else  {
            print("мало места в багажнике")
        }
    }
    
    mutating func unloadingCargo (volumeCargo: Int) {
        if (volumeTrunc > 0) && (volumeTrunc == maxVolumeTrunc) && (volumeCargo < volumeTrunc){
            volumeTrunc -= volumeCargo
        } else  {
            print("недостаточно груза")
        }
    }
    
    func handleAction(actions: actions) {
        switch actions {
            case .openWindow:
                print("Окна открыты")
            case .closeWindow:
                print("Окна закрыты")
            case .engineOn:
                print("Двигатель запущен")
            case .engineOff:
                print("Двигатель заглушен")
        }
    }
}

struct truckCar {
    
    var carBrand: String
    var yearRelease: Int
    let maxVolumeBody: Int
    var windows: actions
    var engineStatus: actions
    var volumeBody: Int
    
    mutating func loadingCargo (volumeCargo: Int) {
        if (volumeBody >= 0) && (volumeBody < maxVolumeBody) && (volumeCargo < maxVolumeBody){
            volumeBody += volumeCargo
        } else  {
            print("мало места в багажнике")
        }
    }
    
    mutating func unloadingCargo (volumeCargo: Int) {
        if (volumeBody > 0) || (volumeBody == maxVolumeBody) && (volumeCargo < volumeBody){
            volumeBody -= volumeCargo
        } else  {
            print("недостаточно груза")
        }
    }
    
    func handleAction(actions: actions) {
        switch actions {
            case .openWindow:
                print("Окна открыты")
            case .closeWindow:
                print("Окна закрыты")
            case .engineOn:
                print("Двигатель запущен")
            case .engineOff:
                print("Двигатель заглушен")
        }
    }
    
}

enum actions: String {
    case openWindow, closeWindow
    case engineOn, engineOff
}

var honda = sportCar.init(carBrand: "honda", yearRelease: 2010, maxVolumeTrunc: 600, volumeTrunc: 50, windows: .closeWindow, engineStatus: .engineOff)
honda.loadingCargo(volumeCargo: 700)
honda.unloadingCargo(volumeCargo: 100)
honda.windows = .openWindow
honda.engineStatus = .engineOn
print("\(honda.carBrand) \(honda.yearRelease) года выпуска, объём багажника \(honda.maxVolumeTrunc), заполненый объём багажника \(honda.volumeTrunc)\n\(honda.handleAction(actions: .openWindow)), \(honda.handleAction(actions: .engineOn))")

var mazda = sportCar.init(carBrand: "mazda", yearRelease: 2001, maxVolumeTrunc: 300, volumeTrunc: 50, windows: .openWindow, engineStatus: .engineOff)
mazda.loadingCargo(volumeCargo: 300)
mazda.unloadingCargo(volumeCargo: 100)
mazda.windows = .closeWindow
mazda.windows = .engineOn
print("\(mazda.carBrand) \(mazda.yearRelease) года выпуска, объём багажника \(mazda.maxVolumeTrunc), заполненый объём багажника \(mazda.volumeTrunc)\n\(mazda.handleAction(actions: .closeWindow)), \(mazda.handleAction(actions: .engineOn))")

var kamaz = truckCar.init(carBrand: "Камаз", yearRelease: 2000, maxVolumeBody: 15000, windows: .closeWindow, engineStatus: .engineOn, volumeBody: 5000)
kamaz.loadingCargo(volumeCargo: 400)
kamaz.unloadingCargo(volumeCargo: 1000)
kamaz.windows = .openWindow
kamaz.engineStatus = .engineOff
print("\(kamaz.carBrand) \(kamaz.yearRelease) года выпуска, объём багажника \(kamaz.maxVolumeBody), заполненый объём багажника \(kamaz.volumeBody)\n\(kamaz.handleAction(actions: .openWindow)), \(kamaz.handleAction(actions: .engineOff))")

var maz = truckCar.init(carBrand: "МАЗ", yearRelease: 2010, maxVolumeBody: 10000, windows: .closeWindow, engineStatus: .engineOff, volumeBody: 3000)
maz.engineStatus = .engineOn
maz.windows = .openWindow
maz.unloadingCargo(volumeCargo: 2000)
maz.loadingCargo(volumeCargo: 6000)
print("\(maz.carBrand) \(maz.yearRelease) года выпуска, объём багажника \(maz.maxVolumeBody), заполненый объём багажника \(maz.volumeBody)\n\(maz.handleAction(actions: .openWindow)), \(maz.handleAction(actions: .engineOn))")

// кода много, надеюсь не заблудитесь. Уверен что можно лучше
//не могу понять почему в print результат действия функции handleAction стоит в конце строки, но в консоле выводится вначале






