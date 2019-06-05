import UIKit

enum Equation {
    case firstOrderEq
    case noSolution
    case oneSolution(Double)
    case twoSolutions(Double, Double)
}

func secondOrderEq(a: Double, b: Double, c: Double) -> Equation {
    if a==0 {
        return .firstOrderEq }
    else {
        let delta = pow(b, 2) - 4 * a * c
        if delta < 0 {
            return .noSolution }
        else if delta == 0 {
            return .oneSolution(-b/2*a) }
        else {
            return .twoSolutions((-b + sqrt(delta))/(2*a), (-b - sqrt(delta))/(2*a)) }
    }
}

switch secondOrderEq(a: 2, b: 5, c: 3) {
case .firstOrderEq:
    print("It's a first order equation")
case .noSolution:
    print("This equation has no solution")
case .oneSolution(let x1):
    print("This equation has one solution \(x1)")
case .twoSolutions(let x1, let x2):
    print("This equation has two solutions \(x1) and \(x2)")
}
