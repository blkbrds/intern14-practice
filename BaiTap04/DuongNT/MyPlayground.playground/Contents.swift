import UIKit

func checkFactorial(n: Int) -> Bool {
    if n < 1 || n > Int(5 * pow(10.0, 5.0)) {
        return false
    }
    var gt = 1
    for item in 1...n/2 {
        gt *= item
        if gt > n {
            return false
        } else if gt == n {
            return true
        }
    }
    return false
}
checkFactorial(n:129)
func checkExistCount(_ parent: String) -> Int {
    let childs = parent[parent.startIndex..<parent.index(parent.startIndex, offsetBy: parent.count/2)]
    return parent.components(separatedBy: childs).count - 1
}
checkExistCount("abcabcda")
var a = "//acklcc.cac"
a.split(separator: "/")
func splitAddress(address: String) -> [String] {
    var a = [String]()
    var b = [String]()
    var c = [String]()
    for item in address.split(separator: ":") {
        if String(item).split(separator: "/").count > 1 {
            for items in item.split(separator: "/") {
                if String(items).split(separator: ".").count >= 1 {
                    for items in String(items).split(separator: ".") {
                        b.append(String(items))
                    }
                } else {
                    c.append(String(items))
                }
            }
        } else if String(item).split(separator: "/").count == 1 {
            if String(item).split(separator: ".").count >= 1 {
                for items in String(item).split(separator: ".") {
                    b.append(String(items))
                }
            } else {
                c.append(String(item))
            }
        } else {
            a.append(String(item))
        }
    }
    a.append(b[0])
    a.append(c[0])
    return a
}
splitAddress(address: "http://stackoverflow.com")
