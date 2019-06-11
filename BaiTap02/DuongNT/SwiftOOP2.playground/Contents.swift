import UIKit

// Bài tập 2:
class DaGiac {
    private var soCanh: Int
    private var listDoDai: [Int]
    
    init(_ soCanh: Int, _ listDoDai: [Int]) {
        self.soCanh = soCanh
        self.listDoDai = listDoDai
    }
    
    func chuVi() -> Int {
        var sum = 0
        if soCanh < 3 {
            return sum
        } else if soCanh == listDoDai.count{
            for temp in listDoDai {
                sum += temp
            }
        } else {
            return sum
        }
        return sum
    }
    
    func output(){
        print("Chu vi của đa giác là: \(chuVi())" )
    }
}

// Bài 3
class TamGiac: DaGiac {
    
    private var soCanh = 3
    private var listDoDai: [Int]
    
//    override init(_ soCanh: Int = 3, _ listDoDai: [Int]) {
//        self.listDoDai = listDoDai
//        super.init(soCanh, listDoDai)
//    }
    
    init(soCanh: Int = 3, _ listDoDai: [Int]) {
        self.listDoDai = listDoDai
        super.init(soCanh, listDoDai)
    }
    
    override func chuVi() -> Int {
        var sum = 0
        if soCanh == listDoDai.count {
            for temp in listDoDai {
                sum += temp
            }
        } else {
            return sum
        }
        return sum
    }
}

// Bài 4
//class ListPitago: TamGiac {
//    init(<#parameters#>) {
//        <#statements#>
//    }
//}


var tamGiac2 = TamGiac([1, 2, 3])
tamGiac2.output()
var tamGiac = DaGiac(4, [1 ,2, 3, 6 ])
tamGiac.output()
