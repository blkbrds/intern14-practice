import UIKit

enum ResultCase {
    case oneValue(Double)
    case twoValue(Double, Double)
    case noValue
    case oneValueDouble(Double)
    case multipleValue
}

// Bai 1: compute superficies and volume
func computeSuperFiciesAndVolume (r: Double) -> (s: Double, v: Double) {
    let s = 4 * Double.pi * pow(r, 2)
    let v = s * r/3
    return (s, v)
}

//Bai 2: quadratic
func quadratic (a: Double, b: Double, c: Double) -> ResultCase {
    if a == 0
    {
        return .oneValue(-c/b)
    }
    else{
        let delta = pow(b, 2) - 4*a*c
        
        if delta > 0 {
            return .twoValue((-b + sqrt(delta)) / 2*a, (-b - sqrt(delta)) / 2*a)
        }
        else if delta < 0 {
            return .noValue
        }
        else {
            return .oneValueDouble(-b / 2*a)
        }
    }
}


// Bai 3: set of equations
func setOfEquations (_ a1: Double, _ b1: Double, _ c1: Double, _ a2: Double, _ b2: Double, _ c2: Double) -> ResultCase {
    let d = a1*b2 - a2*b1
    let dx = c1*b2 - c2*b1
    let dy = a1*c2 - a2*c1
    if d == 0 {
        if c1 == c2 {
            return .multipleValue
        }
        return .noValue
    }
    return .twoValue(dx/d, dy/d)
}

//Bai 4
func isFibonacy(_ i: Int) -> (Int){
    if (i/2 == 1) {
        return 1
    }
    
    for k in 2...i/2 {
        if (i % k == 0) {
            return 0
        }
    }
    return 1
}
func first100Fibonacy(_ n: Int) -> (sum: Int, list: [Int]){
    var sum = 0
    var list = [Int] ()
    for i in 2...n {
        if (isFibonacy(i) == 1) {
            sum += i
            list.append(i)
        }
    }
    return (sum, list)
}

//Bai 5
func countSubString(_ parent: String, _ child: String) -> Int {
    // components use cut string a given separator.
    return parent.components(separatedBy: child).count - 1
    
}

//Bai 6
func randomArray(_ array: [Int]) -> [Int] {
    return array.shuffled()
}

//Bai 7
func arrayReplace(_ inputArray: [Int], _ elemToReplace: Int, _ substitutionElement: Int) -> [Int] {
    var newArray = inputArray
    for i in 0..<inputArray.count {
        if (elemToReplace == inputArray[i]) {
            newArray[i] = substitutionElement
        }
    }
    return newArray
}

//call function
computeSuperFiciesAndVolume(r:20)
quadratic(a: 3, b: 8, c: 4)
setOfEquations(4, 3, 5, 2, 6, 1)
first100Fibonacy(10)
countSubString("ababababbaababaa", "ab")
randomArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
arrayReplace ([1, 2, 3, 1, 2, 1], 1, 5)
