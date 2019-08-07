//
//  Pic01ViewController.swift
//  AutoLayoutEx
//
//  Created by PCI0007 on 8/6/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Pic01ViewController: UIViewController {
    

    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var avatarScrollView: UIScrollView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var x = 1
    let contents = ["Anh cô đơn giữa tinh không này, Muôn con sóng cuốn xô vào đây, Em cô đơn giữa mênh mông ngườiVà ta cô đơn đã hai triệu năm, Anh cô đơn giữa tinh không này, Muôn con sóng cuốn xô vào đâyEm cô đơn giữa mênh mông ngườiVà ta cô đơn đã hai triệu năm", "Xung quanh anh toàn là nước, ay,Cơ thể anh đang bị ướt, ay Mênh mông toàn là nước, ayÊm ái như chưa từng trước đây Trăm ngàn con sóng xô-ya Anh lao vào trong biển cả vì em làm anh nóng khô-ya Anh ngâm mình trong làn nước để mặn mòi từ da dẻ (mặn mòi từ da dẻ)  Ta cần tình yêu vì tình yêu làm cho ta trẻ (đúng rồi) Anh cũng cần em nhưng không biết em sao Anh không care lắm và anh quyết đem trao Cho em hết nắng cho em hết đêm sao Nhìn mặt anh đi, em nghĩ anh tiếc em sao? Trăm ngàn con sóng từ mọi nơi mà đổ về Và đây là cách mà anh đi tìm kiếm sự vỗ về        Em có quá nhiều bí mật, anh thì ko cần gặng hỏi Em sâu như là đại dương, anh thì không hề lặn giỏi (anh thì không hề lặn giỏi baby) Anh soi mình vào gương cho bõ công lau  Thấy mặt thấy người sao thấy rõ trong nhau Ánh mắt nụ cười kia không rõ nông sâu Ta rồi sẽ là ai, một câu hỏi nhỏ trong đầu  Ta chỉ là hòn đất hay chỉ là cỏ bông lau (Như là mấy gã em mới bỏ không lâu) Hay chỉ là đầu thuốc kia cháy đỏ không lâu Yêu em kiểu nông dân, yêu em kiểu quê mùa Yêu từ vụ đông xuân, đến hè thu thay mùa Nhưng em thì trơn trượt như là con cá chuối Muốn níu em trong tay, Khá Bảnh cũng khá đuối (Khá Bảnh cũng khá đuối) Em giống hệt như biển cả em có nhiều bí mật        Anh làm rất nhiều thứ, để đồng tiền trong ví chật Người ta không quý con ong, mà người ta chỉ quý mật Em hỏi sao nhạc anh hay, anh gọi nó là bí thuật, yo Em hỏi sao nhạc anh hay, anh gọi nó là bí thuật, yo", "Trời vừa sớm nhưng em đã thức dậy đi dạo quanh làng. Tiếng gà gáy râm ran khắp xóm. Khi trời mát mẻ, không gian thoáng đãng. Một làn gió thoảng qua làm xao động cành lá để lộ ra những hạt sương sớm long lanh. Bầu trời cao, rộng mênh mông, đây đó một vài đám mây trắng lững lờ trôi. Từ các mái bếp, những làn khói nghi ngút bay lên hoà quyện với sương sớm tạo thành những dải lụa mềm uốn lượn trên bầu trời. Ngoài đồng những bông lúa ngả đầu vào nhau thì thầm trò chuyện. Nhìn từ xa, cánh đồng trông như một tấm thảm màu xanh pha vàng trải rộng mênh mông. Đây đó trên cánh đồng lác đác một vài bác nông dân ra thăm ruộng. Từ các ngõ xóm, trên đường làng, các bà các chị gánh những gánh hàng, rau tươi su hào, cải bắp … mang ra chợ bán. Các em bé xúng xính trong những bộ quần áo sặc sỡ lon ton theo mẹ ra chợ. Những chú lợn eng éc đòi ăn, những chú kêu ăng ẳng, mọi người ý ới gọi nhau đi làm. Đằng đông, mặt trời tròn xoe, ửng hồng đang từ từ nhô lên sau bụi tre, chiếu những tia nắng ấm áp xuống mặt đất, xua tan màn sương sớm, nhuộm vàng những bông lúa làm cả xóm làng như sáng bừng lên giữa ánh bình minh. Bầu trời lúc này như trong và sáng hơn, mây trắng hiền hoà, từng đàn chim bay lượn thật là đẹp. Trên các cành cây, những chú chim hót líu lo chào ngày mới. Ngoài đường, xe cộ đi lại nườm nượp, các bạn học sinh vui vẻ đến trường. Tất cả các màu sắc, cảnh vật, âm thanh đó như hoà quện với nhau tạo nên phong cảnh làng quê thật trù phú, tươi vui.", "Anh cô đơn giữa tinh không này        Muôn con sóng cuốn xô vào đây Em cô đơn giữa mênh mông người        Và ta cô đơn đã hai triệu năm", "ước đã hình thành trong hàng triệu năm (triệu năm)        Cát đã hình thành trong hàng triệu năm (triệu năm)        Biển cả hình thành trong hàng triệu năm (triệu năm)        Sao em làm anh buồn sau hàng triệu năm (triệu năm)        Gặp em từ thể đơn bào, rồi tiến hoá        Xa em từ khi thềm lục địa đầy biến hoá        Muốn được ôm em qua kỷ Ju-ra        Hoá thạch cùng nhau trên những phiến đá (phá đá cùng nhau)        Rồi loài người tìm thấy lửa, anh lại tìm thấy em        Anh tưởng rằng mọi thứ sẽ được bùng cháy lên        Muốn được cùng em, trồng rau bên hồ cá        Nhưng tim em lúc đó, đang là thời kì đồ đá        Anh đã tin vào em như tin vào thuyết nhật tâm        Như Ga-li-lê người ta nói anh thật hâm        Có lẽ Đác-win biết biển cả sẽ khô hơn        Nhưng anh tin ông ta không biết chúng ta đang tiến hoá để cô đơn (tiến hoá để cô đơn)        Và có lẽ Đác-win biết biển cả sẽ khô hơn        Nhưng anh tin ông ta không biết chúng ta đang tiến hoá để cô đơn (tiến hoá để cô đơn)", "Nghỉ hè vừa qua, em được về quê ngoại và thưởng thức một buổi bình minh rực rỡ trên quê hương yêu dấu. Buổi sớm hôm ấy thật là đẹp!", "Anh cô đơn giữa tinh không này        Muôn con sóng cuốn xô vào đây        Em cô đơn giữa mênh mông người        Và ta cô đơn đã hai triệu năm", "Ông mặt trời đỏ ối như một quả cầu lửa khổng lồ đã từ từ khuất hẳn phía xa. Trong xóm, mọi nhà đã lên đèn từ lúc nào. Bầu trời trong vắt, đen thẫm lại như khoác tấm áo nhung đen trên có đính những ngôi sao lấp lánh Sau luỹ tre làng, mặt trăng tròn vành vạnh nhô lên, toả ánh sáng vàng dịu lên những ngọn tre. Hàng trăm ngôi sao sáng long lanh, lúc ẩn lúc hiện tạo cho bầu trời một vẻ đẹp huyền ảo. Một lúc sau, trăng đã gối đầu lên rặng cây phía xa để rồi sau đó lấp ló trên ngọn tre già. Lúc này trăng đã lên cao, toả ánh sáng êm dịu len lỏi vào khắp các đường làng, ngõ xóm. Ánh trăng phết nhẹ lên các mái nhà, chiếu những tia sáng li ti qua các kẽ lá, soi xuống mặt đường như muôn vàn hạt ngọc nhỏ. Em và các bạn rủ nhau ra sông hóng mát, ngắm trăng. Chúng em đi đến đâu, trăng đi theo đến đó như muốn cùng đi chơi với chúng em. Ngoài bờ sông, gió lồng lộng thổi vào mát rượi. Dòng sông ven làng được ánh trăng soi sáng gợn sóng lăn tăn, mặt sông óng ánh lung linh như dát vàng.", "Mọi người trong xóm em đều tụ tập ở sân nhà để ngắm trăng. Trẻ em nô đùa chạy nhảy cười nói vui vẻ. Những chú chó cũng ra sân hóng mát, thỉnh thoảng lại ngó ra đường, cất tiếng sủa vu vơ. Ngoài đồng quang cảnh thật vắng lặng. Nước chảy róc rách trong các rãnh, mương nước. Hàng trăm anh đom đóm với những chiếc đèn lồng bé xíu toả ánh sáng nhấp nháy thật đẹp. Đó đây có tiếng côn trùng kêu ra rả. Cỏ cây thì thầm trò chuyện với nhau. Trời càng về khuya, quang cảnh càng yên ắng, tĩnh mịch hơn. Vạn vật say sưa chìm vào trong giấc ngủ êm đềm. Ánh trăng dìu dịu cùng hơi sương như đang ru ngủ muôn loài. Chỉ còn côn trùng vẫn cất tiếng ra rả cho khúc nhạc muôn thuở về đêm. Cảnh đêm trăng rằm mùa hạ thật đẹp.", "Giữa đồng quê, ngắm cảnh một đêm trăng đẹp như vậy, em cảm thấy yêu thiên nhiên, cảnh vật quê quê hương hơn. Em sẽ cố gắng học giỏi để sau này lớn lên xây dựng quê hương ngày càng giàu đẹp.", "Một năm có bốn mùa, mùa nào cũng có những đêm trăng đẹp. Thế nhưng em vẫn thích nhất là đêm trăng rằm vào mùa hạ."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "1 / 10"
        detailsLabel.text = contents[0]
        
        
    }

    @IBAction func rightButtonTouchUpInside(_ sender: UIButton) {
        if avatarScrollView.contentOffset.x >= avatarScrollView.contentSize.width - 240  {
            avatarScrollView.contentOffset.x = 0
            x = 1
            title = "1 / 10"
            detailsLabel.text = contents[x - 1]
        } else {
            avatarScrollView.contentOffset.x = avatarScrollView.contentOffset.x + 240
            x += 1
            title = "\(x) / 10"
            detailsLabel.text = contents[x - 1]
        }
    }
    
    @IBAction func leftButtonTouchUpInside(_ sender: UIButton) {
        if avatarScrollView.contentOffset.x < 240 {
            avatarScrollView.contentOffset.x = avatarScrollView.contentSize.width - 240
            title = "10 / 10"
            x = 10
            detailsLabel.text = contents[x - 1]
        } else {
            avatarScrollView.contentOffset.x -= 240
            x -= 1
            title = "\(x) / 10"
            detailsLabel.text = contents[x - 1]
        }
    }
}
