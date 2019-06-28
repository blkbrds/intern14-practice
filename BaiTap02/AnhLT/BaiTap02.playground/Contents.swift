import UIKit
enum EquationType{
    case firstOrderEq(Double)
    case noResult
    case eqHasOneResult(Double)
    case eqHasTwoResult(Double, Double)
}
func quadraticEq(a: Double, b: Double, c: Double) -> EquationType
{
    if a == 0
    {
    return .firstOrderEq(-c / b)
    }
    else{
        let delta = pow(b, 2) - 4 * a * c
    
        if delta > 0 {
        return .eqHasTwoResult ((-b + sqrt(delta)) / 2 * a, (-b - sqrt(delta)) / 2 * a)
    }
        else if delta < 0 {
        return .noResult
    }
        else {
            return .eqHasOneResult(-b / 2 * a)
        }
    }
}
        switch quadraticEq(a: 0, b: 2, c: 2) {
        case .firstOrderEq(let x):
print ("This equation has one value that is \(x)")
        case .noResult:
print ("This equation has no result")
        case .eqHasOneResult(let x1):
print ("This equation has one result that is \(x1)")
        case.eqHasTwoResult(let x1, let x2):
print ("This equation has two value that is \(x1) and\(x2)")
}



