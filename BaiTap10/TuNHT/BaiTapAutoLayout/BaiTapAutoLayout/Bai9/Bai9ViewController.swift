//
//  Bai9ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/6/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai9ViewController: UIViewController {
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var contentLabel: UILabel!
    let contents: [String] = ["Cristiano Ronaldo dos Santos Aveiro, có biệt danh là 'CR7', là cầu thủ bóng đá quốc tịch Bồ Đào Nha hiện đang thi đấu ở giải vô địch Ý cho câu lạc bộ Juventus với vị trí tiền vệ cánh hay tiền đạo và là đội trưởng của đội tuyển bóng đá Bồ Đào Nha.",
                              "Lionel Andrés 'Leo' Messi Cuccittini, thường biết tới với tên gọi Lionel Messi, là một cầu thủ bóng đá người Argentina hiện đang chơi ở vị trí tiền đạo cho câu lạc bộ Barcelona và đội tuyển bóng đá quốc gia Argentina.",
                              "Antoine Griezmann là một cầu thủ bóng đá chuyên nghiệp người Pháp đang chơi cho câu lạc bộ Barcelona chủ yếu ở vị trí tiền đạo. Bắt đầu sự nghiệp của mình tại Real Sociedad, anh đã trải qua năm mùa giải chơi cho câu lạc bộ trước khi chuyển sang thi đấu cho Atlético với phí chuyển nhượng lên tới 30 triệu Euro.",
                              "Eden Michael Hazard là một cầu thủ bóng đá người Bỉ hiện đang chơi ở vị trí tiền đạo cho câu lạc bộ Real Madrid tại La Liga cũng như thi đấu cho đội tuyển Bỉ ở các giải đấu cấp độ đội tuyển. Vị trí thi đấu của anh thường là tiền đạo cánh trái.",
                              "Ricardo Izecson dos Santos Leite, được biết đến nhiều nhất với tên Kaká, là một cựu cầu thủ bóng đá người Brasil. Anh từng được trao danh hiệu Quả bóng vàng châu Âu và Cầu thủ xuất sắc nhất năm của FIFA vào năm 2007. Năm 2008, anh được tạp chí Time ghi tên vào danh sách 100 nhân vật có ảnh hưởng nhất thế giới.",
                              "Romelu Menama Lukaku Bolingoli là một cầu thủ bóng đá Bỉ gốc Zaire đang chơi ở vị trí tiền đạo cho câu lạc bộ Manchester United và đội tuyển Bỉ. Anh hiện là cầu thủ ghi nhiều bàn thắng nhất lịch sử đội tuyển quốc gia Bỉ với 48 bàn thắng. Lukaku sinh ra ở Antwerpen và lớn lên ở Boom gần đó.",
                              "Neymar da Silva Santos Júnior, thường được biết đến với tên gọi Neymar hoặc Neymar Jr., là một cầu thủ bóng đá người Brasil hiện đang chơi ở vị trí tiền đạo cho câu lạc bộ Paris Saint-Germain và đội tuyển bóng đá quốc gia Brasil. Anh bắt đầu là thủ quân của đội tuyển Brasil khi mới chỉ 21 tuổi.",
                              "Paul Labile Pogba là cầu thủ người Pháp gốc Guinée hiện đang chơi cho Manchester United và đội tuyển bóng đá quốc gia Pháp ở vị trí tiền vệ.",
                              "Wayne Mark Rooney là một cầu thủ bóng đá người Anh hiện đang chơi ở vị trí Tiền vệ tấn công cho câu lạc bộ D.C. United tại Giải bóng đá nhà nghề Mỹ MLS cũng như từng thi đấu cho đội tuyển Anh ở các trận đấu cấp độ quốc tế.",
                              "Ronaldinho, tên thật là Ronaldo de Assis Moreira, thường được gọi với cái tên thân mật là Ronnie, biệt danh: Ronaldinho Gaucho, là một cựu cầu thủ bóng đá người Brasil chơi ở vị trí tiền đạo, được đào tạo lúc trẻ tại câu lạc bộ Grêmio. Anh là một trong những cầu thủ xuất sắc nhất thế giới hiện đại."]

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        title = "1/10"
        contentLabel.text = contents[0]
    }
    
    func config() {
        contentLabel.layer.borderWidth = 2
        contentLabel.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    @IBAction func leftButtonTouchUpInside(_ sender: Any) {
        let currentOffsetX = imageScrollView.contentOffset.x
        if currentOffsetX == 0 {
            imageScrollView.contentOffset.x = imageScrollView.bounds.width * 9
        } else {
            imageScrollView.contentOffset.x = currentOffsetX - imageScrollView.bounds.width
        }
        title = "\(Int((imageScrollView.contentOffset.x / imageScrollView.bounds.width) + 1))/10"
        contentLabel.text = contents[Int((imageScrollView.contentOffset.x / imageScrollView.bounds.width))]
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: Any) {
        let currentOffsetX = imageScrollView.contentOffset.x
        if currentOffsetX == imageScrollView.bounds.width * 9 {
            imageScrollView.contentOffset.x = 0
        } else {
            imageScrollView.contentOffset.x = imageScrollView.bounds.width + currentOffsetX
        }
        title = "\(Int((imageScrollView.contentOffset.x / imageScrollView.bounds.width) + 1))/10"
        contentLabel.text = contents[Int((imageScrollView.contentOffset.x / imageScrollView.bounds.width))]
    }
}
