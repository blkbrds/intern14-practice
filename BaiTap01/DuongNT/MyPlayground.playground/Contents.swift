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
    var listDoDai: [Int]
    
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
class ListPitago {
    private var listPitago: [TamGiac]
    init(_ listPitago: [TamGiac]) {
        self.listPitago = listPitago
    }
    func checkPitago(_ tamGiac: TamGiac) -> Bool {
        if pow(tamGiac.listDoDai[0], 2) == pow(tamGiac.listDoDai[1], 2) + pow(tamGiac.listDoDai[2], 2) {
            
        }
    }
}

var listPitago = ListPitago([TamGiac([1, 2, 3]), TamGiac([3, 4, 5]), TamGiac([5, 12, 13]), TamGiac([1, 2, 3]), TamGiac([1, 3, 5])])
var tamGiac2 = TamGiac([1, 2, 3])
tamGiac2.output()
var tamGiac = DaGiac(4, [1 ,2, 3, 6 ])
tamGiac.output()
