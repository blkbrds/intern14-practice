import UIKit
print("Bài tập 01 : Swift Basic")
//Bai 1 Tính diên tích và thể tích hình cầu
func globular(radius: Double) -> (acreage: Double, volume: Double) {
    return(4 / 3 * Double.pi * pow(radius,3), 4 * Double.pi * pow(radius,2))
}
var result1 = globular(radius: 4)
print("Question 1\n The glubular have the acreage is \(result1.acreage) \n The globular have the volume is \(result1.volume) ")

//Bai 2
func quardaticEquation2(a: Float, b: Float, c: Float) -> (x1: Float, x2: Float) {
    var del: Float = pow(b,2) - (4*a*c)
    if del == 0 {
        return (-b/(2*a), 0)
    } else if del > 0 {
        return ((-b+sqrt(del))/2*a,(-b-sqrt(del))/2*a)
    } else {
        print("No solution")
        return (0,0)
    }
}

var result2 = quardaticEquation2(a: 2, b: 8, c: 4)
print("\nQuestion 2\n X1 = \(result2.x1)\n X2 = \(result2.x2)")
