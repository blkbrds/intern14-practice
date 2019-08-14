import UIKit

class DongVat {
    private var name: String
    private var canNang: Double
    private var soChan: Int
    init(name: String, canNang: Double, soChan: Int) {
        self.name = name
        self.canNang = canNang
        self.soChan = soChan
    }
    func getSoChan() -> Int {
        return self.soChan
    }
}

class Ga: DongVat {
    private var name: String
    private var canNang: Double
    init?(name: String, canNang: Double) {
        self.name = name
        if canNang < 0.1 && canNang > 20 {
            return nil
        } else {
            self.canNang = canNang
        }
        super.init(name: name, canNang: canNang, soChan: 2)
    }

    override func getSoChan() -> Int {
        return super.getSoChan()
    }
}
enum GiongDe {
    case deCo
    case deBach
    case deAlpine
    case deSaanen
}

class De: DongVat {
    private var name: String
    private var canNang: Double
    private var giongDe: GiongDe
    init?(name: String, canNang: Double, giongDe: GiongDe) {
        self.name = name
        if canNang < 0.5 && canNang > 100 {
            return nil
        } else {
            self.canNang = canNang
        }
        self.giongDe = giongDe
        super.init(name: name, canNang: canNang, soChan: 4)
    }

    override func getSoChan() -> Int {
        return super.getSoChan()
    }
}
enum TypeChoosen {
    case ga
    case de
    case all
}

enum UpdateAnimal {
    case ga
    case de
}
class Chuong {
    private var gioiHanChuongNuoi: Int = 100
    private var listGa: [Ga] = []
    private var listDe: [De] = []

    init(gioiHanChuongNuoi: Int) {
        self.gioiHanChuongNuoi = gioiHanChuongNuoi
    }

    func addAnimal(add: UpdateAnimal, number: Int) {
        switch add {
        case .ga:
            for _ in 0...number - 1 {
                guard let ga = Ga(name: "none", canNang: 0.1) else { return }
                listGa.append(ga)
            }
        case .de:
            for _ in 0...number - 1 {
                guard let de = De(name: "de", canNang: 1, giongDe: .deCo) else { return }
               listDe.append(de)
            }
        }
    }

    func getAnimal(add: UpdateAnimal, number: Int) {
        switch add {
        case .ga:
            for _ in 0...number - 1 {
                listGa.removeLast()
            }
        case .de:
            for _ in 0...number - 1 {
                listGa.removeLast()
            }
        }
    }

    func reportManagerment() {
        let numberOfGa = listGa.count
        let numberOfDe = listDe.count
        print("List ga: \(numberOfGa)")
        print("List de: \(numberOfDe)")
        if numberOfDe + numberOfGa >= gioiHanChuongNuoi {
            print("Full!!! Not add")
        } else {
            print("Can add \((100 - numberOfDe + numberOfGa) / 2 ) ga")
            print("OR add \((100 - numberOfDe + numberOfGa) / 4 ) De")
        }
    }

    func deleteChuong(loai: TypeChoosen) {
        switch loai {
        case .ga:
            listGa.removeAll()
        case .de:
            listDe.removeAll()
        case .all:
            listGa.removeAll()
            listDe.removeAll()
        }
    }
}
