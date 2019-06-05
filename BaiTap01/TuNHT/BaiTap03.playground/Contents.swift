import UIKit

enum Equations {
    case noSolution
    case oneSolution(Double, Double)
    case countlessSolution
}

func calculateEq(a1: Double, b1: Double, c1:Double, a2: Double, b2: Double, c2: Double) -> Equations {
    if (a1*b2-a2*b1 == 0 && c1 == c2 && c2 == 0) {
        return .countlessSolution
    }
    else if (a1*b2-a2*b1 == 0 && c1 != c2){
        return .noSolution
    }
    else {
        return .oneSolution((c1*b2-c2*b1)/(a1*b2-a2*b1), (a1*c2-a2*c1)/(a1*b2-a2*b1))
    }
}

switch calculateEq(a1: 2, b1: 3, c1: 1, a2: 3, b2: 4, c2: 2) {
case .noSolution:
    print("This equation has no solution")
case .oneSolution(let x1, let x2):
    print("This equation has solution: \(x1) and \(x2)")
case .countlessSolution:
    print("This equation has countless solution")
}
