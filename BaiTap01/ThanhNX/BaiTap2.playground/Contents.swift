//Bai 2: ax2 + bx + c = 0
func ptBac2(_ a: Float,_ b: Float, _ c: Float) -> (Float, Float){
    let delta: Float = powf(b, 2) - 4*a*c
    if a == 0 {
        return (0, -c / b)
    }else{
        if delta < 0 {
            return (0, 0)
        } else if delta == 0 {
            return (0 , -b / (2*a))
        }else{
            return ((-b + sqrtf(delta) / 2*a),((-b - sqrtf(delta) / 2*a)))
        }
    }
}

enum dapan {
    case VoNghiem
    case CoNghiemKep
    case Co2Nghiem
}

let bai2 = ptBac2(3, 2, -9)

print("Nghiệm phương trình bậc 2")
