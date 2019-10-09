import UIKit

let pi = Double.pi

/**
 *  Caculate area and volume of sphere
 *
 *  @param Int r [Radius]
 *
 *  @return area,volume
 */
func areaAndVolumeOfSphere(r: Int) -> (area: Double, volume: Double) {
    let area = Double( pow(Double(r), 2) * 4) * pi
    let volume = Double( pow(Double(r), 3) * (4/3) ) * pi
    return (area, volume)
}

// Test
print(areaAndVolumeOfSphere(r: 6))
