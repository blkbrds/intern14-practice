import UIKit

class MVCViewController: UIViewController {
    
    var theNumber: Double = 0
    var num1: Double = 0
    var num2: Double = 0
    var operand: Int = 0
    var kq: Double = 0
    let cong: Int = 10
    let tru: Int = 11
    let nhan: Int = 12
    let chia: Int = 13
    
    //Mark: - Outlet
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.black.cgColor
        printNum()
    }
    
    func printNum() {
        resultLabel.text = String(theNumber)
    }
    
    func saveNum1() {
        num1 = theNumber
        theNumber = 0
        printNum()
    }
    
    //Mark: - Actinon
    @IBAction func pressNum(sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            theNumber = theNumber * 10 + Double(sender.tag)
            resultLabel.text = String(theNumber)
            printNum()
        }
    }
    
    @IBAction func calc(sender: UIButton) {
        if sender.tag >= 10 && sender.tag <= 13 && theNumber != 0 {
            operand = sender.tag
            saveNum1()
            if sender.tag == 10 {
                resultLabel.text = "+"
            }
            if sender.tag == 11 {
                resultLabel.text = "-"
            }
            if sender.tag == 12 {
                resultLabel.text = "x"
            }
            if sender.tag == 13 {
                resultLabel.text = "/"
            }
            
        }
    }
    
    @IBAction func ketQua(sender: UIButton) {
        num2 = theNumber
    
        if operand == cong {
            kq = num1 + num2
        }
        if operand == tru {
            kq = num1 - num2
        }
        if operand == nhan {
            kq = num1 * num2
        }
        if operand == chia {
            if num2 == Double(0) {
                let alert = UIAlertController(title: "Lỗi", message: "không thể chia cho 0", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: { (action) -> Void in
                    self.theNumber = 0
                    self.printNum()
                })
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            kq = num1 / num2
        }
        num1 = 0
        num2 = 0
        theNumber = kq
        printNum()
    
    }
    
    @IBAction func removeAll(_ sender: UIButton) {
        theNumber = 0
        printNum()
    }
    
}
