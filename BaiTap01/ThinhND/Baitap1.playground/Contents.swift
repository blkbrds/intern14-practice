import Cocoa
func Calculation(R: Double) -> (area: Double, volume: Double){
    return(4 * Double.pi * pow(R, 2), (4/3) * Double.pi * pow(R,3))
}
Calculation(R: 2)



