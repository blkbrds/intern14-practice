import UIKit

protocol Figure {
    var params: [Double] {get}
}

protocol TwoDimensional: Figure {
    func perimeter() -> Double?
    
    func acreage() -> Double?
}

protocol Multidimensional: Figure {
    func acreage() -> Double?
    
    func volume() -> Double?
}

// Circle class
class Circle: TwoDimensional {
    var params: [Double]
    
    init?(_ params: [Double]) {
        if params.isEmpty {
            print("Error")
            return nil
        }
        self.params = params
    }
    
    func perimeter() -> Double? {
        return 2 * Double.pi * params[0]
    }
    
    func acreage() -> Double? {
        return pow(params[0], 2) * Double.pi
    }
}

// Square class
class Square: TwoDimensional {
    var params: [Double]
    
    init?(_ params: [Double]) {
        if params.isEmpty {
            print("Error")
            return nil
        }
        self.params = params
    }
    
    func perimeter() -> Double? {
        return 4 * params[0]
    }
    
    func acreage() -> Double? {
        return pow(params[0], 2)
    }
}

// Triangle class
class Triangle: TwoDimensional {
    var params: [Double]
    
    init?(_ params: [Double]) {
        if params.isEmpty || params.count != 3 {
            print("Error")
            return nil
        }
        self.params = params
    }
    
    func perimeter() -> Double? {
        return params[0] + params[1] + params[2]
    }
    
    func acreage() -> Double? {
        let p = perimeter()!/2
        let result = sqrt(Double(p * ( p - params[0] ) * ( p - params[1] ) * ( p - params[2])))
        return result
    }
}

// Globular class
class Globular: Multidimensional {
    var params: [Double]
    
    init?(_ params: [Double]) {
        if params.isEmpty {
            print("Error")
            return nil
        }
        self.params = params
    }
    
    func acreage() -> Double? {
        return 4 * Double.pi * pow(params[0], 2)
    }
    
    func volume() -> Double? {
        return acreage()! * params[0] / 3
    }
}

// Cube class
class Cube: Multidimensional {
    var params: [Double]
    
    init?(_ params: [Double]) {
        if params.isEmpty {
            print("Error")
            return nil
        }
        self.params = params
    }
    
    func acreage() -> Double? {
        return 6 * pow(params[0], 2)
    }
    
    func volume() -> Double? {
        return pow(params[0], 3)
    }
}

//Test
if let circle = Circle([5]) {
    print("Acreage of circle \(String(describing: circle.acreage()))")
    print("Perimeter of circle \(String(describing: circle.perimeter()))")
}
if let square = Square([5]) {
    print("Acreage of square \(String(describing: square.acreage()))")
    print("Perimeter of square \(String(describing: square.perimeter()))")
}
if let triangle = Triangle([3,4,5]) {
    print("Acreage of square \(String(describing: triangle.acreage()))")
    print("Perimeter of square \(String(describing: triangle.perimeter()))")
}
if let globular = Globular([5]) {
    print("Acreage of globular \(String(describing: globular.acreage()))")
    print("Volume of globular \(String(describing: globular.volume()))")
}
if let cube = Cube([5]) {
    print("Acreage of cube \(String(describing: cube.acreage()))")
    print("Volume of cube \(String(describing: cube.volume()))")
}
