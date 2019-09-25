import UIKit

protocol Shapes {
    var edges: [Float] { get }
    func getPerimeter() -> Float?
    func getArea() -> Float?
}

protocol TwoDimensions : Shapes {
    
}

class Circle : TwoDimensions {
    
    var edges: [Float]
    required init(edge: [Float]) {
        self.edges = edge
        guard !edge.isEmpty else {
            return
        }
    }
    func getPerimeter() -> Float? {
        return 2 * Float.pi * edges[0]
    }
    func getArea() -> Float? {
        return pow(edges[0], 2) * Float.pi
    }
}

class Square : TwoDimensions {
    
    var edges: [Float]
    required init(edge: [Float]) {
        self.edges = edge
        guard !edge.isEmpty else {
            return
        }
    }
    func getPerimeter() -> Float? {
        return 4 * edges[0]
    }
    func getArea() -> Float? {
        return pow(edges[0], 2)
    }
}

class Triangle : TwoDimensions {
    
    var edges: [Float]
    required init(edge: [Float]) {
        self.edges = edge
        guard !edge.isEmpty else {
            return
        }
    }
    func getPerimeter() -> Float? {
        var perimeter:Float = 0.0
        for edge in edges {
            perimeter += edge
        }
        return perimeter
    }
    func getArea() -> Float? {
        let perimeter = getPerimeter()!/2
        let radian = sqrt(Double(perimeter * ( perimeter - edges[0] ) * ( perimeter - edges[1] ) * ( perimeter - edges[2])))
        return Float(radian)
    }
}

protocol ThreeDimensions : Shapes {
    func getVolume() -> Double?
}
class Sphere: ThreeDimensions {
    var edges: [Float]
    required init(edge: [Float]) {
        self.edges = edge
        guard !edge.isEmpty else {
            return
        }
    }
    func getPerimeter() -> Float? {
        return nil
    }
    func getArea() -> Float? {
        return 4 * Float.pi * edges[0] * edges[0]
    }
    func getVolume() -> Double? {
        return Double(Float(4 / 3) * Float.pi * edges[0] * edges[0] * edges[0])
    }
}

class Cuboid: ThreeDimensions {
    
    var edges: [Float]
    required init(edge: [Float]) {
        self.edges = edge
        guard !edge.isEmpty else {
            return
        }
    }
    
    func getPerimeter() -> Float? {
        return 6 * edges[0] * edges[0]
    }
    func getArea() -> Float? {
        return 4 * edges[0] * edges[0]
    }
    func getVolume() -> Double? {
        return Double(edges[0] * edges[0] * edges[0])
    }
}
