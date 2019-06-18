import UIKit

class HocSinh {
    var hoTen: String
    var namSinh: String
    var tongDiem: Double
    
    init(_ hoten: String, _ namSinh: String, tongDiem: Double){
        self.hoTen = hoten
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func output() -> String {
        return "\(hoTen) \(namSinh) \(tongDiem)"
    }
}
class QuanLiHocSinh {
    var hocSinh = [HocSinh]()
    
    init(_ hocSinh: [HocSinh]) {
        self.hocSinh = hocSinh
    }
    
    func sort() -> [HocSinh] {
        var tempArr = hocSinh
        for i in 0..<tempArr.count {
            for j in 0..<(tempArr.count - i - 1) {
                if tempArr[j].tongDiem > tempArr[j + 1].tongDiem {
                    let tmp = tempArr[j + 1]
                    tempArr[j + 1] = tempArr[j]
                    tempArr[j] = tmp
                } else if tempArr[j].tongDiem == tempArr[j + 1].tongDiem {
                    for i in 0..<tempArr.count {
                        for j in 0..<(tempArr.count - i - 1) {
                            if tempArr[j].namSinh > tempArr[j + 1].namSinh {
                                let tmp = tempArr[j + 1]
                                tempArr[j + 1] = tempArr[j]
                                tempArr[j] = tmp
                            }
                        }
                    }
                }
            }
        }
        for index in 0..<tempArr.count {
            tempArr[index].hoTen = tempArr[index].hoTen.capitalized
        }
        return tempArr
    }
    
}
var manager = QuanLiHocSinh([HocSinh("nguyen tung duong", "1999", tongDiem: 10), HocSinh("nguyen tung duong", "1994", tongDiem: 10), HocSinh("nguyen tung duong", "1999", tongDiem: 6), HocSinh("nguyen tung duong", "1999", tongDiem: 15)])

for temp in manager.sort() {
    print(temp.output())
}
