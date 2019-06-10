import UIKit

class Plygon {
    private(set) var edge: [Int]
    private(set) var numberOfEdge: Int?
    init?(edge: [Int], numberOfEdge: Int) {
        self.edge = edge
        if numberOfEdge <= 2 {
            print("The numbers of edges must be greater than 2")
            return nil
        }
        self.numberOfEdge = numberOfEdge
    }
    func calculatePerimeter(edge: [Int]) -> Int {
        var result = 0
        for i in edge {
        result += i
        let size = edge.count
        }
        print("The edges in Plygon \(edge)")
        return result
        
    }
    
}
let plygon = Plygon(edge: [1,1,1], numberOfEdge: 3)
print("The perimeter of plygon \(plygon?.calculatePerimeter(edge: [1,2,3]))")


