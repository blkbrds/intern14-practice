import UIKit

protocol Thu {
    var isDi: Bool { set get }
}

protocol Chim {
    var isBay: Bool { set get }
}

protocol Ca {
    var isBoi: Bool { set get }
}

protocol DongVat: Thu, Chim, Ca {
    var ten: String { set get }
}

final class CaChuon: DongVat {
    var ten: String = "Ca Chuon"
    
    var isDi: Bool = false
    
    var isBay: Bool = true
    
    var isBoi: Bool = true
}

final class Bo: DongVat {
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    var isBoi: Bool = false
    
    var ten: String = "Bo"
}

final class Ga: DongVat {
    var ten: String = "Ga"
    
    var isDi: Bool = true
    
    var isBay: Bool = true
    
    var isBoi: Bool = false
}

final class Vit: DongVat {
    var ten: String = "Vit"
    
    var isDi: Bool = true
    
    var isBay: Bool = true
    
    var isBoi: Bool = true
}

final class CaMap: DongVat {
    var ten: String = "Ca Map"
    
    var isDi: Bool = false
    
    var isBay: Bool = false
    
    var isBoi: Bool = true
}

final class Heo: DongVat {
    var ten: String = "Heo"
    
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    var isBoi: Bool = false
}

final class HaiCau: DongVat {
    var ten: String = "Hai Cau"
    
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    var isBoi: Bool = true
}

final class Doi: DongVat {
    var ten: String = "Doi"
    
    var isDi: Bool = false
    
    var isBay: Bool = true
    
    var isBoi: Bool = false
}

final class CaSau: DongVat {
    var ten: String = "Ca Sau"
    
    var isDi: Bool = true
    
    var isBay: Bool = false
    
    var isBoi: Bool = true
}

let arrAnimal: [DongVat] = [Bo(), Vit(), CaChuon(), CaMap(), CaSau(), Heo(), Doi(), Ga(), HaiCau()]
var arrBoi: [DongVat] = []
var arrBay: [DongVat] = []
var arrDi: [DongVat] = []

func getResult() {
    for animal in arrAnimal {
        if animal.isDi {
            arrDi.append(animal)
        }
        if animal.isBay {
            arrBay.append(animal)
        }
        if animal.isBoi {
            arrBoi.append(animal)
        }
    }
}

getResult()

print(arrBoi)
print(arrBay)
print(arrDi)
