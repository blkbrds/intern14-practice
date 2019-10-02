import UIKit

let pi = Double.pi

/**
 *  Caculate area of sphere
 *
 *  @param Int r [Radius]
 *
 *  @return area
 */
func areaOfSphere(r: Int) -> (Double) {
    let area = Double( pow(Double(r), 2) * 4) * pi
    return area
}

/**
 *  Caculate volume of sphere
 *
 *  @param Int r [Radius]
 *
 *  @return volume
 */
func volumeOfShere(r:Int) -> (Double) {
    let volume = Double( pow(Double(r), 3) * (4/3) ) * pi
    return volume
}

// Test
print(areaOfSphere(r: 3))
print(volumeOfShere(r: 5))
