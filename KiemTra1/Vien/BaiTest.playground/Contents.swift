import UIKit

var str = "Hello, playground"

class SoPhuc {
    fileprivate var phanThuc = 0
    fileprivate var phanAo = 0
    init(_ phanThuc: Int, _ phanAo: Int) {
        self.phanAo = phanAo
        self.phanThuc =  phanThuc
    }
    func output() {
        print("\(phanThuc) + \(phanAo) * i")
    }
    
    func congSP(_ soPhucA: SoPhuc) -> SoPhuc {
        let soPhucC = SoPhuc(0,0)
        soPhucC.phanThuc = soPhucA.phanThuc + self.phanThuc
        soPhucC.phanAo = soPhucA.phanAo + self.phanAo
        return soPhucC
    }
    
    func truSP(_ soPhucA: SoPhuc) -> SoPhuc {
        let soPhucC = SoPhuc(0,0)
        soPhucC.phanThuc = soPhucA.phanThuc - self.phanThuc
        soPhucC.phanAo = soPhucA.phanAo - self.phanAo
        return soPhucC
    }
    
    func nhanSP(_ soPhucA: SoPhuc) -> SoPhuc {
        let soPhucC = SoPhuc(0,0)
        soPhucC.phanThuc = soPhucA.phanThuc * self.phanThuc - (soPhucA.phanAo * self.phanAo)
        soPhucC.phanAo = soPhucA.phanThuc * self.phanAo + (soPhucA.phanAo * self.phanThuc)
        return soPhucC
    }
}

var x = SoPhuc(1,2)
var y = SoPhuc(2,3)
print("So Phuc co ket qua: \(y.nhanSP(x).output())")

