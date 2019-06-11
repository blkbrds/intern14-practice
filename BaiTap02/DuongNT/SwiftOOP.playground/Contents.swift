import UIKit

class PhanSo {
    private var tuSo: Int
    private var mauSo: Int?
    
    init(tuSo: Int, mauSo: Int?) {
        self.tuSo = tuSo
        if mauSo == 0 {
            self.mauSo = nil
        } else {
            self.mauSo = mauSo
        }
    }

    func output() -> String {
        if let mauSo = self.mauSo {
            return "Result: \(self.tuSo) / \(mauSo)"
        }
        return "Not Exist"
    }
    
    func ucln(_ num1: Int, _ num2: Int) -> Int {
        var a = abs(num1)
        var b = abs(num2)
        
        if (a == 0 || b == 0) {
            return a + b
        }
        while (a != b) {
            if (a > b) {
                a -= b
            } else {
                b -= a
            }
        }
        return a
    }
    
    func rutGon() -> PhanSo? {
        guard let mauSo = self.mauSo else { return nil }
        let result = PhanSo(tuSo: self.tuSo / self.ucln(self.tuSo , mauSo), mauSo: mauSo / self.ucln(self.tuSo , mauSo))
        return result
    }

    func cong(phanSo: PhanSo) -> PhanSo? {
        guard let mauSo1 = phanSo.mauSo, let mauSo2 = self.mauSo else { return nil }
        let result = PhanSo(tuSo: self.tuSo * mauSo1 + mauSo2 * phanSo.tuSo, mauSo: mauSo2 * mauSo1)
        return result
    }

    static func +(phanSo1: PhanSo, phanSo2: PhanSo) -> PhanSo {
        if let mauSo1 = phanSo1.mauSo, let mauSo2 = phanSo2.mauSo {
            return PhanSo(tuSo: phanSo1.tuSo * mauSo2 + mauSo1 * phanSo2.tuSo, mauSo: mauSo1 * mauSo2)
        }
        return PhanSo(tuSo: 0, mauSo: 0)
    }

    func tru(phanSo: PhanSo) -> PhanSo? {
        guard let mauSo1 = phanSo.mauSo, let mauSo2 = self.mauSo else { return nil }
        let result = PhanSo(tuSo: self.tuSo * mauSo1 - mauSo2 * phanSo.tuSo, mauSo: mauSo2 * mauSo1)
        return result
    }

    static func -(phanSo1: PhanSo, phanSo2: PhanSo) -> PhanSo {
        if let mauSo1 = phanSo1.mauSo, let mauSo2 = phanSo2.mauSo {
            return PhanSo(tuSo: phanSo1.tuSo * mauSo2 - mauSo1 * phanSo2.tuSo, mauSo: mauSo1 * mauSo2)
        }
        return PhanSo(tuSo: 0, mauSo: 0)
    }

    func nhan(phanSo: PhanSo) -> PhanSo? {
        guard let mauSo1 = phanSo.mauSo, let mauSo2 = self.mauSo else { return nil }
        let result = PhanSo(tuSo: self.tuSo * phanSo.tuSo, mauSo: mauSo2 * mauSo1)
        return result
    }

    static func *(phanSo1: PhanSo, phanSo2: PhanSo) -> PhanSo {
        if let mauSo1 = phanSo1.mauSo, let mauSo2 = phanSo2.mauSo {
            return PhanSo(tuSo: phanSo1.tuSo * phanSo2.tuSo, mauSo: mauSo1 * mauSo2)
        }
        return PhanSo(tuSo: 0, mauSo: 0)
    }

    func chia(phanSo: PhanSo) -> PhanSo? {
        guard let mauSo1 = phanSo.mauSo, let mauSo2 = self.mauSo else { return nil }
        if phanSo.tuSo == 0 {
            return PhanSo(tuSo: 0 , mauSo:0)
        }
        let result = PhanSo(tuSo: self.tuSo * mauSo1, mauSo: mauSo2 * phanSo.tuSo)
        return result
    }

    static func /(phanSo1: PhanSo, phanSo2: PhanSo) -> PhanSo {
        if phanSo2.tuSo == 0 {
            return PhanSo(tuSo: 0, mauSo: 0)
        }
        if let mauSo1 = phanSo1.mauSo, let mauSo2 = phanSo2.mauSo {
            return PhanSo(tuSo: phanSo1.tuSo * mauSo2 , mauSo: mauSo1 * phanSo2.tuSo)
        }
        return PhanSo(tuSo: 0, mauSo: 0)
    }
}
let ps1 = PhanSo(tuSo: 9, mauSo: 9)
var ps2 = PhanSo(tuSo: 1, mauSo: 4)


if let ps3 = (ps1 * ps2 - ps1).rutGon() {
    print(ps3.output())
} else {
    print("Not exist")
}

if let ps3 = ps1.cong(phanSo: ps2)?.rutGon() {
    print(ps3.output())
} else {
    print("Not exist")
}
if let ps3 = ps1.tru(phanSo: ps2)?.rutGon() {
    print(ps3.output())
} else {
    print("Not exist")
}
if let ps3 = ps1.nhan(phanSo: ps2)?.rutGon() {
    print(ps3.output())
} else {
    print("Not exist")
}
if let ps3 = ps1.chia(phanSo: ps2)?.rutGon() {
    print(ps3.output())
} else {
    print("Not exist")
}

