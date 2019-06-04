import Cocoa

func calculation(r: Double) -> (area: Double, volume: Double) {
    return (4 * Double.pi * pow(r, 2), (4/3) * Double.pi * pow(r, 3))
}
calculation(r: 5)
