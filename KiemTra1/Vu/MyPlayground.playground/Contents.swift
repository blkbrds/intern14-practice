import UIKit

class SoPhuc {
    var a1: Double
    var b1: Double
    var a2: Double
    var b2: Double
    var i: Double = sqrt(-1)
    init(a1: Double, b1: Double, a2: Double, b2: Double) {
        self.a1 = a1
        self.b1 = b1
        self.a2 = a2
        self.b2 = b2
        //self.i  = i
//        else {
//            print("Day khong phai la so phuc")
//            return nil
//        }
    }
    func congSoPhuc() {
       // if pow(i, 2) == -1 {
            print((a1 + a2) + (b1 + b2) * i)
       // } else {
//            print("Day khong phai la so phuc")
//        }
    }
    func truSoPhuc() {
        //if pow(i, 2) == -1 {
            print((a1 - a2) + (b1 - b2) * i)
        //} else {
          //  print("Day khong phai la so phuc")
        //}
    }
    func nhanSoPhuc() {
        //if pow(i, 2) == -1 {
            print(((a1 * a2) - (b1 * b2) * i))
        //} else {
          //  print("Day khong phai la so phuc")
        //}

    }
    func chiaSoPhuc() {
        if a1 + (b1 * i) != 0 {
            print((a2 + b2 * i) * (a1 - b1 * i)/(pow(a1, 2) + pow(b1, 2)))
        } else if a2 + (b2 * i) != 0 {
            print((a1 + b1 * i) * (a2 - b2 * i)/(pow(a2, 2) + pow(b2, 2)))
        } else {
            print("Incorrect input")
        }
    }
    
}
let a = SoPhuc(a1: 2.0, b1: 2.0, a2: 1.0, b2: 2.0)
a.congSoPhuc()
