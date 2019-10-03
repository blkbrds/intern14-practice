import UIKit

// Mapping
enum Equation {
    case noSolution
    case oneSolution(Double)
    case twoSolutions(Double, Double)
}

/**
 *  Caculate the equation
 *
 *  @param Double a,b,c [Coefficient]
 *
 *  @return Equation
 */
func calculateTheEquation(a: Double, b: Double, c: Double) -> Equation {
    if a == 0 {
        if b == 0 {
            return Equation.noSolution
        } else {
            let x = -c / b
            return Equation.oneSolution(x)
        }
    } else {
        let delta = pow(b, 2) - 4 * a * c
        if delta < 0 && a != 0 {
            return Equation.noSolution
        } else if delta == 0 && a != 0 {
            let x = -b / 2 / a
            return Equation.oneSolution(x)
        } else {
            let x1 = (-b - sqrt(delta)) / 2 / a
            let x2 = (-b + sqrt(delta)) / 2 / a
            return Equation.twoSolutions(x1, x2)
        }
    }
}

// Test
switch calculateTheEquation(a: 2, b: 0, c: 4) {
case Equation.oneSolution(let x):
    print("One solution: x = \(x)")
    break
case Equation.twoSolutions(let x1, let x2):
    print("Tow solution: x1 = \(x1), x2 = \(x2)")
    break
default:
    print("No solution")
}
