import UIKit

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let http200Status = (statusCode: 200, description: "ok")
print("The status code is \(http200Status.0)")
print("The status description \(http200Status.description)")
// ------- BAI 1 -------
func areaAndSphericalVolume(r:Double) -> (area: Double, spherical: Double){
    let pi:Double = 3.14
    let areaVolume = round((4 * pi * pow(r, 3) * 100)/3)/100
    let sphericalVolume = round(4 * pi * pow(r, 2) * 100)/100
    return (areaVolume, sphericalVolume)
}

//let  areaAndSpherical = areaAndSphericalVolume(r: 2.2)
//print("area: \(areaAndSpherical.area) and spherical: \(areaAndSpherical.spherical)")

enum quadraticEquation {
    case phuongTrinhVoNghiem
    case phuongTrinhCoNghiemKep(Double)
    case phuongTrinhCoHaiNghiem(Double, Double)
}

func quadraticEquation2(a: Double, b: Double, c: Double) -> quadraticEquation? {
    let denta = pow(b, 2) - (4 * a * c)
    
    if denta < 0 {
        return .phuongTrinhVoNghiem
    } else if denta == 0 {
        let x = -b/(2 * a)
        return .phuongTrinhCoNghiemKep(x)
    } else {
        let x1 = (-b + sqrt(denta))/(2 * a)
        return .phuongTrinhCoHaiNghiem(x1)
    }
}


