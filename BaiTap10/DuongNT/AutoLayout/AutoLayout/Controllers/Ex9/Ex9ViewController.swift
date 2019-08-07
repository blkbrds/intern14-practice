//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var imagesScrollView: UIScrollView!
    @IBOutlet weak var titleOffSetLabel: UILabel!

    // MARK: - Properties
    var exercise: Exercise?
    private let contentImage: [String] = ["Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。日本のスタートアップ特区でもある福岡にも支店を持ち、主に日本のクライアント様の開発実績が多数あります。モバイルアプリ、webアプリを中心にアジャイル型のスクラム開発を得意としています。スタートアップ 、ベンチャー企業の新サービスの開発を企画段階から一緒に考えて、デザイン・設計~開発・テスト~グロースハックまでワンストップで提供します。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。日本のスタートアップ特区でもある福岡にも支店を持ち、主に日本のクライアント様の開発実績が多数あります。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。日本のスタートアップ特区でもある福岡にも支店を持ち、主に日本のクライアント様の開発実績が多数あります。モバイルアプリ、webアプリを中心にアジャイル型のスクラム開発を得意としています。スタートアップ 、ベンチャー企業の新サービスの開発を企画段階から一緒に考えて、デザイン・設計~開発・テスト~グロースハックまでワンストップで提供します。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。日本のスタートアップ特区でもある福岡にも支店を持ち、主に日本のクライアント様の開発実績が多数あります。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。日本のスタートアップ特区でもある福岡にも支店を持ち、主に日本のクライアント様の開発実績が多数あります。",
                                          "Asian Techはベトナムのビーチリゾートダナンにあるソフトウェア開発会社です。"]

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        contentLabel.layer.borderWidth = 1
        contentLabel.layer.borderColor = UIColor.blue.cgColor
        buttons.forEach { button in
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 5
        }
        titleOffSetLabel.text = "\(Int((imagesScrollView.contentOffset.x / imagesScrollView.bounds.width) + 1))/10"
        contentLabel.text = contentImage[Int(imagesScrollView.contentOffset.x / imagesScrollView.bounds.width)]
        print(contentImage.count)
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: Actions
    @IBAction func buttonLeftActionTouchUpInside(_ button: UIButton) {
        let currentOffsetX = imagesScrollView.contentOffset.x
        if currentOffsetX == 0 {
            imagesScrollView.contentOffset.x = imagesScrollView.bounds.width * 9
        } else {
            imagesScrollView.contentOffset.x -= imagesScrollView.bounds.width
        }
        titleOffSetLabel.text = "\(Int((imagesScrollView.contentOffset.x / imagesScrollView.bounds.width) + 1))/10"
        contentLabel.text = contentImage[Int(imagesScrollView.contentOffset.x / imagesScrollView.bounds.width)]
    }
    @IBAction func buttonRightActionTouchUpInside(_ button: UIButton) {
        let currentOffsetX = imagesScrollView.contentOffset.x
        if currentOffsetX < imagesScrollView.bounds.width * 9 {
            imagesScrollView.contentOffset.x = imagesScrollView.bounds.width + currentOffsetX
        } else {
            imagesScrollView.contentOffset.x = 0
        }
        titleOffSetLabel.text = "\(Int((imagesScrollView.contentOffset.x / imagesScrollView.bounds.width) + 1))/10"
        contentLabel.text = contentImage[Int(imagesScrollView.contentOffset.x / imagesScrollView.bounds.width)]
    }
}
