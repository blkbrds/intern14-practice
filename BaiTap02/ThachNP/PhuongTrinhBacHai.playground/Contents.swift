import Foundation

enum ptb2Result {
    case coMotNghiem(Float)
    case coHaiNghiem(Float, Float)
    case voNghiem
    case voSoNghiem
}

func giaiPTB2(a: Float, b: Float, c: Float) -> ptb2Result {
    if a == 0 {
        if b != 0 {
            return ptb2Result.coMotNghiem(-c/b)
        }
        if c != 0 {
            return ptb2Result.voNghiem
        } else {
            return ptb2Result.voSoNghiem
        }
    } else {
        let delta = Float(b*b - 4*a*c);
        if (delta > 0.0) {
            return ptb2Result.coHaiNghiem((-b - sqrt(delta))/2*a, (-b + sqrt(delta))/2*a)
        } else if (delta == 0.0) {
            return ptb2Result.coMotNghiem(-b/2*a)
        } else {
            return ptb2Result.voNghiem
        }
    }
}
let test = giaiPTB2(a: 1, b: -5, c: 6)

switch test {
case .coMotNghiem(let x):
    print("nghiem la \(x)")
case .coHaiNghiem(let x1, let x2):
    print("nghiem la \(x1) va \(x2)")
case .voSoNghiem:
    print("Co vo so nghiem")
case .voNghiem:
    print("Khong co nghiem nao het")
}
