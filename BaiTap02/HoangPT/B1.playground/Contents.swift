import UIKit

class Fraction {
    var numerator: Int
    var denominator: Int
    
    init?(_ numerator: Int, _ denominator: Int) {
        self.numerator = numerator
        if denominator == 0 {
            return nil
        }
        self.denominator = denominator
    }
    
    func summation(fraction: Fraction?) -> Fraction? {
        guard let fraction = fraction else { return nil }
        if self.denominator == fraction.denominator {
            return Fraction(self.numerator + fraction.numerator, self.denominator)
        } else {
            return Fraction((self.numerator * fraction.denominator) + (self.denominator * fraction.numerator), (self.denominator * fraction.denominator))
        }
    }
    
    func subtraction(fraction: Fraction?) -> Fraction? {
        guard let fraction = fraction else { return nil }
        if self.denominator == fraction.denominator {
            return Fraction(self.numerator - fraction.numerator, self.denominator)
        } else {
            return Fraction((self.numerator * fraction.denominator) - (self.denominator * fraction.numerator), (self.denominator * fraction.denominator))
        }
    }
    
    func multiplication(fraction: Fraction?) -> Fraction? {
        guard let fraction = fraction else { return nil }
        return Fraction(self.numerator * fraction.numerator, self.denominator * fraction.denominator)
    }
    
    func division(fraction: Fraction?) -> Fraction? {
        guard let fraction = fraction else { return nil }
        return Fraction(self.numerator * fraction.denominator, self.denominator * fraction.numerator)
    }
}

let firstFraction = Fraction(5, 2)
let secondFraction = Fraction(4, 2)

if let f = firstFraction, let s = secondFraction {
    if let plusResult = f.summation(fraction: s) {
        print("Summation: \(plusResult.numerator), \(plusResult.denominator)")
    }
}

if let f = firstFraction, let s = secondFraction {
    if let plusResult = f.subtraction(fraction: s) {
        print("Subtraction: \(plusResult.numerator), \(plusResult.denominator)")
    }
}

if let f = firstFraction, let s = secondFraction {
    if let plusResult = f.multiplication(fraction: s) {
        print("Multiplication \(plusResult.numerator), \(plusResult.denominator)")
    }
}

if let f = firstFraction, let s = secondFraction {
    if let plusResult = f.division(fraction: s) {
        print("Division: \(plusResult.numerator), \(plusResult.denominator)")
    }
}




