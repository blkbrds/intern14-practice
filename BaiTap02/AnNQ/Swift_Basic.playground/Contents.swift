import UIKit

enum QuadraticResult {
    case oneValue(Double)
    case twoValue(Double, Double)
    case noValue
    case oneValueDouble(Double)
}

enum SetOfEquationsResult {
    case oneValue(Double)
    case twoValue(Double, Double)
    case noValue
    case multipleValue
}

// Bai 1: compute superficies and volume
func computeSuperFiciesAndVolume (r: Double) -> (s: Double, v: Double) {
    let s = 4 * Double.pi * pow(r, 2)
    let v = s * r/3
    return (s, v)
}

//Bai 2: quadratic
func quadratic (a: Double, b: Double, c: Double) -> QuadraticResult {
    if a == 0 {
        return .oneValue(-c/b)
    }
    
    let delta = pow(b, 2) - 4*a*c
    if delta > 0 {
        return .twoValue((-b + sqrt(delta)) / 2*a, (-b - sqrt(delta)) / 2*a)
    } else if delta < 0 {
        return .noValue
    }
    
    return .oneValueDouble(-b / 2*a)
}

switch quadratic(a: 3, b: 8, c: 4) {
    case .oneValue(let x):
        print("1 value: \(x)")
    case .oneValueDouble(let x):
        print("1 value: x1 = x2 = \(x)")
    case .twoValue(let x1, let x2):
        print("2 value: x1 = \(x1), x2 = \(x2)")
    default:
        print("No value")
}


// Bai 3: set of equations
func setOfEquations (_ a1: Double, _ b1: Double, _ c1: Double, _ a2: Double, _ b2: Double, _ c2: Double) -> SetOfEquationsResult {
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

switch setOfEquations(4, 3, 5, 2, 6, 1) {
case .oneValue(let x):
    print("1 value: \(x)")
case .multipleValue:
    print("Multiple Value")
case .twoValue(let x1, let x2):
    print("2 value: x1 = \(x1), x2 = \(x2)")
default:
    print("No value")
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
    var list = [Int]()
    
    if n != 0 {
        for i in 2...n {
            if (isFibonacy(i) == 1) {
                sum += i
                list.append(i)
            }
        }
    }
    
    return (sum, list)
}

func checkHappyNumber(_ number: Int) -> (Bool) {
    var num = number
    var length = 0
    var previous = 0
    var next = 0
    var preLength = 0
    var nextLength = 0
    while  num != 0 {
        length += 1
        num /= 10
    }
    if (length % 2) == 0 {
        previous = number / Int((pow(10, (Double(length) / 2))))
        next = number % Int((pow(10, (Double(length) / 2))))
        while previous != 0 {
            preLength += previous % 10
            previous /= 10
        }
        while next != 0 {
            nextLength += next % 10
            next /= 10
        }
        return preLength == nextLength
    } else {
        return false
    }
}

func listHappyNumber (_ n: Int) -> [Int] {
    var arrHappyNumber: [Int] = []
    for i in 1...n {
        if checkHappyNumber(i) == true {
            arrHappyNumber.append(i)
        }
    }
    return arrHappyNumber
}

//Bai 5
func countSubString(_ parent: String, _ child: String) -> Int {
    // components use cut string a given separator.
    return parent.components(separatedBy: child).count - 1
    
}

//Bai 6
extension Array {
    func randomArrayInt() -> [Int] {
        guard let result = self.shuffled() as? [Int] else { return [] }
        return result
    }
}

func randomArray(_ array: [Int]) -> [Int] {
    return array.randomArrayInt()
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
first100Fibonacy(100)
countSubString("ababababbaababaa", "ab")
randomArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
arrayReplace ([1, 2, 3, 1, 2, 1], 1, 5)
listHappyNumber(10000)
