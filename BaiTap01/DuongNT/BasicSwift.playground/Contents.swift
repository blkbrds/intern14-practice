import UIKit

// Bài tập 1:
// use "-" instead of args label in func
func calculateGlobular(_ r: Double) -> (dienTich: Double, theTich: Double) {
    return (4 * Double.pi * pow(r, 2), (4 * Double.pi * pow(r, 3)) / 3)
}
let hinhCau = calculateGlobular(4)
print("""
    Diện tích và thể tích hình cầu có bán kính là 4!
    Diện tích: \(hinhCau.dienTich)
    Thể tích: \(hinhCau.theTich)
    """)

