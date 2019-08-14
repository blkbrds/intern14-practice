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

class DongVat: Thu, Ca, Chim {
    var isDi: Bool
    var isBoi: Bool
    var isBay: Bool
    var ten: String
    init(isDi: Bool, isBoi: Bool, isBay: Bool, ten: String) {
        self.isBay = isBay
        self.isBoi = isBoi
        self.isDi = isDi
        self.ten = ten
    }
    func name() -> String {
        return ten
    }
}

let caChuon: DongVat = DongVat(isDi: false, isBoi: true, isBay: true, ten: "Ca Chuon")
let bo: DongVat = DongVat(isDi: true, isBoi: false, isBay: false, ten: "Bo")
let ga: DongVat = DongVat(isDi: true, isBoi: false, isBay: true, ten: "Ga")
let vit: DongVat = DongVat(isDi: true, isBoi: true, isBay: true, ten: "Vit")
let caMap: DongVat = DongVat(isDi: false, isBoi: true, isBay: false, ten: "Ca Map")
let heo: DongVat = DongVat(isDi: true, isBoi: false, isBay: false, ten: "Heo")
let haiCau: DongVat = DongVat(isDi: true, isBoi: true, isBay: false, ten: "Hai Cau")
let doi: DongVat = DongVat(isDi: false, isBoi: false, isBay: true, ten: "Doi")
let caSau: DongVat = DongVat(isDi: true, isBoi: true, isBay: false, ten: "Ca Sau")

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
arrBay.forEach { anm in
    print(anm.name())
}
arrBoi.forEach { anm in
    print(anm.name())
}
arrDi.forEach { anm in
    print(anm.name())
}
arrBayBoi.forEach { anm in
    print(anm.name())
}
arrDiBay.forEach { anm in
    print(anm.name())
}
arrBoiDi.forEach { anm in
    print(anm.name())
}
arrAll.forEach { anm in
    print(anm.name())
}
arrOnlyMove.forEach { anm in
    print(anm.name())
}
