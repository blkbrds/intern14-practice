import UIKit

class Fraction {

    var numerator: Int
    var denominator: Int
    
    /**
    * Default constructor with parameters.
    */
    init(numerate: Int, denominate: Int) {
        self.numerator = numerate
        self.denominator = denominate
    }
    
    /**
     * Default constructor.
     */
    init() {
        numerator = 0
        denominator = 1
    }
    
    /**
    * Reduce fractions.
    */
    private func reduce() {
        let gcd = greatestCommonDenominator(first: self.numerator, second: self.denominator)
        self.numerator /= gcd
        self.denominator /= gcd
    }
    
    private func greatestCommonDenominator(first: Int, second: Int) -> Int {
        return second == 0 ? first : greatestCommonDenominator(first: second, second: first % second)
    }
    
    func addition(other additionFraction: Fraction) -> Fraction {
        self.numerator = self.numerator * additionFraction.denominator
            + self.denominator * additionFraction.numerator
        self.denominator = self.denominator * additionFraction.denominator
        self.reduce()
        return self;
    }
    
    func subjection(other otherFraction: Fraction) -> Fraction {
        self.numerator = self.numerator * otherFraction.denominator
            - self.denominator * otherFraction.numerator
        self.denominator = self.denominator * otherFraction.denominator
        self.reduce()
        return self;
    }
    
    func multiple(other otherFraction: Fraction) -> Fraction {
        self.numerator = self.numerator * otherFraction.numerator
        self.denominator = self.denominator * otherFraction.denominator
        self.reduce()
        return self;
    }
    
    func division(other otherFraction: Fraction) -> Fraction {
        self.numerator = self.numerator * otherFraction.denominator
        self.denominator = self.denominator * otherFraction.numerator
        return self
    }
}


var firstFraction : Fraction = Fraction(numerate: 10, denominate: 17)
var secondFraction : Fraction = Fraction()
secondFraction.numerator = 7
secondFraction.denominator = 10

let additionResult = firstFraction.addition(other: secondFraction)
print("first fraction add second fraction is : \(additionResult.numerator) / \(additionResult.denominator)")

let subjectionResult = firstFraction.subjection(other: secondFraction)
print("first fraction sub second fraction is : \(subjectionResult.numerator) / \(subjectionResult.denominator)")

let multipleResult = firstFraction.multiple(other: secondFraction)
print("first fraction mul second fraction is : \(multipleResult.numerator) / \(multipleResult.denominator)")

let divisionResult = firstFraction.division(other: secondFraction)
print("first fraction div second fraction is : \(divisionResult.numerator) / \(divisionResult.denominator)")
