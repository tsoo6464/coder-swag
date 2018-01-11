//
//  DataServices.swift
//  coder-swag
//
//  Created by Nan on 2018/1/11.
//  Copyright © 2018年 nan. All rights reserved.
//

import Foundation
//建立singleton單例
class DataService {
    //////////////////////////////////
    //使用singleton單例得時機
    //使用singleton通常都是具有唯一性 並且會不斷的被使用到
    //它的精神在於節省記憶體的使用量，原因是因為它具有唯一性，也就是在整個應用程式的生命週期中永遠都只會存在一個實體
    //////////////////////////////////
    static let instance = DataService()
    //所有分類要用圖片名稱資料 此資料設定為private 保障資料的安全 不會被任意修改
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
}
