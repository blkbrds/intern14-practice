import Cocoa
func calculationOfAreaAndVolume(r: Double) -> (area: Double, volume: Double) {
    return (4 * Double.pi * pow(r, 2), (4/3) * Double.pi * pow(r, 3))
}
calculationOfAreaAndVolume(r : 6)
