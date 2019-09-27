import UIKit

class Polygon {
    
    var edge: [Int] {
        willSet(newValue) {
            if (newValue.count == 0 || newValue.count != self.numberOfEdge) {
                self.edge = []
            } else {
                self.edge = newValue
            }
        }
        didSet {
            if (self.edge.count == 0) {
                print("The number of edge can not set.")
            }
        }
    }
    var numberOfEdge: Int = 0
    private var error: Int = 0
    
    init(numberEdge: Int, edge: [Int]) {
        self.edge = edge
        self.numberOfEdge = numberEdge
    }

    func getPerimeter() -> Int {
        var perimeter: Int = 0
        for val in edge {
            perimeter += val
        }
        return perimeter
    }
    
    func displayPolygonEdges() {
        for edgeValue in edge {
            print("Plygon edge : \(edgeValue)")
        }
    }
}


// Coding next practice 3.
class Triangle : Polygon {
    
    let numberEdge: Int = 3
    
    init(edge: [Int]) {
        super.init(numberEdge: numberEdge, edge: edge)
    }
    override func getPerimeter() -> Int {
        var trialPerimeter = 0
        for value in edge {
            trialPerimeter += value
        }
        return trialPerimeter
    }
    
    func getTriangleRadian() -> Int {
        let circuit = getPerimeter()/2
        let radian = Int(sqrt(Double(circuit * ( circuit - edge[0] ) * ( circuit - edge[1] ) * ( circuit - edge[2]))))
        return radian
    }
    
    /**
     * function check pitago triangle
     * Practice 4
     */
    func checkPitago() -> Bool {
        let a = edge[0]
        let b = edge[1]
        let c = edge[2]

        if ((a*a == b*b + c*c) || (b*b == a*c + c*c) || (c*c == a*a + b*b)) {
            return true
        }
        return false
    }
}

// Coding next practice 4
var triangleArray: [Triangle] = []
triangleArray.append(Triangle(edge: [3, 4, 5]))
triangleArray.append(Triangle(edge: [3, 8, 6]))

for triangle in triangleArray {
    if (triangle.checkPitago()) {
        triangle.displayPolygonEdges()
    }
}
