import UIKit

class DongVat {
    var tenDV: String
    var loai: String
    var canNang: Float
    
    init(tenDV: String, canNang: Float, loai: String) {
        self.tenDV = tenDV
        self.canNang = canNang
        self.loai = loai
    }
}

class Ga: DongVat {
    init(maSoGa: String, canNang: Float, loai: Ga) {
        super.init(tenDV: maSoGa, canNang: canNang, loai: "Ga")
    }
}

class De: DongVat {
    init(tenDe: String, canNangDe: Float, loai: De) {
        super.init(tenDV: tenDe, canNang: canNangDe, loai: "De")
    }
}

class Chuong {
    var tongSoChan: Int
    var soGa: Int
    var soDe: Int
    
    init(tongSoChan: Int, soGa: Int, soDe: Int) {
        self.tongSoChan = tongSoChan
        self.soGa = soGa
        self.soDe = soDe
    }
    
    func soChanConLai() -> Int {
        return tongSoChan - ((soGa * 2) + (soDe * 4))
    }
}
