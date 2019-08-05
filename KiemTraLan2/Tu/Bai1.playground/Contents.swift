import UIKit

class DongVat {
    var ten: String
    var canNang: Double
    var loai: String
    
    init(ten: String, canNang: Double, loai: String) {
        self.ten = ten
        self.canNang = canNang
        self.loai = loai
    }
}

class Ga: DongVat {
    init(tenGa: String, canNangGa: Double, loai: Ga) {
        super.init(ten: tenGa, canNang: canNangGa, loai: "Ga")
    }
}

class De: DongVat {
    init(tenDe: String, canNangDe: Double, loai: De) {
        super.init(ten: tenDe, canNang: canNangDe, loai: "De")
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
    
    func layGaVaDe(soGaLay: Int, soDeLay: Int) -> String {
        if soGaLay >= soGa && soDeLay < soDe {
            return "So chan con lai trong chuong: \(tongSoChan - ((soGa * 2) + (soDeLay * 4)))"
        } else {
            return "So chan con lai trong chuong: \(tongSoChan - ((soGaLay * 2) + (soDe * 4)))"
        }
    }
    
    func themGaVaDe(soGaThem: Int, soDeThem: Int) -> String {
        var tongChanConLai = tongSoChan - ((soGa * 2) + (soDe * 4))
        var soChanGaThem = soGaThem * 2
        var soChanDeThem = soDeThem * 4
        
        if (soChanGaThem + soChanDeThem) <= tongChanConLai {
            return "Da them \(soGaThem) con ga va \(soDeThem) con de vao chuong"
        } else {
            return "Khong the them vao vi vuot qua tong so chan"
        }
    }
    
    func tieuHuyGiaCam(chuong: Chuong?) -> Chuong? {
        guard  let chuong = chuong else {
            return nil
        }
        chuong.soGa = 0
        return chuong
    }
    
    func tieuHuyGiaSuc(chuong: Chuong?) -> Chuong? {
        guard  let chuong = chuong else {
            return nil
        }
        chuong.soDe = 0
        return chuong
    }
    
    func tieuHuyToanBo(chuong: Chuong?) -> Chuong? {
        guard  let chuong = chuong else {
            return nil
        }
        chuong.soGa = 0
        chuong.soDe = 0
        return chuong
    }
}
