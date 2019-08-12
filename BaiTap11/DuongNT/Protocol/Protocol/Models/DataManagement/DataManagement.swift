//
//  DataManagement.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import Foundation

class DataManagement {
    // MARK: - Signleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
    init() {
        
    }

    func getExercises(fileName: String, type: String) -> [Exercise] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var exercises: [Exercise] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = Exercise(name: dict.object(forKey: "name") as! String,
                              description: dict.object(forKey: "description") as! String)
            exercises.append(ex)
        }
        return exercises
    }

    func getMiens(fileName: String, type: String) -> [Mien] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var mienList: [Mien] = []
        //array chứa list tỉnh
        var tinhList: [Tinh] = []
        // array huyện
        var huyenList: [Huyen] = []
        //name để lấy tên miền
        var name: String = ""
        //tinhDictionary để chứa tạm list dictionary có tên tỉnh
        var tinhDictionary: [[String:Any]] = [[:]]
        //huyenDictionary để chứa tạm list dictionary có tên huyen
        var huyenDictionary: [[String:Any]] = [[:]]

        for item in array! {
            let dict = item as! NSDictionary
            //lấy tên của miền
            if let getName = dict["name"] {
                name = getName as! String
            }
            //lấy list tỉnh là 1 list dictionary
            if let getTinh = dict["tinh"] {
                tinhDictionary = getTinh as! [[String : Any]]
            }
            
            //lấy tên của từng tỉnh và insert vào array tỉnh
            for i in 0..<tinhDictionary.count {
                var nameTinh: String = ""
                if let getNameTinh = tinhDictionary[i]["name"] {
                    nameTinh = getNameTinh as! String
                }
                if let getHuyen = tinhDictionary[i]["huyen"] {
                    huyenDictionary = getHuyen as! [[String : Any]]
                }
                for temp in 0..<huyenDictionary.count {
                    if let huyen = huyenDictionary[temp]["name"] {
                        huyenList.append(Huyen(name: huyen as! String))
                    }
                }
                let tinh = Tinh(name: nameTinh, huyen: huyenList)
                tinhList.append(tinh)
            }
            let mien = Mien(name: name, tinh: tinhList)
            mienList.append(mien)
        }
        return mienList
    }

    // MARK: - Private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
