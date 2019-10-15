import UIKit

/**
 *  Polygon class
 **/
class Polygon {
    var edgesNumber: Int
    var edgesSize: [Int]
    
    init?(_ edgesNumber: Int, _ edgesSize: [Int]) {
        if edgesNumber < 3 && edgesSize.count < 3 || edgesNumber != edgesSize.count {
            print("This is not polygons")
            return nil
        } else {
            self.edgesNumber = edgesNumber
            if edgesSize.contains(0) {
                print("EdgesSize invalid")
                return nil
            }
            self.edgesSize = edgesSize
        }
    }
    
    func perimeter() -> Int {
        return edgesSize.reduce(0, +)
    }
    
    func printSizeOfEdges() {
        print("Edges number: \(edgesNumber)")
        for (key, val) in edgesSize.enumerated() {
            print("Polygon's edge \(key) : \(val)")
        }
    }
}

// Test
if let polygon = Polygon(4, [2,3,4,2]) {
    print("Polygon perimeter: \(polygon.perimeter())")
    polygon.printSizeOfEdges()
}

/**
 *  Triangle class
 **/
class Triangle : Polygon {
    override init?(_ edgesNumber: Int, _ edgesSize: [Int]) {
        if edgesSize.count != 3 {
            print("EdgesSize invalid")
            return nil
        }
        super.init(3, edgesSize)
    }
    func acreage() -> Double {
        print("text \(pow(Double(edgesSize[0]), 2))")
        let p = Double(super.perimeter())/2
        return sqrt(Double(p * (p - Double(edgesSize[0])) * (p - Double(edgesSize[1])) * (p - Double(edgesSize[2]))))
    }
    
    func checkPitago() -> Bool {
        let a = pow(Double(edgesSize[0]), 2)
        let b = pow(Double(edgesSize[1]), 2)
        let c = pow(Double(edgesSize[2]), 2)
        if ((a == b + c) || (b == a + c) || (c == a + b) ) {
            return true
        } else {
            return false
        }
    }
}

// Test
if let triangle = Triangle(3, [5,3,7]) {
    print("Triangle acreage: \(triangle.acreage())")
}

var triangleArr: [Triangle] = []
triangleArr.append(Triangle(3, [3, 4, 5])!)
triangleArr.append(Triangle(3, [2, 4, 6])!)
triangleArr.append(Triangle(3, [3, 5, 7])!)

for triangle in triangleArr {
    if (triangle.checkPitago()) {
        triangle.printSizeOfEdges()
    }
}
