import UIKit

// Bai 1:
func acreageAndVolumeGlobular(_ radius: Double) -> (Double, Double) {
    return (4 * Double.pi * pow(radius, 2), (4 / 3) * Double.pi * pow(radius, 3))
}

let display = acreageAndVolumeGlobular(15)
print("Acreage and Volume of Globular Radius = 15")
print("Acreage is: \(display.0) and Volume is: \(display.1)")

//Bai 2: ax2 + bx + c = 0
enum dapAn {
    case VoNghiem
    case CoMotNghiem (Float)
    case Co2Nghiem (Float, Float)
}

func ptBac2(_ a: Float,_ b: Float, _ c: Float) -> dapAn {
    let delta: Float = powf(b, 2) - 4 * a * c
    if a == 0 {
        if b == 0 {
            return .VoNghiem
        }else{
            return .CoMotNghiem(-c / b)
        }
    }else{
        if delta < 0 {
            return .VoNghiem
        } else if delta == 0 {
            return .CoMotNghiem(-b / (2 * a))
        }else{
            return .Co2Nghiem (((-b + sqrtf(delta)) / (2 * a)) , ((-b - sqrtf(delta)) / (2 * a)))
        }
    }
}

print("Nghiệm phương trình bậc 2")
print(ptBac2(3, 8, 5))

//Bai 3: a1x + b1y = c1
//       a2x + b2y = c2


