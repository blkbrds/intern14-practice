import UIKit

// Mapping
enum Equation {
    case noSolution
    case oneSolution(Double)
    case twoSolutions(Double, Double)
    case countlessSolutions
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
            if c == 0 {
                return Equation.countlessSolutions
            } else {
                return Equation.noSolution
            }
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
print("Equation 1:", calculateTheEquation(a: 2, b: 0, c: 4))
print("Equation 2:", calculateTheEquation(a: 0, b: 8, c: 4))
print("Equation 3:", calculateTheEquation(a: 2, b: 8, c: 0))
print("Equation 4:", calculateTheEquation(a: 0, b: 0, c: 0))
