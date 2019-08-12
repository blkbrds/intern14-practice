import UIKit

final class Thu {
    var isDi: Bool
    var ten: String
    
    init(isDi: Bool, ten: String) {
        self.isDi = isDi
        self.ten = ten
    }
}

final class Chim {
    var isBay: Bool
    var ten: String
    
    init(isBay: Bool, ten: String) {
        self.isBay = isBay
        self.ten = ten
    }
}

final class Ca {
    var isBoi: Bool
    var ten: String
    
    init(isBoi: Bool, ten: String) {
        self.isBoi = isBoi
        self.ten = ten
    }
}

//MARK: Lop Thu
var bo = Thu(isDi: true, ten: "Bo")
var heo = Thu(isDi: true, ten: "Heo")
var haiCau = Thu(isDi: false, ten: "Hai Cau")
var doi = Thu(isDi: false, ten: "Doi")
var caSau = Thu(isDi: true, ten: "Ca Sau")

