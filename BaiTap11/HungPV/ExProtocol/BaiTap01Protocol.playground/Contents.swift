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
        self.isDi = isDi
        self.isBoi = isBoi
    }
}

let caChuon: DongVat = DongVat(ten: "CaChuon", isDi: false, isBay: true, isBoi: true)
let bo: DongVat = DongVat(ten: "Bo", isDi: true, isBay: false, isBoi: false)
let ga: DongVat = DongVat(ten: "Ga", isDi: true, isBay: true, isBoi: false)
let vit: DongVat = DongVat(ten: "Vit", isDi: true, isBay: true, isBoi: true)
let caMap: DongVat = DongVat(ten: "CaMap", isDi: false, isBay: false, isBoi: true)
let heo: DongVat = DongVat(ten: "Heo", isDi: true, isBay: false, isBoi: false)
let haiCau: DongVat = DongVat(ten: "HaiCau", isDi: false, isBay: false, isBoi: true)
let doi: DongVat = DongVat(ten: "Doi", isDi: false, isBay: true, isBoi: false)
let caSau: DongVat = DongVat(ten: "Bo", isDi: true, isBay: false, isBoi: true)

func getResult(arr: [DongVat]) {
    let animal_di = arr.filter { $0.isDi }
    let animal_bay = arr.filter { $0.isBay }
    let animal_boi = arr.filter { $0.isBoi }
    let animal_di_bay = arr.filter { $0.isDi && $0.isBay }
    let animal_di_boi = arr.filter { $0.isDi && $0.isBoi }
    let animal_boi_bay = arr.filter { $0.isBoi && $0.isBay }
    let animal_di_boi_bay = arr.filter { $0.isBay && $0.isBoi && $0.isDi }
    
    for item in animal_di {
        print("Dong Vat Biet Di la : \(item.ten)")
    }
    
    for item in animal_bay {
        print("Dong Vat Biet Bay la : \(item.ten)")
    }
    
    for item in animal_boi {
        print("Dong Vat Biet Boi la : \(item.ten)")
    }
    
    for item in animal_di_bay {
        print("Dong Vat Biet Di va Bay la : \(item.ten)")
    }
    
    for item in animal_di_boi {
        print("Dong Vat Biet Di va Boi la : \(item.ten)")
    }
    
    for item in animal_boi_bay {
        print("Dong Vat Biet Boi va Bay la : \(item.ten)")
    }
    
    for item in animal_di_boi_bay {
        print("Dong Vat Biet Di va Boi va Bay la : \(item.ten)")
    }
}

getResult(arr: [caChuon,caMap,caSau,bo,ga,vit,heo,doi])



