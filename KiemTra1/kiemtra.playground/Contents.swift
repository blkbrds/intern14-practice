import UIKit

class SoPhuc {
    private(set) var phanThuc: [Double] = []
    private(set) var phanAo: [Double] = []
    let i : Double = sqrt(-1)
    
    init?(a: Double, b: Double, c: Double, d: Double, i: Double) {
        self.phanThuc = [a ,c]
        self.phanAo = [b, d]
    }
        func cong() -> Double {
            return (phanThuc[0] + phanThuc[1]) + (phanAo[0] + phanAo[1]) * i
        }
    
        func tru() -> Double {
            return (phanThuc[0] + phanThuc[1]) + (phanAo[0] + phanAo[1]) * i
        }
        
        func nhan() -> Double {
            return (phanThuc[0] * phanThuc[1] - phanAo[0] * phanAo[1]) + i * (phanThuc[0] * phanAo[1] + phanAo[0] * phanThuc[1])
        }
        
        func chia() -> Double {
            return ((phanThuc[0] * phanThuc[1]) + (phanAo[0] + phanAo[1]) / (pow(phanThuc[1], 2) + pow(phanAo[1], 2))) + ((phanAo[0] * phanThuc[1] - phanAo[1] * phanThuc[0]) / (pow(phanThuc[1], 2) + pow(phanAo[1], 2)) * i)
        }
}

var a = SoPhuc(a: 1, b: 2, c: 3, d: 4, i: -1)
a?.cong()
a?.tru()
a?.nhan()
a?.chia()
