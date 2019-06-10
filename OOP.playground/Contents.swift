import UIKit

//Baitap 1
//class PhanSo {
//    private(set) var tuSo: Double
//    private(set) var mauSo: Double
//
//    init?(_ tuSo: Double, _ mauSo: Double) {
//        self.tuSo = tuSo
//        if mauSo == 0 {
//            print("Khong thuc hien duoc phep tinh")
//            return nil
//        }
//        self.mauSo = mauSo
//    }
//
//    func phanSo() -> Double {
//        return (tuSo / mauSo)
//    }
//
//    func cong(_ b: PhanSo?) -> Double? {
//        guard let b = b else { return nil }
//        return ((tuSo * b.mauSo + b.tuSo * mauSo) / (mauSo * b.mauSo))
//    }
//
//    func tru(_ b: PhanSo?) -> Double? {
//        guard let b = b else { return nil }
//        return ((tuSo * b.mauSo - b.tuSo * mauSo) / (mauSo * b.mauSo))
//    }
//
//    func nhan(_ b: PhanSo?) -> Double? {
//        guard let b = b else { return nil }
//        return ((tuSo * b.tuSo) / (mauSo * b.mauSo))
//    }
//
//    func chia(_ b: PhanSo?) -> Double? {
//        guard let b = b else { return nil }
//        return ((tuSo * b.mauSo) / (mauSo * b.tuSo))
//    }
//
//    func printFrac() -> String {
//        return "Phan so: \(tuSo) / \(mauSo)"
//    }
//}
//
//var a = PhanSo(1, 2)
//var b = PhanSo(2, 3)
//var c = a?.chia(b)
//print()
//a?.tru(b)
//a?.nhan(b)
//a?.chia(b)

//Baitap 2
class DaGiac {
    private var soCanh: Int?
    private var kichThuocCacCanh: [Int]
    
    init?(_ soCanh: Int, _ kichThuocCacCanh: [Int]) {
        self.kichThuocCacCanh = kichThuocCacCanh
        if soCanh <= 2 {
            print("Da giac phai co so canh lon hon 2")
            return nil
        }
        self.soCanh = soCanh
    }
    
    func chuVi() -> Int {
        var tong = 0
        if soCanh != kichThuocCacCanh.count {
            print("nhap sai so canh")
        } else {
            for i in kichThuocCacCanh {
                tong += i
            }
            print("Cac canh cua da giac la: \(kichThuocCacCanh) va Chu vi cua da giac la: \(tong)")
        }
        return tong
    }
}
var a = [1, 20, 3, 12]
var b = DaGiac(4, a)
b?.chuVi()
