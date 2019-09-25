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
    
    func getPolygonPerimeter() -> Int {
        var perimeter: Int = 0
        for index in 0..<self.edge.count {
            perimeter += self.edge[index]
        }
        return perimeter
    }
    
    func displayPolygonEdges() {
        for edge in 0..<self.edge.count {
            print("Plygon edge : \(self.edge[edge])")
        }
    }
}

let particularPolygon = Polygon(numberEdge: 5, edge: [10,27,32,25,19])
particularPolygon.displayPolygonEdges()
print("polygon perimeter : \(particularPolygon.getPolygonPerimeter())")



// Coding next practice.

