import UIKit

class ViewA: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View A"
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    @IBAction private func turnNext(_ sender: UIButton) {
        navigationController?.pushViewController(ViewB(), animated: true)
    }
    
    
    
    
}
