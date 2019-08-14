import UIKit

//3.A. Content size của scrollview hiện tại  là: ( 375 / 667 )

//3.B. Content offset hiện tại của scrollview như hình vẽ là: ( x : 100 , y : 200 )

//3.C. Frame hiện tại của ScrollView là: ( x : 100, y : 200, width : 375 ,height : 667 )

//3.D. Để xem được phần hình ảnh ở góc dưới phải, thì phải set content offset:
// (x : 225 , y : 333 )

//3.E. Sau khi Set lại content offset ở 3.D, frame mới của ScrollView là:
// ( x : 225, y : 333 , width : 375 , height : 667 )

//Câu 4.A: Thuộc tính frame của view B có giá trị là:
//    ( x : 100, y : 50 , width : 200, height : 300 )

//Câu 4.B: Thuộc tính bound của view B có giá trị là:
//    ( x : 0, y : 0 , width : 200, height : 300 )

//Câu 4.C: Thuộc tính center của view B có giá trị là: x : 225 , y : 200



class Animals {
    private var twoLegs: Int = 2
    private var fourLegs: Int = 4
}

class Chickens : Animals {
    private var name: String
    private var weight: Double
    
    init?(name: String, weight: Double) {
        self.name = name
        if weight <= 0.1 && weight >= 20 {
            return nil }
        self.weight = weight
        super.init()
    }
    var conGa : [Chickens] = [Chickens(name: "A", weight: 2)!,Chickens(name: "B", weight: 3)!,Chickens(name: "C", weight: 3)!,Chickens(name: "D", weight: 4)!]
}

class Goats : Animals {
    private var name: String
    private var weight: Double
    private var species: String
    
    init?(name: String, weight: Double, species: String) {
        self.name = name
        if weight <= 0.5 && weight >= 100 {
            return nil }
        self.weight = weight
        self.species = species
        super.init()
    }
    var conDe : [Goats] = [Goats(name: "E", weight: 2, species: "co")!,Goats(name: "F", weight: 3, species: "bachthao")!,Goats(name: "G", weight: 4, species: "alpine")!, Goats(name: "H", weight: 5, species: "saanen")!]
}

class Cage {
    private let maxLegs: Int = 20
    private var listChickens: [Chickens] = []
    private var listGoats : [Goats] = []
    
    //    func checkLegs() {
    //        listChickens.count
    //        listGoats.count
    //        var soChanGa = listChickens.count * 2
    //        var soChanDe = listChickens.count * 4
    //
    //}
    
    func addAnimal() {
        if ( listChickens.count * 2 ) + ( listGoats.count * 4 ) > 20 {
            print("khong the them ga hoac vit!")
        } else if ( listChickens.count * 2 ) + ( listGoats.count * 4 ) == 18 {
            listChickens.append(<#T##newElement: Chickens##Chickens#>)
        } else {
            listChickens.append(<#T##newElement: Chickens##Chickens#>)
            listGoats.append(<#T##newElement: Goats##Goats#>)
        }
        
        
    }
    func announce() {
        print("so chan ga va de hien tai la : \(listChickens.count * 2) , \(listGoats.count * 2)")
        
    }
    func del() {
        listGoats.removeAll()
        listChickens.removeAll()
    }
}



