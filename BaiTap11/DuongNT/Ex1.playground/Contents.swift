import UIKit

protocol Thu {
    var isDi : Bool {get set}
}

protocol Chim {
    var isBay : Bool {get set}
}

protocol Ca {
    var isBoi : Bool {get set}
}

protocol DongVat: Thu, Ca, Chim {
    func ten() -> String
}
class CaChuon: DongVat {
    var isDi: Bool = false
    var isBay: Bool = true
    var isBoi: Bool = true
    func ten() -> String {
        return "Ca Chuon"
    }
}

class Bo: DongVat {
    var isBoi: Bool = false
    var isBay: Bool = false
    var isDi: Bool = true
    func ten() -> String {
        return "Bo"
    }
}

class Ga: DongVat {
    var isDi: Bool = false
    var isBoi: Bool = false
    var isBay: Bool = true
    func ten() -> String {
        return "Ga"
    }
}

class Vit: DongVat {
    var isDi: Bool = true
    var isBay: Bool = true
    var isBoi: Bool = true
    func ten() -> String {
        return "Vit"
    }
}

class CaMap: DongVat {
    var isDi: Bool = false
    var isBay: Bool = false
    var isBoi: Bool = true
    func ten() -> String {
        return "Ca Map"
    }
}

class Heo: DongVat {
    var isBoi: Bool = false
    var isBay: Bool = false
    var isDi: Bool = true
    func ten() -> String {
        return "Heo"
    }
}

class HaiCau: DongVat {
    var isBay: Bool = false
    var isDi: Bool = true
    var isBoi: Bool = true
    func ten() -> String {
        return "Hai Cau"
    }
}

class Doi: DongVat {
    var isBoi: Bool = false
    var isBay: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Doi"
    }
}

class CaSau: DongVat {
    var isBay: Bool = false
    var isBoi: Bool = true
    var isDi: Bool = true
    func ten() -> String {
        return "Ca Sau"
    }
}

let caChuon: CaChuon = CaChuon()
let bo: Bo = Bo()
let ga: Ga = Ga()
let vit: Vit = Vit()
let caMap: CaMap = CaMap()
let heo: Heo = Heo()
let haiCau: HaiCau = HaiCau()
let doi: Doi = Doi()
let caSau: CaSau = CaSau()

var arrObjects: [DongVat] = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]

var arrBay: [DongVat] = []
var arrBoi: [DongVat] = []
var arrDi: [DongVat] = []
var arrBayBoi: [DongVat] = []
var arrDiBay: [DongVat] = []
var arrBoiDi: [DongVat] = []
var arrAll: [DongVat] = []
var arrOnlyMove: [DongVat] = []

arrObjects.forEach { animal in
    if animal.isBay {
        arrBay.append(animal)
    }
    if animal.isBoi {
        arrBoi.append(animal)
    }
    if animal.isDi {
        arrDi.append(animal)
    }
    if animal.isBay && animal.isBoi {
        arrBayBoi.append(animal)
    }
    if animal.isDi && animal.isBoi {
        arrBoiDi.append(animal)
    }
    if animal.isDi && animal.isBay {
        arrDiBay.append(animal)
    }
    if animal.isDi && animal.isBay && animal.isBoi {
        arrAll.append(animal)
    }
    if (!animal.isBay && !animal.isBoi) || (!animal.isDi && !animal.isBoi) || (!animal.isBay && !animal.isDi) {
        arrOnlyMove.append(animal)
    }
}
