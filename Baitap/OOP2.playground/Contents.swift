import UIKit


// Bai tap 02
print("Bai tap 02")
class Plygon {
    private(set) var edge: [Int]
    private(set) var numberOfEdge: Int
    
    init?(edge: [Int], numberOfEdge: Int) {
        self.edge = edge
        let numberOfEdge = edge.count
        if numberOfEdge <= 2 || numberOfEdge != edge.count {
            return nil
        }
        self.numberOfEdge = numberOfEdge
    }
    
    func calculatePerimeter() -> Int {
        var result = 0
        for i in edge {
        result += i
        }
        return result
        
    }
    
}

if let b = Plygon(edge: [1,2], numberOfEdge: 2){
    print("The perimeter of plygon is \(b.calculatePerimeter())")
} else {
    print("The numbers of edges must be greater than 2")
}


// Bai tap 03
print("Bai tap 03")
class Triangle: Plygon {
    
    override init?(edge: [Int], numberOfEdge: Int) {
        super.init(edge: edge, numberOfEdge: numberOfEdge)
        
        guard edge.count == 3 else {
            return nil }
        
        if (edge[0] + edge[1] > edge[2]) || (edge[0] + edge[2] > edge[1]) || (edge[1] + edge[2] > edge[0]){
            print("This is a triangle")
        }

    }
    
//    init?(a: Int, b: Int, c: Int) {
//        self.a = a
//        self.b = b
//        self.c = c
//        super.init(edge: [a, b, c], numberOfEdge: 3)
//        let a = edge[0]
//        let b = edge[1]
//        let c = edge[2]
//        if (a + b > c) || (a + c > b) || (b + c > a){
//            self.a = a
//            self.b = b
//            self.c = c
//            print("This is a triangle")
//        }
//        else {
//            print("This is not a triangle")
//            return nil
//        }
//    }

    func caculateAreaOfTriangle() -> Double {
        let perimeter = Double(calculatePerimeter()/2)
        let x = perimeter - Double(edge[0])
        let y = perimeter - Double(edge[1])
        let z = perimeter - Double(edge[2])
        let S = sqrt(perimeter * x * y * z)
        return S
    }
}

if let tamgiac = Triangle(edge: [3, 4, 5], numberOfEdge: 3) {
    print("The perimeter of triangle is \(tamgiac.calculatePerimeter()) and the area is \(tamgiac.caculateAreaOfTriangle())")
} else {
    print("This is not a triangle")
}

class PitagoTriangle: Triangle {
    private(set) var edgesOfTriangles: [[Int]]
    init?(edgesOfTriangles: [[Int]]){
        if 
    }
}
