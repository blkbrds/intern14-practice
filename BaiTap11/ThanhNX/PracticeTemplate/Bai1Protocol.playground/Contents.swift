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

final class DongVat: Thu, Chim, Ca {
    var isDi: Bool
    
    var isBay: Bool
    
    var isBoi: Bool
    
    var ten: String
    
    init(ten: String, isDi: Bool, isBay: Bool, isBoi: Bool) {
        self.ten = ten
        self.isBay = isBay
        self.isBoi = isBoi
        self.isDi = isDi
    }
}

let caChuon: DongVat = DongVat(ten: "Ca Chuon", isDi: false, isBay: true, isBoi: true)
let bo: DongVat = DongVat(ten: "Bo", isDi: true, isBay: false, isBoi: false)
let ga: DongVat = DongVat(ten: "Ga", isDi: true, isBay: true, isBoi: false)
let vit: DongVat = DongVat(ten: "Vit", isDi: true, isBay: true, isBoi: true)
let caMap: DongVat = DongVat(ten: "Ca Map", isDi: false, isBay: false, isBoi: true)
let heo: DongVat = DongVat(ten: "Heo", isDi: true, isBay: false, isBoi: false)
let haiCau: DongVat = DongVat(ten: "Hai Cau", isDi: true, isBay: false, isBoi: true)
let doi: DongVat = DongVat(ten: "Doi", isDi: false, isBay: true, isBoi: false)
let caSau: DongVat = DongVat(ten: "Ca Sau", isDi: true, isBay: false, isBoi: true)

let arrAnimal = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]

var arrDi: [String] = []
var arrBay: [String] = []
var arrBoi: [String] = []

let animal_di = arrAnimal.filter { $0.isDi }
let animal_bay = arrAnimal.filter { $0.isBay }
let animal_boi = arrAnimal.filter { $0.isBoi }

func getResult() {
    for item in animal_di {
        arrDi.append(item.ten)
    }
    
    for item in animal_bay {
        arrBay.append(item.ten)
    }
    
    for item in animal_boi {
        arrBoi.append(item.ten)
    }
}

getResult()

print("Dong Vat Di: \(arrDi)")
print("Dong Vat Bay: \(arrBay)")
print("Dong Vat Boi: \(arrBoi)")
