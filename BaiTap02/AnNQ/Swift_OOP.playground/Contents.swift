import UIKit

//Bai 1
class Phanso {
    private(set) var tu: Int
    private(set) var mau: Int
    
    init?(_ tu: Int, _ mau: Int) {
        guard mau != 0 else {
            return nil
        }
        self.tu = tu
        self.mau = mau
    }
    
    func isPs () -> String {
        return "\(tu) / \(mau)"
    }
    
    func cong(_ ps: Phanso?) -> Phanso? {
        guard let ps = ps else { return nil }
        return Phanso(tu * ps.mau + mau * ps.tu, mau * ps.mau)
    }
    
    func tru(_ ps: Phanso?) -> Phanso? {
        guard let ps = ps else { return nil }
        return Phanso(tu * ps.mau - mau * ps.tu, mau * ps.mau)
    }

    func nhan(_ ps: Phanso?) -> Phanso? {
        guard let ps = ps else { return nil }
        return Phanso(tu * ps.tu, mau * ps.mau)
    }
    
    func chia (_ ps: Phanso?) -> Phanso? {
        guard let ps = ps else { return nil }
        return Phanso(tu * ps.mau, mau * ps.tu)
    }
    
   
}

//Bai 2
class Shapes {
    var countEdge: Int
    var arrayEdge: [Int]
    
    init?(_ countEdge: Int, _ arrayEdge: [Int]) {
        guard countEdge == arrayEdge.count else {
            return nil
        }
        if countEdge < 3 || arrayEdge.count < 3 {
            return nil
        }
        self.countEdge = countEdge
        self.arrayEdge = arrayEdge
    }
    
    func circuit() -> Int? {
        var c = 0
        for value in arrayEdge {
            c += value
        }
        return c
    }
    
    func printArrayEdge() -> [Int]? {
        var newArray = [Int]()
        for val in arrayEdge {
            newArray.append(val)
        }
        return newArray
    }
    
}

//Bai 3
class Triangle: Shapes {
    override init?(_ countEdge: Int, _ arrayEdge: [Int]) {
        super.init(countEdge, arrayEdge)
    }
    
    override func circuit() -> Int? {
        var c = 0
        guard let triangle = Triangle(3, arrayEdge) else {
            return nil
        }
        for val in triangle.arrayEdge {
            c += val
        }
        return c
    }

    func superficies() -> Int? {
        let p = circuit()!/2
        let s = Int(sqrt(Double(p * ( p - arrayEdge[0] ) * ( p - arrayEdge[1] ) * ( p - arrayEdge[2]))))
        return s
    }
}

//Bai 4
class Triangle2 {
    private var a: Double
    private var b: Double
    private var c: Double

    init?(_ a: Double, _ b: Double, _ c: Double) {
        self.a = a
        self.b = b
        self.c = c
        if  a < 0 || b < 0 || c < 0 {
            return nil
        }
    }
    
    func checkPythagoras() -> [Double]? {
        if a == sqrt(pow(b, 2) + pow(c, 2))
            || b == sqrt(pow(a, 2) + pow(c, 2))
            || c == sqrt(pow(b, 2) + pow(a, 2)) {
            return [a, b, c]
        }
        return nil
    }
}

class RightTriangle {
    private var triangles : [Triangle2]
    
    init(_ triangles: [Triangle2]) {
        self.triangles = triangles
    }
    
    func printEdges() -> Void {
        for val in self.triangles {
            print(val.checkPythagoras())
        }
    }
}

//Bai 5
class CStack {
    private(set) var stackArray = [Int]()
    private(set) var max = 5
    
    func isEmpty() -> Bool {
        if stackArray.isEmpty {
            return true
        }
        return false
    }
    
    func isFull() -> Bool {
        return stackArray.count == max
    }
    
    func push(_ element: Int) -> Void {
        if !isFull() {
            stackArray.append(element)
        } else {
            print("Stack Full")
        }
    }
    
    func pop() -> Int? {
        return stackArray.popLast()
    }
}

//Bai 6
protocol HinhVe {
    var edges: [Double] { get }
}

protocol HaiChieu: HinhVe {
    func circuit() -> Double?
    
    func superficies() -> Double?
}

protocol BaChieu: HinhVe {
    func superficies() -> Double?
    
    func volume() -> Double?
}

class HinhTron: HaiChieu {
    var edges: [Double]
    
    required init(_ edges: [Double]) {
        self.edges = edges
        guard !edges.isEmpty else {
            return
        }
    }
    
    func circuit() -> Double? {
        return 2 * Double.pi * edges[0]
    }
    
    func superficies() -> Double? {
        return pow(edges[0], 2) * Double.pi
    }
}

class HinhVuong: HaiChieu {
    var edges: [Double]
    
    required init(_ edges: [Double]) {
        self.edges = edges
        guard !edges.isEmpty else {
            return
        }
    }
    
    func circuit() -> Double? {
        return 4 * edges[0]
    }
    
    func superficies() -> Double? {
        return pow(edges[0], 2)
    }
}

class HinhTamGiac: HaiChieu {
    var edges: [Double]
    
    required init(_ edges: [Double]) {
        self.edges = edges
        guard edges.count == 3 else {
            return
        }
    }
    
    func circuit() -> Double? {
        return edges[0] + edges[1] + edges[2]
    }
    
    func superficies() -> Double? {
        let p = circuit()!/2
        let s = sqrt(Double(p * ( p - edges[0] ) * ( p - edges[1] ) * ( p - edges[2])))
        return s
    }
}

class HinhCau: BaChieu {
    var edges: [Double]
    
    required init(_ edges: [Double]) {
        self.edges = edges
        guard !edges.isEmpty else {
            return
        }
    }
    
    func superficies() -> Double? {
        return 4 * Double.pi * pow(edges[0], 2)
    }
    
    func volume() -> Double? {
        return superficies()! * edges[0] / 3
    }
}

class HinhLapPhuong: BaChieu {
    var edges: [Double]
    
    required init(_ edges: [Double]) {
        self.edges = edges
        guard !edges.isEmpty else {
            return
        }
    }
    
    func superficies() -> Double? {
        return 6 * pow(edges[0], 2)
    }
    
    func aroundSuperficies() -> Double? {
        return 4 * pow(edges[0], 2)
    }
    
    func volume() -> Double? {
        return pow(edges[0], 3)
    }
}

//Bai 7
struct Student {
    var fullname: String
    var year: Int
    var score: Double
    
    init(fullname: String, year: Int, score:Double) {
        self.fullname = fullname
        self.year = year
        self.score = score
    }
    
    func output() -> String {
        return "\(fullname) \(year) \(score)"
    }
}

class StudentList {
    private var students : [Student]
    
    init(_ students: [Student]) {
        self.students = students
    }
    
    func getListSortOrder() -> [Student] {
        var newStudent: Student
        for i in 0..<(students.count-1) {
            for j in 1..<students.count {
                if students[i].score < students[j].score {
                    newStudent = students[i]
                    students[i] = students[j]
                    students[j] = newStudent
                } else if students[i].score == students[j].score && students[i].year < students[j].year {
                    newStudent = students[i]
                    students[i] = students[j]
                    students[j] = newStudent
                    
                }
            }
        }
        for i in 0..<students.count {
            students[i].fullname = students[i].fullname.capitalized
        }
        
        return students
    }
}

//Bai 8
class Date {
    var day: Int
    var month: Int
    var year: Int
    
    init(_ day: Int,_ month: Int,_ year: Int) {
        self.day = day
        self.month = month
        self.year = year
        if day < 1 || day > 32 || month < 1 || month > 12 {
            return
        }
        
    }
    
    func normalize() -> Bool {
        return day > 1 && day < daysIn(month) && month > 1 && month < 12 && year >= 1
    }
    
    func daysIn(_ month: Int) -> Int {
        if month < 1 || month > 12 {
            return 0
        } else {
            switch month {
            case 1, 3, 5, 7, 8, 10, 12: return 31
            case 2:
                if year % 100 == 0 || year % 400 == 0 || year % 4 == 0 {
                    return 29
                } else {
                    return 28
                }
            default:
                return 30
            }
        }
    }
    
    func output() -> String {
        if (normalize()) {
            return ("\(day)-\(month)-\(year)")
        }
        return "Date is not exactly!"
    }
}

//Bai 9
class Mang1C {
    var array: [Int]
    
    init(_ array : [Int]) {
        self.array = array
    }
    
    func printArray () {
        for val in array {
            print(val)
        }
    }
    
    func minMax () -> (min: Int, max: Int) {
        var min = array[0]
        var max = array[0]
        for i in 1..<(array.count) {
            if min > array[i]{
                min = array[i]
            }
            if max < array[i] {
                max = array[i]
            }
        }
        return (min, max)
    }
}

//Bai 10
struct A {
    func sum(_ n: Int) -> Int {
        var s = 0
        for i in 1...n {
            s += i
        }
        return s
    }
}

func main () {
    //Bai 1
    let ps1 = Phanso(3, 4)
    let ps2 = Phanso(2, 3)
    
    print("Phep cong: \(ps1?.cong(ps2)?.isPs())")
    print("Phep tru: \(ps1?.tru(ps2)?.isPs())")
    print("Phep nhan: \(ps1?.nhan(ps2)?.isPs())")
    print("Phep chia: \(ps1?.chia(ps2)?.isPs())")
    
    //Bai 2
    let dg = Shapes(3, [2, 3, 4, 2])
    print("Circuit: \(dg?.circuit())")
    print("List Edges: \(dg?.printArrayEdge())")
    
    //Bai 3
    let tg = Triangle(3, [2, 4, 4])
    print("Circuit: \(tg?.circuit())")
    print("Superficies: \(tg?.superficies())")
    
    //Bai 4
    let arrTg = [Triangle2(1, 2, 3)!, Triangle2(2, 3, 4)!, Triangle2(3, 4, 5)!]
    let tgv = RightTriangle(arrTg)
    tgv.printEdges()
    
    //Bai 5
    let stack = CStack()
    stack.isEmpty()
    stack.isFull()
    stack.push(1)
    stack.pop()
    
    //Bai 6
    let ht = HinhTron([4])
    print("Dien tich: \(ht.superficies()) - Chu vi: \(ht.circuit())")
    
    let hv = HinhVuong([4])
    print("Dien tich: \(hv.superficies()) - Chu vi: \(hv.circuit())")

    let htg = HinhTamGiac([2, 3, 4])
    print("Dien tich: \(htg.superficies()) - Chu vi: \(htg.circuit())")

    let hc = HinhCau([4])
    print("Dien tich: \(hc.superficies()) - The tich: \(hc.volume())")

    let hlp = HinhLapPhuong([3])
    print("Dien tich toan phan: \(hlp.superficies()) - The tich: \(hlp.volume()) - Dien tich xung quanh \(hlp.aroundSuperficies())")
    
    //Bai 7
    let arrStudent: [Student] = [Student(fullname: "nguyen a", year: 1995, score: 8.0),
        Student(fullname: "ho b", year: 1996, score: 8.0),
        Student(fullname: "ngo c", year: 1994, score: 8.5),
        Student(fullname: "dang d", year: 1993, score: 7.8)]
    
    let students = StudentList(arrStudent)
    print(students.getListSortOrder())
    for val in students.getListSortOrder() {
        print(val.output())
    }
    
    //Bai 8
    let date = Date(30, 2, 2019)
    print(date.output())
    
    //Bai 9
    let mang1C = Mang1C([2, 3, 5, 1, 4])
    mang1C.printArray()
    mang1C.minMax()
    
    //Bai 10
    let a = A()
    a.sum(10)
}

//call function main
main()
