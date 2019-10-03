import UIKit

class PhanSo {
    var tuSo: Int
    var mauSo: Int?
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        if mauSo == 0 {
            self.mauSo = nil
        } else {
            self.mauSo = mauSo
        }
    }
}
