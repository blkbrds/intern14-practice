import UIKit
enum Equations{
    case equationsHasInfiniteResult
    case equationsHasOneResult(Double, Double)
    case noResult
}
func Calculation(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) -> Equations{
    let D = a1 * b2 - a2 * b1
    let Dx = c1 * b2 - c2 * b1
    let Dy = a1 * c2 - a2 * c1
    if (D == 0 && c1 == c2 && c1 == 0) {
        
        return .equationsHasInfiniteResult
        }
    else if (c1 != c2) {
            return .noResult
        }
    else {
        return .equationsHasOneResult(Dx / D, Dy / D)
                  }
    
}
switch Calculation(a1: 1, b1: 3, c1: 2, a2: 4, b2: 12, c2: 2){
case.noResult:
    print("This equations has no result")
case.equationsHasInfiniteResult:
    print("This equations has infinite result")
case.equationsHasOneResult(let x, let y):
        print("This equations has result that is x = \(x) and y = \(y)" )
}

