import UIKit

class Complex {
    private var phanThuc: Double
    private var phanAo: Double
    
    init(_ phanThuc: Double, _ phanAo: Double) {
        self.phanThuc = phanThuc
        self.phanAo = phanAo
    }
    
    func cong(_ b: Complex?) -> String? {
        guard let b = b else { return nil }
        return "\(phanThuc + b.phanThuc) + \(phanAo + b.phanAo)i)"
    }
    
    func tru(_ b: Complex?) -> String? {
        guard let b = b else { return nil }
        return "\(phanThuc - b.phanThuc) + \(phanAo - b.phanAo)i)"
    }
    
    func nhan(_ b: Complex?) -> String? {
        guard let b = b else { return nil }
        return "\(phanThuc * b.phanThuc - phanAo * b.phanAo) + \(phanThuc * b.phanAo + phanAo * b.phanThuc)i"
    }
    
    func chia(_ b: Complex?) -> String? {
        guard let b = b else { return nil }
        var c = ((phanThuc * b.phanThuc) + (phanAo * b.phanAo)) / (pow(b.phanThuc, 2) + pow(b.phanAo, 2))
        var d = ((phanAo * b.phanThuc - phanThuc * b.phanAo)) / (pow(b.phanThuc, 2) + pow(b.phanAo, 2))
        return "\(c) + \(d)i"
    }
    
    func printComplex() {
        if phanAo < 0 {
            print("\(phanThuc) - \(-phanAo)i")
        } else {
            print("\(phanThuc) + \(phanAo)i")
        }
    }
}
let a = Complex(3, -2)
let b = Complex(2, 1)
a.cong(b)
a.tru(b)
a.nhan(b)
a.chia(b)
a.printComplex()
