import UIKit

class HinhVe {
    var chieuDai: Double
    var chieuRong: Double
    var pi: Double = Double.pi
    
    init(_ chieuDai: Double, _ chieuRong: Double) {
        self.chieuDai = chieuDai
        self.chieuRong = chieuRong
    }
    func ouput() {
        print("Hinh Ve")
    }
    func chuVi() -> Double {
        return chieuDai
    }
    func dienTich() -> Double {
        return chieuRong
    }
    func theTich() -> Double {
        return 0.0
    }
}

class HaiChieu: HinhVe {
    override func chuVi() -> Double {
        return chieuRong + chieuDai
    }
    override func dienTich() -> Double {
        return chieuRong * chieuDai
    }
    override func ouput() {
        print("Hinh Hai Chieu")
    }
}

class BaChieu: HinhVe {
    override func ouput() {
        print("Hinh Ba Chieu")
    }
}

class Vuong: HaiChieu {
    override func chuVi() -> Double {
        return chieuDai * 4
    }
    override func dienTich() -> Double {
        return chieuDai * chieuRong
    }
}

class Tron: HaiChieu {
    private var banKinh: Double
    
    init(_ dai: Double, _ rong: Double, _ banKinh: Double) {
        self.banKinh = banKinh
        super.init(dai, rong)
    }
    override func chuVi() -> Double {
        return 2 * pi * banKinh
    }
    override func dienTich() -> Double {
        return pi * pow(banKinh, 2)
    }
}

class TamGiac: HaiChieu {
    private var canhC: Double
    
    init(_ canhA: Double, _ canhB: Double, _ canhC: Double ) {
        self.canhC = canhC
        super.init(canhA, canhB)
    }
    override func chuVi() -> Double {
        return (chieuDai + chieuRong + canhC)
    }
    override func dienTich() -> Double {
        return sqrt((chuVi() / 2) * ((chuVi() / 2) - chieuDai) * ((chuVi() / 2) - chieuRong) * ((chuVi() / 2) - canhC))
    }
}

class Cau: BaChieu {
    private var banKinh: Double
    
    init(_ dai: Double, _ rong: Double, _ banKinh: Double) {
        self.banKinh = banKinh
        super.init(dai, rong)
    }
    override func dienTich() -> Double {
        return 4 * pi * pow(banKinh, 2)
    }
    override func theTich() -> Double {
        return 4 / 3 * pi * pow(banKinh, 3)
    }
}
class LapPhuong: BaChieu {
    override func theTich() -> Double {
        return chieuDai * chieuDai * chieuDai
    }
    func dienTichToanPhan() -> Double {
        return 6 * pow(chieuDai, 2)
    }
    func dienTichXungQuanh() -> Double {
        return 4 * pow(chieuDai, 2)
    }
}
