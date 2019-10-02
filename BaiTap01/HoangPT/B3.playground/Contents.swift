import UIKit

// Maping
enum Equation {
    case noSolution
    case twoSolutions (Double, Double)
    case countless
}

/**
 *  Solve the system of equations
 *
 *  @param Double a,b,c,a1,b1,c1 [Coefficient]
 *
 *  @return Equation
 */
func solveTheSystemOfEquations (a1:Double, b1:Double, c1:Double, a2:Double, b2:Double, c2:Double ) -> Equation {
    var D, Dx, Dy : Double
    D = a1 * b2 - a2 * b1
    Dx = c1 * b2 - c2 * b1
    Dy = a1 * c2 - a2 * c1
    if D == 0 {
        if c1 == c2 {
            return Equation.countless
        } else {
            return Equation.noSolution
        }
    }else {
        return Equation.twoSolutions(Dx / D, Dy / D)
    }
}

// Test
print("Equations 1:", solveTheSystemOfEquations(a1: 1, b1: 3, c1: 5, a2: 1, b2: 3, c2: 5))
print("Equations 2:", solveTheSystemOfEquations(a1: 1, b1: -3, c1: 5, a2: 1, b2: 3, c2: 5))
print("Equations 3:", solveTheSystemOfEquations(a1: 1, b1: 3, c1: 5, a2: 1, b2: 3, c2: 10))
