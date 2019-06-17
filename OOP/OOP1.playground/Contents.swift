import UIKit

class Fraction {
    
    private(set) var numerator: Double
    private(set) var denominator: Double?
    
    init( _ numerator: Double, _ denominator: Double?) {
        self.numerator = numerator
        if denominator == 0 {
            self.denominator = nil
            print("The \(Fraction.self) is an invalid fraction")
        } else {
            self.denominator = denominator
        }
    }

    func multiply( _ numerator1: Double, _ denominator1: Double, _ numerator2: Double, _ denominator2: Double) -> Double? {
        let frac1 = Fraction(numerator1, denominator1)
        let frac2 = Fraction(numerator2, denominator2)
        guard let denom1 = frac1.denominator, let denom2 = frac2.denominator else {
            return nil
        }
        let result = (frac1.numerator * frac2.numerator / denom1 * denom2)
        print("The result of frac \(numerator1) / \(denominator1) multiply frac \(numerator1) / \(denominator2) is \(result)")
        return result
    }
    
    func divide( _ numerator1: Double, _ denominator1: Double, _ numerator2: Double, _ denominator2: Double) -> Double? {
        let frac1 = Fraction(numerator1, denominator1)
        let frac2 = Fraction(numerator2, denominator2)
        guard let denom1 = frac1.denominator, let denom2 = frac2.denominator else {
            return nil
        }
        let result = (frac1.numerator * denom2) / (denom1 * frac2.numerator)
        
        print("The result of frac \(numerator1) / \(denominator1) multiply frac \(numerator1) / \(denominator2) is \(result)")
        return result
    }
    
    func add( _ numerator1: Double, _ denominator1: Double, _ numerator2: Double, _ denominator2: Double) -> Double? {
        let frac1 = Fraction(numerator1, denominator1)
        let frac2 = Fraction(numerator2, denominator2)
        guard let denom1 = frac1.denominator, let denom2 = frac2.denominator else {
            return nil
        }
        let result = (frac1.numerator * denom2 + numerator2 * denom1) / (denom1 * denom2)
        print("The result of frac \(numerator1) / \(denominator1) multiply frac \(numerator1) / \(denominator2) is \(result)")
        return result
    }
    
    func subtract( _ numerator1: Double, _ denominator1: Double, _ numerator2: Double, _ denominator2: Double) -> Double? {
        let frac1 = Fraction(numerator1, denominator1)
        let frac2 = Fraction(numerator2, denominator2)
        guard let denom1 = frac1.denominator, let denom2 = frac2.denominator else {
            return nil
        }
        let result = (frac1.numerator * denom2 - numerator2 * denom1) / (denom1 * denom2)
        print("The result of frac \(numerator1) / \(denominator1) multiply frac \(numerator1) / \(denominator2) is \(result)")
        return result
    }
}

let fraction = Fraction(1, 1)
fraction.multiply(1, 1, 1, 1)
fraction.divide(1, 0, 1, 3)
fraction.add(1, 2, 1, 2)
fraction.subtract(1, 2, 1, 3)



