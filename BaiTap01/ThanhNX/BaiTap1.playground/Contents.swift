import UIKit

// Bai 1:
func acreageAndVolumeGlobular(_ radius: Double) -> (Double, Double) {
    return (4*Double.pi*pow(radius, 2), (4/3)*Double.pi*pow(radius, 3))
}

let display = acreageAndVolumeGlobular(15)
print("Acreage and Volume of Globular Radius = 15")
print("Acreage is: \(display.0) and Volume is: \(display.1)")

//Bai 2:
func ptBac2(_ a: Float,_ b: Float, _ c: Float) -> (Float, Float){
    let delta: Float = powf(b, 2) - 4*a*c
    if delta < 0 {
        return (0, 0)
    } else if delta == 0 {
        return (0 , -b / (2*a))
    }else{
        return ((-b + sqrtf(delta) / 2*a),((-b - sqrtf(delta) / 2*a)))
    }
}

let bai2 = ptBac2(3, 2, -9)

print("Nghiệm phương trình bậc 2")
