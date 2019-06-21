import UIKit

class Complex {
    var a: Double
    var b: Double
    
    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }
}
let z1 = Complex(a: 3, b: 4)
let z2 = Complex(a: 5, b: 6)

class TinhToan {
    
    
    func congSoPhuc() -> (a: Double,b: Double) {
        return (z1.a + z2.a, z1.b + z2.b)
    }
    
    func truSoPhuc() -> (a: Double, b: Double) {
        return (z1.a - z2.a, z1.b - z2.b)
    }
    
    func nhanSoPhuc() -> Double {
        let c = z1.a * z2.a
        let d = z1.b * z2.b
        let e = z1.a * z2.b
        let f = z2.a * z1.b
        
        return c - d + (e + f)
    }
}
var z = TinhToan()
z.congSoPhuc()
z.truSoPhuc()
z.nhanSoPhuc()

