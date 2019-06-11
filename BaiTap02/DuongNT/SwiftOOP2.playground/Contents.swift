import UIKit

// Bài tập 2:
class DaGiac {
    private var soCanh: Int
    private var listDoDai: [Int]
    
    init?(_ soCanh: Int, _ listDoDai: [Int]) {
        var checkZero = 1
        if soCanh < 3 && listDoDai.count < 3 || soCanh != listDoDai.count {
            return nil
        } else {
            self.soCanh = soCanh
            for item in listDoDai {
                checkZero *= item
            }
            if checkZero == 0 {
                return nil
            } else {
                self.listDoDai = listDoDai
            }
        }
    }
    
    func chuVi() -> Int? {
        var sum = 0
        guard let daGiac = DaGiac(soCanh, listDoDai) else {
            return nil
        }
        for temp in daGiac.listDoDai {
            sum += temp
        }
        return sum
    }
    
    func output() {
        if let chuVi = chuVi() {
            print("Chu vi của đa giác là: \(chuVi)")
        } else {
            print("Không phải đa giác")
        }
    }
}

// Bài 3
class TamGiac: DaGiac {

    private var soCanh = 3
    private var listDoDai: [Int]

    init?(soCanh: Int = 3, _ listDoDai: [Int]) {
        self.listDoDai = listDoDai
        super.init(soCanh, listDoDai)
    }

    override func chuVi() -> Int? {
        var sum = 0
        guard let tamGiac = TamGiac(listDoDai) else {
            return nil
        }
        for temp in tamGiac.listDoDai {
            sum += temp
        }
        return sum
    }
}

var tamGiac2 = TamGiac([1, 2, 5])
if let output = tamGiac2?.output() {
    output
} else {
    print("Không phải tam giác")
}
var daGiac = DaGiac(4, [1 ,2, 3, 6 ])
if let output = daGiac?.output() {
    output
} else {
    print("Không phải đa giác")
}
