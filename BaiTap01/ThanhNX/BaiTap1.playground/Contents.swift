import UIKit

// Bai 1:
func acreageAndVolumeGlobular(_ radius: Double) -> (Double, Double) {
    return (4*Double.pi*pow(radius, 2), (4/3)*Double.pi*pow(radius, 3))
}

let display = acreageAndVolumeGlobular(15)
print("Acreage and Volume of Globular Radius = 15")
print("Acreage is: \(display.0) and Volume is: \(display.1)")
