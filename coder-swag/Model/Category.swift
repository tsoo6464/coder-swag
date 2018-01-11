//
//  Category.swift
//  coder-swag
//
//  Created by Nan on 2018/1/11.
//  Copyright © 2018年 nan. All rights reserved.
//

import Foundation

struct Category {
    //這樣做可以讓屬性可以使用 但不能隨意設定
    private(set) public var title: String
    private(set) public var imageName: String
    //建構子
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
